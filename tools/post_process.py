import re,pathlib

gamename = "digdug"

# game_specific: replace or remove I/O addresses
# if not done it will write in ROM here!!
input_dict = {

}

single_line_to_cc_protect = {0x0382,0x1a29,0x3b27,0x3bcf,0x3b41}
remove_error_in_next_line = {0x0383,0x1a2a,0x3D7C,0x3bd1,0x3b29,0x3b43,0x2387,0x29dc,0x3410,0x359d}
remove_error_in_prev_line = {0x01b4,0x0239,0x32f0,0x333e,0x34b3,0X34d8,0x38eb,0x391c,0x340f}
line_to_push_cc_protect = set() | single_line_to_cc_protect
line_to_pull_cc_protect = set() | single_line_to_cc_protect

store_to_video = re.compile("GET_ADDRESS\s+(0xd\w\w\w|video_ram_d)",flags=re.I)   # game_specific


# post-conversion automatic patches, allowing not to change the asm file by hand
tablere = re.compile("move.w\t#(\w*table_....),d(.)")
jmpre = re.compile("(j..)\s+\[a,(.)\]")
dreg_dict = {'a':'d0','b':'d1'}
areg_dict = {'x':'a2','y':'a3','u':'a4'}



def remove_continuing_lines(lines,i):
    for j in range(i+1,i+4):
        if "[...]" in lines[j]:
            lines[j] = ""
        else:
            break


def get_line_address(line):
    try:
        toks = line.split("|")
        address = toks[1].strip(" [$").split(":")[0]
        return int(address,16)
    except (ValueError,IndexError):
        return None

def remove_continuing_lines(lines,i):
    for j in range(i+1,i+4):
        if "[...]" in lines[j]:
            lines[j] = ""
        else:
            break


def change_instruction(code,lines,i,continuing_lines=True):
    line = lines[i]
    toks = line.split("|")
    if len(toks)==2:
        toks[0] = f"\t{code}"
        if continuing_lines:
            remove_continuing_lines(lines,i)
        return " | ".join(toks)
    return line

def remove_error(line,ignore=False):
    if "ERROR" in line:
        return ""
    elif not ignore:
        raise Exception(f"No ERROR to remove in {line}")
    else:
        return line
def remove_instruction(lines,i,continuing_lines=True):
    return change_instruction("",lines,i,continuing_lines=continuing_lines)

def remove_continuing_lines(lines,i):
    for j in range(i+1,i+4):
        if "[...]" in lines[j]:
            lines[j] = ""
        else:
            break



def process_jump_table(line):

    m = re.search("\[nb_entries=(\d+)",line)
    if m:
        nb_entries = m.group(1)
        line = f"""\t.ifndef\tRELEASE
\tmove.w\t#{nb_entries},d7
\t.endif
"""+line

    return line

def get_original_instruction(line):
    toks = line.split("| [")
    if len(toks)==1:
        return ""
    inst = toks[1][7:].split("]")[0]
    return inst


def remove_code(pattern,lines,i):
    if pattern in lines[i]:
        lines[i] = remove_instruction(lines,i)
        remove_continuing_lines(lines,i)
    return lines[i]

def rebuild_lines(lines):
    return "".join(lines).splitlines(True)

def swap_lines(lines,i,j):
    lines[i],lines[j] = lines[j].rstrip()+ "| swapped\n",lines[i].rstrip()+ "| swapped\n"
    return lines[i]

def kill_code(lines,start_line,end_address):
    while True:
        address = get_line_address(lines[start_line])
        lines[start_line] = remove_instruction(lines,start_line)
        if "|" not in lines[start_line]:
            lines[start_line] = ""
        if address == end_address:
            break
        start_line+=1

def subt(m):
    tn = m.group(1)
    rn = m.group(2)
    offset = tn.split("_")[-1]
    rval = f"""
\t.ifndef\tRELEASE
\tmove.w\t#0x{offset},d{rn}
\t.endif
\tlea\t{tn},a{rn}"""
    return rval

equates = []
global_symbols = []
equates_re = re.compile("(\w+)\s*=\s*(\$?\w+)")
this_dir = pathlib.Path(__file__).absolute().parent

source_dir = this_dir / "../src"

# various dirty but at least automatic patches applying on the converted code
with open(source_dir / "conv.s") as f:
    lines = list(f)

    for i,line in enumerate(lines):
        m = equates_re.match(line)
        if m:
            equates.append(line)
            line = ""


