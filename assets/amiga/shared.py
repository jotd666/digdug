from PIL import Image,ImageOps
import os,sys,bitplanelib,subprocess,json,pathlib

this_dir = pathlib.Path(__file__).absolute().parent

data_dir = this_dir / ".." / ".."
src_dir = this_dir / ".." / ".." / "src" / "amiga"
aga_src_dir = src_dir / "aga"
ocs_src_dir = src_dir / "ocs"
ecs_src_dir = src_dir / "ecs"

magenta = (254,0,254)
black = (0,0,0)
sheets_path = this_dir / ".." / "sheets"
dump_dir = this_dir / "dumps"

used_sprite_cluts_file = this_dir / "used_sprite_cluts.json"
used_tile_cluts_file = this_dir / "used_tile_cluts.json"
used_graphics_dir = this_dir / "used_graphics"

SPRITE_NB_TILES = 0x100
FG_NB_TILES = 0x200
FG_NB_CLUTS = 0x10
BG_NB_TILES = 0x100
BG_NB_CLUTS = 0x40
SPRITE_NB_CLUTS = 0x40

def dump_asm_bytes(*args,**kwargs):
    bitplanelib.dump_asm_bytes(*args,**kwargs,mit_format=True)


def ensure_empty(d):
    if os.path.exists(d):
        for f in os.listdir(d):
            os.remove(os.path.join(d,f))
    else:
        os.makedirs(d)

def palette_pad(palette,pad_nb):
    palette += (pad_nb-len(palette)) * [(0x10,0x20,0x30)]

def ensure_empty(d):
    if os.path.exists(d):
        for f in os.listdir(d):
            x = os.path.join(d,f)
            if os.path.isfile(x):
                os.remove(x)
    else:
        os.makedirs(d)

def ensure_exists(d):
    if os.path.exists(d):
        pass
    else:
        os.makedirs(d)

sr2 = lambda a,b : set(range(a,b,2))

player_sprite_pairs = ()
player_single_sprites = {}

group_sprite_pairs = ()

def set_names(rval,start,end,name):
    rval.update({i:name for i in range(start,end)})

def get_sprite_names():

    rval = {}

##    rval[0x155] = "blank"






    return rval


def get_mirror_sprites():
    """ return the index of the sprites that need mirroring
"""
    rval = {}
    return rval


def add_tile(table,index,cluts=[0]):
    if isinstance(index,range):
        pass
    elif not isinstance(index,(list,tuple)):
        index = [index]
    for idx in index:
        table[idx] = cluts

def get_possible_hw_sprites():
    dsy_sprites = get_double_size_y_sprites()
    dsx_sprites = get_double_size_x_sprites()
    dsxy_sprites = get_double_size_xy_sprites()
    possible_hw_sprites = set()
    sprite_names = get_sprite_names()
    for i in range(0,0x100):
        if i not in dsx_sprites and i not in dsxy_sprites:
            name = sprite_names.get(i,"unknown")
            if any(x in name for x in ("points","ghost","dragon","red_enemy","player")):
                possible_hw_sprites.add(i)
    return possible_hw_sprites

def split_bitplane_data(bitplane_data,actual_nb_planes,cache,width,height,y_start,next_cache_id):
    plane_size = len(bitplane_data) // actual_nb_planes
    bitplane_plane_ids = []
    for j in range(actual_nb_planes):
        offset = j*plane_size
        bitplane = bitplane_data[offset:offset+plane_size]

        cache_id = cache.get(bitplane)
        if cache_id is not None:
            bitplane_plane_ids.append(cache_id)
        else:
            if any(bitplane):
                cache[bitplane] = next_cache_id
                bitplane_plane_ids.append(next_cache_id)
                next_cache_id += 1
            else:
                bitplane_plane_ids.append(0)  # blank
    return {"width":width,"height":height,"y_start":y_start,"bitplanes":bitplane_plane_ids},next_cache_id


if __name__ == "__main__":
    raise Exception("no main!")