##        elif "review stray daa" in line:
##            line = """\tCLR_XC_FLAGS
##\tmove.b\t(a0),d6
##\tabcd\td6,d0
##"""
        address = get_line_address(line)

        if "[address_pop]" in line:
            if "MAKE_" in line:
                line = ""
            else:
                line = change_instruction("addq.w\t#4,sp",lines,i)

        elif "[return]" in line:
            if "MAKE_" in line:
                line = ""
            else:
                line = change_instruction("rts",lines,i)

        elif "[nop]" in line:
            line = remove_instruction(lines,i)

        elif "[breakpoint]" in line and address:
            line = f'\tBREAKPOINT "{address:04x}"\n{line}'

        elif "[cc_ok]" in line:
            if "rts" in line and "ret]" not in line: # conditional return
                lines[i-1] = remove_error(lines[i-1],True)
            else:
                lines[i+1] = remove_error(lines[i+1],True)


        line = process_jump_table(line)

        if "[push_function]" in line:
            toks = line.split()
            line = remove_instruction(lines,i)
            pa = toks[1].strip("#")
            lines[i+1] = change_instruction(f"pea\t{pa}",lines,i+1)

        # pre-add video_address tag if we find a store instruction to an explicit 3000-3FFF address
        m = store_to_video.search(line)
        if m:
            g = m.group(1)
            okay = True
            if g.startswith("0x"):
                address = int(g,16)
                line = line.rstrip() + " [video_address]\n"

        if "[video_address" in line or "[unchecked_address" in line:
            # give me the original instruction
            line = line.replace("_ADDRESS","_UNCHECKED_ADDRESS")
            if "MAKE" in line:
                line = re.sub(r"(MAKE_AR)",r"\1_UNCHECKED",line)
                line = re.sub(r"(MAKE_[HDB]\w)",r"\1_UNCHECKED",line)
            elif "MAKE" in lines[i-1] and "UNCHECKED" not in lines[i-1]:
                lines[i-1] = re.sub(r"(MAKE_AR)",r"\1_UNCHECKED",lines[i-1])
                lines[i-1] = re.sub(r"(MAKE_[HDB]\w)",r"\1_UNCHECKED",lines[i-1])
            elif "ldir" in line:
                line = line.replace("ldir","ldir_video" if "[video_address" in line else "ldir_unchecked")
            if "[video_address" in line:
                if ",(a0)" in line or ("(a0)" in line and "clr.b" in line):
                    line += "\tVIDEO_BYTE_DIRTY | [...]\n"
                elif (",(a0)" in lines[i+1] or ("(a0)" in  lines[i+1]  and "clr.b" in lines[i+1] )):
                    lines[i+1]  += "\tVIDEO_BYTE_DIRTY | [...]\n"

        if "[pop_stack]" in line:
            line = change_instruction("addq\t#4,sp",lines,i)

        ###############################################
        # game_specific

        if "replace by EXG_A_A_PRIME" in line:
            # no need to swap F with F', ever in this game
            lines[i-1] = "* just swap A/A'\n"+change_instruction("EXG_A_A_PRIME",lines,i-1)
            line = remove_error(line)
        if "unsupported instruction im" in line:
            line = remove_error(line)
        if address == 0x8:
            line = """    MAKE_HL_NO_AR
    and.w #0xFF,d0
    add.w   d0,d0
    add.w    d0,d6
    MAKE_H
    rts

"""
        elif address == 0x10:
            line = """    MAKE_HL_NO_AR
    and.w #0xFF,d0
    add.w    d0,d6
    move.b    d6,d0   | so routine is equivalent to original
    MAKE_H
    rts

"""
            lines[i+3] = remove_error(lines[i+3])
        elif address == 0x3d7a:
            line = swap_lines(lines,i,i-1)
        elif address == 0x359b:
            line = swap_lines(lines,i,i-2)
            line = "\ttst.b\t(a0)  | [$359a: and  a]\n"

        elif address in {0x01b4,0x239,0X38eb,0x391c}:
            # stack shit
            line = remove_instruction(lines,i)

        elif address in {0x32f0,0x34d8}:
            line = change_instruction("SAVE_STACK",lines,i)
        elif address in {0x333e,0x34b3}:
            line = change_instruction("RESTORE_STACK",lines,i)
        elif address == 0x36e9:
            line = """\tsub.b\t#0x20,d4
\tjcc\t0f
\tsubq.b\t#1,d3
0:
\trts
"""
            kill_code(lines,i+1,0X36ef)
        # sub in one take
        elif address in {0X2384,0x29d9}:
            lines[i+1] = change_instruction("sub.b\td1,(a0)",lines,i+1)
            lines[i+2] = remove_instruction(lines,i+1)
        elif address in {0X2386,0x29db}:
            line = remove_instruction(lines,i)
        elif address == 0x340f:
            line = remove_instruction(lines,i,False)  # optim
            line = "\tPUSH_SR\n"
            lines[i+1] += "\tPOP_SR\n"

        # end game_specific
        ###############################################
        if address in line_to_pull_cc_protect:
            # protect the sub instructions
            line += "\tPOP_SR\n"
        if address in line_to_push_cc_protect:
            # protect the sub instructions
            line = "\tPUSH_SR\n"+line
        elif address in remove_error_in_prev_line:
            lines[i-1] = remove_error(lines[i-1])
        elif address in remove_error_in_next_line:
            lines[i+1] = remove_error(lines[i+1])
        if "GET_ADDRESS" in line:
            val = line.split()[1].split(",")[0]
            osd_call = input_dict.get(val)
            if osd_call is not None:

                if osd_call:
                    line = change_instruction(f"jbsr\tosd_{osd_call}",lines,i)
                else:
                    line = remove_instruction(lines,i)
                lines[i+1] = remove_instruction(lines,i+1)

        if "[global]" in line:
            label = line.split(":")[0]
            global_symbols.append(label)

        lines[i] = line

    # remove duplicate VIDEO_BYTE_DIRTY
    lines = rebuild_lines(lines)
    new_lines = []
    prev_line = ""
    for line in lines:
        if "VIDEO_BYTE_DIRTY" in line and "VIDEO_BYTE_DIRTY" in prev_line:
            pass
        else:
            new_lines.append(line)
        prev_line = line

with open(source_dir / "data.inc","w") as fw:
    fw.writelines(equates)

with open(source_dir / f"{gamename}.68k","w") as fw:

    fw.write(f"""\t.include "data.inc"
""")
    for g in global_symbols:
        fw.write(f"\t.global\t{g}\n")

    fw.writelines(new_lines)
