;	map(0x0000, 0x3fff).rom().nopw();         /* the only area different for each CPU */
;	map(0x6800, 0x681f).w(m_namco_sound, FUNC(namco_device::pacman_sound_w));
;	map(0x6820, 0x6827).w("misclatch", FUNC(ls259_device::write_d0));
;	map(0x6830, 0x6830).w("watchdog", FUNC(watchdog_timer_device::reset_w));
;	map(0x7000, 0x70ff).rw("06xx", FUNC(namco_06xx_device::data_r), FUNC(namco_06xx_device::data_w));
;	map(0x7100, 0x7100).rw("06xx", FUNC(namco_06xx_device::ctrl_r), FUNC(namco_06xx_device::ctrl_w));
;	map(0x8000, 0x83ff).ram().w(FUNC(digdug_state::digdug_videoram_w)).share("videoram"); /* tilemap RAM (bottom half of RAM 0 */
;	map(0x8400, 0x87ff).ram().share("share1");                          /* work RAM (top half for RAM 0 */
;	map(0x8800, 0x8bff).ram().share("digdug_objram");   /* work RAM + sprite registers */
;	map(0x9000, 0x93ff).ram().share("digdug_posram");   /* work RAM + sprite registers */
;	map(0x9800, 0x9bff).ram().share("digdug_flpram");   /* work RAM + sprite registers */
;	map(0xa000, 0xa007).nopr().w(m_videolatch, FUNC(ls259_device::write_d0));   /* video latches (spurious reads when setting latch bits) */
;	map(0xb800, 0xb83f).rw(FUNC(digdug_state::earom_read), FUNC(digdug_state::earom_write));   /* non volatile memory data */
;	map(0xb840, 0xb840).w(FUNC(digdug_state::earom_control_w));                    /* non volatile memory control */
;
;	PORT_START("IN0")
;	PORT_BIT( 0x01, IP_ACTIVE_LOW, IPT_JOYSTICK_UP ) PORT_4WAY
;	PORT_BIT( 0x02, IP_ACTIVE_LOW, IPT_JOYSTICK_RIGHT ) PORT_4WAY
;	PORT_BIT( 0x04, IP_ACTIVE_LOW, IPT_JOYSTICK_DOWN ) PORT_4WAY
;	PORT_BIT( 0x08, IP_ACTIVE_LOW, IPT_JOYSTICK_LEFT ) PORT_4WAY
;	PORT_BIT( 0x10, IP_ACTIVE_LOW, IPT_JOYSTICK_UP ) PORT_4WAY PORT_COCKTAIL
;	PORT_BIT( 0x20, IP_ACTIVE_LOW, IPT_JOYSTICK_RIGHT ) PORT_4WAY PORT_COCKTAIL
;	PORT_BIT( 0x40, IP_ACTIVE_LOW, IPT_JOYSTICK_DOWN ) PORT_4WAY PORT_COCKTAIL
;	PORT_BIT( 0x80, IP_ACTIVE_LOW, IPT_JOYSTICK_LEFT ) PORT_4WAY PORT_COCKTAIL
;
;	PORT_START("IN1")
;	PORT_BIT( 0x01, IP_ACTIVE_LOW, IPT_BUTTON1 )
;	PORT_BIT( 0x02, IP_ACTIVE_LOW, IPT_BUTTON1 ) PORT_COCKTAIL
;	PORT_BIT( 0x04, IP_ACTIVE_LOW, IPT_START1 )
;	PORT_BIT( 0x08, IP_ACTIVE_LOW, IPT_START2 )
;	PORT_BIT( 0x10, IP_ACTIVE_LOW, IPT_COIN1 )
;	PORT_BIT( 0x20, IP_ACTIVE_LOW, IPT_COIN2 )
;	PORT_BIT( 0x40, IP_ACTIVE_LOW, IPT_SERVICE1 )
;	PORT_SERVICE( 0x80, IP_ACTIVE_LOW )
;
;	PORT_START("DSWA")
;	PORT_DIPNAME( 0x07, 0x01, DEF_STR( Coin_B ) )       PORT_DIPLOCATION("SWA:1,2,3")
;	PORT_DIPSETTING(    0x07, DEF_STR( 3C_1C ) )
;	PORT_DIPSETTING(    0x03, DEF_STR( 2C_1C ) )
;	PORT_DIPSETTING(    0x01, DEF_STR( 1C_1C ) )
;	PORT_DIPSETTING(    0x05, DEF_STR( 2C_3C ) )
;	PORT_DIPSETTING(    0x06, DEF_STR( 1C_2C ) )
;	PORT_DIPSETTING(    0x02, DEF_STR( 1C_3C ) )
;	PORT_DIPSETTING(    0x04, DEF_STR( 1C_6C ) )
;	PORT_DIPSETTING(    0x00, DEF_STR( 1C_7C ) )
;	PORT_DIPNAME( 0x38, 0x18, DEF_STR( Bonus_Life ) )   PORT_DIPLOCATION("SWA:4,5,6")
;	PORT_DIPSETTING(    0x20, "10K, 40K, Every 40K" )   PORT_CONDITION("DSWA",0xc0,NOTEQUALS,0xc0) // Atari factory default = "10K, 40K, Every40K"
;	PORT_DIPSETTING(    0x10, "10K, 50K, Every 50K" )   PORT_CONDITION("DSWA",0xc0,NOTEQUALS,0xc0)
;	PORT_DIPSETTING(    0x30, "20K, 60K, Every 60K" )   PORT_CONDITION("DSWA",0xc0,NOTEQUALS,0xc0)
;	PORT_DIPSETTING(    0x08, "20K, 70K, Every 70K" )   PORT_CONDITION("DSWA",0xc0,NOTEQUALS,0xc0)
;	PORT_DIPSETTING(    0x28, "10K and 40K Only" )      PORT_CONDITION("DSWA",0xc0,NOTEQUALS,0xc0)
;	PORT_DIPSETTING(    0x18, "20K and 60K Only" )      PORT_CONDITION("DSWA",0xc0,NOTEQUALS,0xc0) // Namco factory default = "20K, 60K"
;	PORT_DIPSETTING(    0x38, "10K Only" )              PORT_CONDITION("DSWA",0xc0,NOTEQUALS,0xc0)
;	PORT_DIPSETTING(    0x00, DEF_STR( None ) )         PORT_CONDITION("DSWA",0xc0,NOTEQUALS,0xc0)
;	PORT_DIPSETTING(    0x20, "20K, 60K, Every 60K" )   PORT_CONDITION("DSWA",0xc0,EQUALS,0xc0)
;	PORT_DIPSETTING(    0x10, "30K, 80K, Every 80K" )   PORT_CONDITION("DSWA",0xc0,EQUALS,0xc0)
;	PORT_DIPSETTING(    0x30, "20K and 50K Only" )      PORT_CONDITION("DSWA",0xc0,EQUALS,0xc0)
;	PORT_DIPSETTING(    0x08, "20K and 60K Only" )      PORT_CONDITION("DSWA",0xc0,EQUALS,0xc0)
;	PORT_DIPSETTING(    0x28, "30K and 70K Only" )      PORT_CONDITION("DSWA",0xc0,EQUALS,0xc0)
;	PORT_DIPSETTING(    0x18, "20K Only" )              PORT_CONDITION("DSWA",0xc0,EQUALS,0xc0)
;	PORT_DIPSETTING(    0x38, "30K Only" )              PORT_CONDITION("DSWA",0xc0,EQUALS,0xc0)
;	PORT_DIPSETTING(    0x00, DEF_STR( None ) )         PORT_CONDITION("DSWA",0xc0,EQUALS,0xc0)
;	PORT_DIPNAME( 0xc0, 0x80, DEF_STR( Lives ) )        PORT_DIPLOCATION("SWA:7,8")
;	PORT_DIPSETTING(    0x00, "1" )
;	PORT_DIPSETTING(    0x40, "2" )
;	PORT_DIPSETTING(    0x80, "3" ) // factory default = "3"
;	PORT_DIPSETTING(    0xc0, "5" )
;
;	PORT_START("DSWB") // reverse order against SWA
;	PORT_DIPNAME( 0xc0, 0x00, DEF_STR( Coin_A ) )           PORT_DIPLOCATION("SWB:1,2")
;	PORT_DIPSETTING(    0x40, DEF_STR( 2C_1C ) )
;	PORT_DIPSETTING(    0x00, DEF_STR( 1C_1C ) )
;	PORT_DIPSETTING(    0xc0, DEF_STR( 2C_3C ) )
;	PORT_DIPSETTING(    0x80, DEF_STR( 1C_2C ) )
;	PORT_DIPNAME( 0x20, 0x20, "Freeze" )                    PORT_DIPLOCATION("SWB:3")
;	PORT_DIPSETTING(    0x20, DEF_STR( Off ) )
;	PORT_DIPSETTING(    0x00, DEF_STR( On ) )
;	PORT_DIPNAME( 0x10, 0x00, DEF_STR( Demo_Sounds ) )      PORT_DIPLOCATION("SWB:4")
;	PORT_DIPSETTING(    0x10, DEF_STR( Off ) )
;	PORT_DIPSETTING(    0x00, DEF_STR( On ) )
;	PORT_DIPNAME( 0x08, 0x00, DEF_STR( Allow_Continue ) )   PORT_DIPLOCATION("SWB:5")
;	PORT_DIPSETTING(    0x08, DEF_STR( No ) ) // factory default = "No"
;	PORT_DIPSETTING(    0x00, DEF_STR( Yes ) )
;	PORT_DIPNAME( 0x04, 0x04, DEF_STR( Cabinet ) )          PORT_DIPLOCATION("SWB:6")
;	PORT_DIPSETTING(    0x04, DEF_STR( Upright ) )
;	PORT_DIPSETTING(    0x00, DEF_STR( Cocktail ) )
;	PORT_DIPNAME( 0x03, 0x00, DEF_STR( Difficulty ) )       PORT_DIPLOCATION("SWB:7,8")
;	PORT_DIPSETTING(    0x00, DEF_STR( Easy ) )
;	PORT_DIPSETTING(    0x02, DEF_STR( Medium ) )
;	PORT_DIPSETTING(    0x01, DEF_STR( Hard ) )
;	PORT_DIPSETTING(    0x03, DEF_STR( Hardest ) )


player_1_score_8414 = $8414
player_2_score_8417 = $8417
watchdog_6830 = $6830
player_1_lives_840a = $840a
player_2_lives_840b = $840b

0000: F3          di
0001: ED 56       im   1
0003: C3 E6 00    jp   $00E6

0008: 87          add  a,a
0009: 30 05       jr   nc,$0010
000B: 24          inc  h
000C: C3 10 00    jp   $0010
000F: 00          nop
0010: 85          add  a,l
0011: 6F          ld   l,a
0012: D0          ret  nc
0013: 24          inc  h
0014: C9          ret
0015: 00          nop
0016: 00          nop
0017: 00          nop
0018: C0          ret  nz
0019: 3E 9C       ld   a,$9C
001B: 77          ld   (hl),a
001C: C9          ret
001D: 00          nop
001E: 00          nop
001F: 00          nop
0020: FE 64       cp   $64
0022: D8          ret  c
0023: D6 64       sub  $64
0025: 18 F9       jr   $0020
0027: 00          nop

; 1/60th seconds
irq_0038:
0038: C3 80 02    jp   $0280

watchdog_delay_005a:
005A: 21 00 60    ld   hl,$6000
005D: 32 30 68    ld   (watchdog_6830),a
0060: 2B          dec  hl
0061: 7D          ld   a,l
0062: B4          or   h
0063: 20 F8       jr   nz,$005D
0065: C9          ret

; called twice as much as irq: 1/120s!!
dequeue_006c:
006C: F5          push af
006D: 2A 00 89    ld   hl,($8900)
0070: 7E          ld   a,(hl)
0071: A7          and  a
0072: CA 98 00    jp   z,$0098
0075: 36 00       ld   (hl),$00
0077: F5          push af
0078: 2C          inc  l
0079: 2C          inc  l
007A: 4E          ld   c,(hl)
007B: 2C          inc  l
007C: 46          ld   b,(hl)
007D: 2C          inc  l
007E: 5E          ld   e,(hl)
007F: 2C          inc  l
0080: 56          ld   d,(hl)
0081: 2C          inc  l
0082: 7E          ld   a,(hl)
0083: 2C          inc  l
0084: 2C          inc  l
0085: 22 00 89    ld   ($8900),hl
0088: 2D          dec  l
0089: 66          ld   h,(hl)
008A: 6F          ld   l,a
008B: 3E 10       ld   a,$10
008D: 32 00 71    ld   ($7100),a
0090: F1          pop  af
0091: D9          exx
0092: 32 00 71    ld   ($7100),a
0095: F1          pop  af
0096: ED 45       retn
0098: 3E 10       ld   a,$10
009A: 32 00 71    ld   ($7100),a
009D: F1          pop  af
009E: D9          exx
009F: ED 45       retn

enqueue_00a1:
00A1: 08          ex   af,af'
00A2: F3          di
00A3: 3A 00 71    ld   a,($7100)
00A6: E6 E0       and  $E0
00A8: 20 07       jr   nz,$00B1
00AA: 08          ex   af,af'
00AB: D9          exx
00AC: 32 00 71    ld   ($7100),a
00AF: FB          ei
00B0: C9          ret
00B1: E5          push hl
00B2: D5          push de
00B3: EB          ex   de,hl
00B4: 2A 02 89    ld   hl,($8902)
00B7: 7D          ld   a,l
00B8: C6 08       add  a,$08
00BA: 6F          ld   l,a
00BB: 22 02 89    ld   ($8902),hl
00BE: 2D          dec  l
00BF: 72          ld   (hl),d
00C0: 2D          dec  l
00C1: 73          ld   (hl),e
00C2: 2D          dec  l
00C3: D1          pop  de
00C4: 72          ld   (hl),d
00C5: 2D          dec  l
00C6: 73          ld   (hl),e
00C7: 2D          dec  l
00C8: 70          ld   (hl),b
00C9: 2D          dec  l
00CA: 71          ld   (hl),c
00CB: 32 30 68    ld   (watchdog_6830),a
00CE: 2D          dec  l
00CF: 2D          dec  l
00D0: 08          ex   af,af'
00D1: 77          ld   (hl),a
00D2: 3A 00 71    ld   a,($7100)
00D5: FE 10       cp   $10
00D7: 28 03       jr   z,$00DC
00D9: E1          pop  hl
00DA: FB          ei
00DB: C9          ret
00DC: 7E          ld   a,(hl)
00DD: 36 00       ld   (hl),$00
00DF: 22 02 89    ld   ($8902),hl
00E2: E1          pop  hl
00E3: C3 AA 00    jp   $00AA
00E6: 3E 10       ld   a,$10
00E8: 32 00 71    ld   ($7100),a
00EB: 32 00 70    ld   ($7000),a
00EE: 21 20 68    ld   hl,$6820
00F1: 77          ld   (hl),a
00F2: 23          inc  hl
00F3: 77          ld   (hl),a
00F4: 23          inc  hl
00F5: 36 01       ld   (hl),$01
00F7: 23          inc  hl
00F8: 77          ld   (hl),a
00F9: 3C          inc  a
00FA: 32 30 68    ld   (watchdog_6830),a
00FD: 23          inc  hl
00FE: 23          inc  hl
00FF: 3E FF       ld   a,$FF
0101: 77          ld   (hl),a
0102: 23          inc  hl
0103: 77          ld   (hl),a
0104: 23          inc  hl
0105: 77          ld   (hl),a
0106: AF          xor  a
0107: 21 E0 89    ld   hl,$89E0
010A: 06 0B       ld   b,$0B
010C: 77          ld   (hl),a
010D: 23          inc  hl
010E: 10 FC       djnz $010C
0110: 21 EF 89    ld   hl,$89EF
0113: 06 04       ld   b,$04
0115: 77          ld   (hl),a
0116: 23          inc  hl
0117: 10 FC       djnz $0115
0119: C3 7E 38    jp   $387E
011C: F3          di
011D: AF          xor  a
011E: 32 20 68    ld   ($6820),a
0121: 21 07 A0    ld   hl,$A007
0124: 77          ld   (hl),a
0125: 21 1B 9B    ld   hl,$9B1B
0128: 36 10       ld   (hl),$10
012A: 3E 88       ld   a,$88
012C: 21 00 84    ld   hl,$8400
012F: 36 00       ld   (hl),$00
0131: 32 30 68    ld   (watchdog_6830),a
0134: 23          inc  hl
0135: BC          cp   h
0136: 20 F7       jr   nz,$012F
0138: 3E 94       ld   a,$94
013A: 21 00 90    ld   hl,$9000
013D: 36 00       ld   (hl),$00
013F: 32 30 68    ld   (watchdog_6830),a
0142: 23          inc  hl
0143: BC          cp   h
0144: 20 F7       jr   nz,$013D
0146: 21 33 9B    ld   hl,$9B33
0149: 36 00       ld   (hl),$00
014B: 21 80 9A    ld   hl,$9A80
014E: 06 20       ld   b,$20
0150: 36 00       ld   (hl),$00
0152: 32 30 68    ld   (watchdog_6830),a
0155: 23          inc  hl
0156: 10 F8       djnz $0150
0158: 21 00 98    ld   hl,$9800
015B: 01 80 01    ld   bc,$0180
015E: 32 30 68    ld   (watchdog_6830),a
0161: 36 00       ld   (hl),$00
0163: 23          inc  hl
0164: 0B          dec  bc
0165: 78          ld   a,b
0166: B1          or   c
0167: 20 F5       jr   nz,$015E
0169: 3E 01       ld   a,$01
016B: 32 23 68    ld   ($6823),a
016E: 3A D0 89    ld   a,($89D0)
0171: FE 00       cp   $00
0173: CA 00 00    jp   z,$0000
0176: FE FF       cp   $FF
0178: 20 08       jr   nz,$0182
017A: 3E 00       ld   a,$00
017C: 32 C0 87    ld   ($87C0),a
017F: C3 B4 01    jp   $01B4
0182: 21 AA 85    ld   hl,$85AA
0185: 36 00       ld   (hl),$00
0187: 23          inc  hl
0188: E6 0F       and  $0F
018A: 77          ld   (hl),a
018B: 3A D1 89    ld   a,($89D1)
018E: FE FF       cp   $FF
0190: 20 08       jr   nz,$019A
0192: 3E 01       ld   a,$01
0194: 32 C0 87    ld   ($87C0),a
0197: C3 B4 01    jp   $01B4
019A: 47          ld   b,a
019B: 21 AC 85    ld   hl,$85AC
019E: 36 00       ld   (hl),$00
01A0: 23          inc  hl
01A1: E6 0F       and  $0F
01A3: 77          ld   (hl),a
01A4: 78          ld   a,b
01A5: E6 F0       and  $F0
01A7: FE 10       cp   $10
01A9: 20 04       jr   nz,$01AF
01AB: 3E 02       ld   a,$02
01AD: 18 02       jr   $01B1
01AF: 3E 03       ld   a,$03
01B1: 32 C0 87    ld   ($87C0),a
01B4: 31 00 9A    ld   sp,$9A00
01B7: CD 5A 00    call watchdog_delay_005a
01BA: 21 00 88    ld   hl,$8800
01BD: 22 00 89    ld   ($8900),hl
01C0: 22 02 89    ld   ($8902),hl
01C3: AF          xor  a
01C4: 21 00 A0    ld   hl,$A000
01C7: 06 04       ld   b,$04
01C9: 36 00       ld   (hl),$00
01CB: 23          inc  hl
01CC: 10 FB       djnz $01C9
01CE: CD 5A 00    call watchdog_delay_005a
01D1: 21 04 89    ld   hl,$8904
01D4: 06 04       ld   b,$04
01D6: 36 02       ld   (hl),$02
01D8: 23          inc  hl
01D9: 10 FB       djnz $01D6
01DB: 21 04 89    ld   hl,$8904
01DE: 11 00 70    ld   de,$7000
01E1: 01 04 00    ld   bc,$0004
01E4: 3E C1       ld   a,$C1
01E6: CD A1 00    call enqueue_00a1
01E9: CD A6 15    call $15A6
01EC: 21 00 80    ld   hl,$8000
01EF: 06 40       ld   b,$40
01F1: 36 7F       ld   (hl),$7F
01F3: 23          inc  hl
01F4: 32 30 68    ld   (watchdog_6830),a
01F7: 10 F8       djnz $01F1
01F9: 21 ED 83    ld   hl,$83ED
01FC: 11 09 00    ld   de,$0009
01FF: 06 02       ld   b,$02
0201: 3E 10       ld   a,$10
0203: 77          ld   (hl),a
0204: 23          inc  hl
0205: 77          ld   (hl),a
0206: 19          add  hl,de
0207: 10 FA       djnz $0203
0209: CD A3 19    call $19A3
020C: CD 4F 14    call $144F
020F: CD 32 14    call $1432
0212: 3E FF       ld   a,$FF
0214: 32 87 87    ld   ($8787),a
0217: 21 27 89    ld   hl,$8927
021A: 11 AE 89    ld   de,$89AE
021D: 06 03       ld   b,$03
021F: 1A          ld   a,(de)
0220: 77          ld   (hl),a
0221: 23          inc  hl
0222: 1B          dec  de
0223: 10 FA       djnz $021F
0225: CD DE 14    call $14DE
0228: 3E 01       ld   a,$01
022A: 21 A9 87    ld   hl,$87A9
022D: 77          ld   (hl),a
022E: 23          inc  hl
022F: 77          ld   (hl),a
0230: 23          inc  hl
0231: 77          ld   (hl),a
0232: 32 05 9A    ld   ($9A05),a
0235: 32 20 68    ld   ($6820),a
mainloop_0238:
0238: FB          ei
0239: 31 00 9A    ld   sp,$9A00
023C: 21 00 84    ld   hl,$8400
023F: CB 4E       bit  1,(hl)
0241: 20 08       jr   nz,$024B
0243: 21 14 84    ld   hl,player_1_score_8414
0246: 3A 0D 84    ld   a,($840D)
0249: 18 06       jr   $0251
024B: 21 17 84    ld   hl,player_2_score_8417
024E: 3A 0E 84    ld   a,($840E)
0251: 47          ld   b,a
0252: 3A CC 87    ld   a,($87CC)
0255: CB 4F       bit  1,a
0257: 28 19       jr   z,$0272
0259: CB 57       bit  2,a
025B: 20 15       jr   nz,$0272
025D: 78          ld   a,b
025E: E5          push hl
025F: F5          push af
0260: CD F2 0B    call $0BF2
0263: F1          pop  af
0264: E1          pop  hl
0265: CD F0 32    call $32F0
0268: 21 03 A0    ld   hl,$A003
026B: 36 00       ld   (hl),$00
026D: 21 CC 87    ld   hl,$87CC
0270: CB 8E       res  1,(hl)
0272: 21 CC 87    ld   hl,$87CC
0275: CB 46       bit  0,(hl)
0277: 28 05       jr   z,$027E
0279: CB 86       res  0,(hl)
027B: CD E3 35    call $35E3
027E: 18 B8       jr   mainloop_0238

0280: DD E5       push ix
0282: FD E5       push iy
0284: E5          push hl
0285: D5          push de
0286: C5          push bc
0287: F5          push af
0288: AF          xor  a
0289: 32 20 68    ld   ($6820),a
028C: 32 30 68    ld   (watchdog_6830),a
028F: 3A 9A 87    ld   a,($879A)
0292: A7          and  a
0293: 20 2B       jr   nz,$02C0
0295: 21 00 98    ld   hl,$9800
0298: 11 80 8B    ld   de,$8B80
029B: 01 80 00    ld   bc,$0080
029E: C5          push bc
029F: ED B0       ldir
02A1: C1          pop  bc
02A2: 21 00 99    ld   hl,$9900
02A5: 11 80 9B    ld   de,$9B80
02A8: ED B0       ldir
02AA: 3A CF 87    ld   a,($87CF)
02AD: CB 6F       bit  5,a
02AF: CA 27 0A    jp   z,$0A27
02B2: 3A 8E 89    ld   a,($898E)
02B5: 21 00 84    ld   hl,$8400
02B8: 2F          cpl
02B9: E6 04       and  $04
02BB: B6          or   (hl)
02BC: 77          ld   (hl),a
02BD: CD B1 0B    call $0BB1
02C0: 2A 23 84    ld   hl,($8423)
02C3: 23          inc  hl
02C4: 22 23 84    ld   ($8423),hl
02C7: 3A 9A 87    ld   a,($879A)
02CA: A7          and  a
02CB: 20 06       jr   nz,$02D3
02CD: 3A A5 85    ld   a,($85A5)
02D0: 32 A6 85    ld   ($85A6),a
02D3: 21 00 70    ld   hl,$7000
02D6: 11 A7 85    ld   de,$85A7
02D9: 01 03 00    ld   bc,$0003
02DC: 3E 71       ld   a,$71
02DE: CD A1 00    call enqueue_00a1
02E1: 3A 9A 87    ld   a,($879A)
02E4: A7          and  a
02E5: C2 27 0A    jp   nz,$0A27
02E8: 21 A7 87    ld   hl,$87A7
02EB: CB 46       bit  0,(hl)
02ED: 28 26       jr   z,$0315
02EF: CB 86       res  0,(hl)
02F1: 21 11 84    ld   hl,$8411
02F4: AF          xor  a
02F5: 77          ld   (hl),a
02F6: 23          inc  hl
02F7: 3A E7 87    ld   a,($87E7)
02FA: 77          ld   (hl),a
02FB: 23          inc  hl
02FC: AF          xor  a
02FD: 77          ld   (hl),a
02FE: CD C8 2F    call $2FC8
0301: 3A 57 86    ld   a,($8657)
0304: CB 4F       bit  1,a
0306: 20 0D       jr   nz,$0315
0308: CD 6B 14    call $146B
030B: 3A 00 84    ld   a,($8400)
030E: CB 5F       bit  3,a
0310: 20 03       jr   nz,$0315
0312: CD DF 0B    call $0BDF
0315: 21 00 84    ld   hl,$8400
0318: CB 4E       bit  1,(hl)
031A: 20 14       jr   nz,$0330
031C: 3A A8 85    ld   a,($85A8)
031F: 47          ld   b,a
0320: E6 0F       and  $0F
0322: FE 09       cp   $09
0324: 38 02       jr   c,$0328
0326: CB 98       res  3,b
0328: 78          ld   a,b
0329: CB 87       res  0,a
032B: 32 B0 85    ld   ($85B0),a
032E: 18 0C       jr   $033C
0330: CB 56       bit  2,(hl)
0332: 28 E8       jr   z,$031C
0334: 3A A9 85    ld   a,($85A9)
0337: 18 E6       jr   $031F
0339: 32 B0 85    ld   ($85B0),a
033C: 21 24 86    ld   hl,$8624
033F: 11 B0 85    ld   de,$85B0
0342: 1A          ld   a,(de)
0343: E6 30       and  $30
0345: 77          ld   (hl),a
0346: 21 A5 85    ld   hl,$85A5
0349: 11 A6 85    ld   de,$85A6
034C: 3A A7 85    ld   a,($85A7)
034F: 77          ld   (hl),a
0350: FE B0       cp   $B0
0352: D2 7E 38    jp   nc,$387E
0355: E6 0F       and  $0F
0357: FE 0A       cp   $0A
0359: D2 7E 38    jp   nc,$387E
035C: 7E          ld   a,(hl)
035D: A7          and  a
035E: 20 0E       jr   nz,$036E
0360: 1A          ld   a,(de)
0361: A7          and  a
0362: 20 0A       jr   nz,$036E
0364: 3A 00 84    ld   a,($8400)
0367: CB 77       bit  6,a
0369: CA 80 0A    jp   z,$0A80
036C: 18 5A       jr   $03C8
036E: 3A CC 87    ld   a,($87CC)
0371: CB 4F       bit  1,a
0373: 20 16       jr   nz,$038B
0375: CB 47       bit  0,a
0377: 20 12       jr   nz,$038B
0379: 1A          ld   a,(de)
037A: 47          ld   b,a
037B: 7E          ld   a,(hl)
037C: FE 90       cp   $90
037E: 30 0B       jr   nc,$038B
0380: 90          sub  b
0381: 27          daa
0382: 4F          ld   c,a
0383: 38 06       jr   c,$038B
0385: 28 04       jr   z,$038B
0387: 79          ld   a,c
0388: 32 33 9B    ld   ($9B33),a
038B: 7E          ld   a,(hl)
038C: EB          ex   de,hl
038D: BE          cp   (hl)
038E: 30 30       jr   nc,$03C0
0390: 1A          ld   a,(de)
0391: FE 99       cp   $99
0393: 28 0A       jr   z,$039F
0395: FE 9F       cp   $9F
0397: 28 06       jr   z,$039F
0399: C6 01       add  a,$01
039B: 27          daa
039C: BE          cp   (hl)
039D: 20 14       jr   nz,$03B3
039F: 21 00 84    ld   hl,$8400
03A2: CB 86       res  0,(hl)
03A4: CB 8E       res  1,(hl)
03A6: CB F6       set  6,(hl)
03A8: 3E 01       ld   a,$01
03AA: 21 E1 89    ld   hl,$89E1
03AD: CD 26 12    call $1226
03B0: C3 27 0A    jp   $0A27
03B3: 21 00 84    ld   hl,$8400
03B6: CB C6       set  0,(hl)
03B8: CB 8E       res  1,(hl)
03BA: CB F6       set  6,(hl)
03BC: 3E 02       ld   a,$02
03BE: 18 EA       jr   $03AA
03C0: 21 00 84    ld   hl,$8400
03C3: CB 76       bit  6,(hl)
03C5: CA 03 0B    jp   z,$0B03
03C8: 21 57 86    ld   hl,$8657
03CB: CB 86       res  0,(hl)
03CD: CB 4E       bit  1,(hl)
03CF: C2 27 0A    jp   nz,$0A27
03D2: 21 F3 89    ld   hl,$89F3
03D5: 34          inc  (hl)
03D6: 21 88 9A    ld   hl,$9A88
03D9: 7E          ld   a,(hl)
03DA: A7          and  a
03DB: C2 27 0A    jp   nz,$0A27
03DE: 21 00 84    ld   hl,$8400
03E1: CB 5E       bit  3,(hl)
03E3: C2 45 04    jp   nz,$0445
03E6: CB DE       set  3,(hl)
03E8: CD A6 15    call $15A6
03EB: CD 7C 17    call $177C
03EE: CD ED 17    call $17ED
03F1: CD 7F 18    call $187F
03F4: CD 92 18    call $1892
03F7: CD 5A 00    call watchdog_delay_005a
03FA: 3A B0 85    ld   a,($85B0)
03FD: CB 6F       bit  5,a
03FF: 28 05       jr   z,$0406
0401: 21 87 87    ld   hl,$8787
0404: 36 FF       ld   (hl),$FF
0406: CD 22 0C    call $0C22
0409: 3A CF 87    ld   a,($87CF)
040C: CB 5F       bit  3,a
040E: 20 19       jr   nz,$0429
0410: 3A 87 87    ld   a,($8787)
0413: CB 4F       bit  1,a
0415: 20 12       jr   nz,$0429
0417: 3A 0E 84    ld   a,($840E)
041A: 6F          ld   l,a
041B: 67          ld   h,a
041C: 32 0F 84    ld   ($840F),a
041F: 22 27 86    ld   ($8627),hl
0422: 21 85 87    ld   hl,$8785
0425: 36 00       ld   (hl),$00
0427: 18 10       jr   $0439
0429: 3E 01       ld   a,$01
042B: 32 0F 84    ld   ($840F),a
042E: 21 01 01    ld   hl,$0101
0431: 22 27 86    ld   ($8627),hl
0434: 21 85 87    ld   hl,$8785
0437: 36 00       ld   (hl),$00
0439: CD AC 18    call $18AC
043C: CD B1 12    call $12B1
043F: CD 51 0C    call $0C51
0442: C3 27 0A    jp   $0A27
0445: CB 7E       bit  7,(hl)
0447: 20 47       jr   nz,$0490
0449: CB FE       set  7,(hl)
044B: CD AE 17    call $17AE
044E: CD 15 0C    call $0C15
0451: CD 51 15    call $1551
0454: 21 00 00    ld   hl,$0000
0457: 3A 00 84    ld   a,($8400)
045A: CB 4F       bit  1,a
045C: 20 09       jr   nz,$0467
045E: AF          xor  a
045F: 32 DA 87    ld   ($87DA),a
0462: 22 D4 87    ld   ($87D4),hl
0465: 18 07       jr   $046E
0467: AF          xor  a
0468: 32 D8 87    ld   ($87D8),a
046B: 22 D2 87    ld   ($87D2),hl
046E: 32 99 87    ld   ($8799),a
0471: 32 EB 87    ld   ($87EB),a
0474: 22 ED 87    ld   ($87ED),hl
0477: 32 6D 89    ld   ($896D),a
047A: 32 6C 89    ld   ($896C),a
047D: 32 F0 87    ld   ($87F0),a
0480: 21 9E 98    ld   hl,$989E
0483: 77          ld   (hl),a
0484: 23          inc  hl
0485: 36 E0       ld   (hl),$E0
0487: CD A6 0B    call $0BA6
048A: CD B1 0B    call $0BB1
048D: C3 27 0A    jp   $0A27
0490: 21 00 84    ld   hl,$8400
0493: CB 66       bit  4,(hl)
0495: 20 33       jr   nz,$04CA
0497: CB E6       set  4,(hl)
0499: CD F7 19    call $19F7
049C: 3A 27 86    ld   a,($8627)
049F: 3D          dec  a
04A0: 4F          ld   c,a
04A1: D6 0C       sub  $0C
04A3: 30 FB       jr   nc,$04A0
04A5: 79          ld   a,c
04A6: 1F          rra
04A7: 1F          rra
04A8: 4F          ld   c,a
04A9: E6 01       and  $01
04AB: 32 04 A0    ld   ($A004),a
04AE: 79          ld   a,c
04AF: 1F          rra
04B0: E6 01       and  $01
04B2: 32 05 A0    ld   ($A005),a
04B5: CD 05 0C    call $0C05
04B8: CD 0B 14    call $140B
04BB: CD 45 18    call $1845
04BE: CD 51 15    call $1551
04C1: CD A6 0B    call $0BA6
04C4: CD B1 0B    call $0BB1
04C7: C3 27 0A    jp   $0A27
04CA: E5          push hl
04CB: 3A 57 86    ld   a,($8657)
04CE: CB 4F       bit  1,a
04D0: 20 06       jr   nz,$04D8
04D2: CD 81 0C    call $0C81
04D5: CD 6B 14    call $146B
04D8: E1          pop  hl
04D9: CB 6E       bit  5,(hl)
04DB: C2 C7 05    jp   nz,$05C7
04DE: CB EE       set  5,(hl)
04E0: 21 68 10    ld   hl,$1068
04E3: 22 25 86    ld   ($8625),hl
04E6: AF          xor  a
04E7: 32 4A 86    ld   ($864A),a
04EA: 32 53 86    ld   ($8653),a
04ED: CD F7 19    call $19F7
04F0: CD 51 15    call $1551
04F3: 21 4B 86    ld   hl,$864B
04F6: 06 08       ld   b,$08
04F8: 0E 02       ld   c,$02
04FA: 3A 57 86    ld   a,($8657)
04FD: CB 47       bit  0,a
04FF: 20 11       jr   nz,$0512
0501: 3A 27 86    ld   a,($8627)
0504: FE 14       cp   $14
0506: 38 0A       jr   c,$0512
0508: FE 20       cp   $20
050A: 30 04       jr   nc,$0510
050C: 0E 01       ld   c,$01
050E: 18 02       jr   $0512
0510: 0E 00       ld   c,$00
0512: 3E 02       ld   a,$02
0514: 77          ld   (hl),a
0515: 23          inc  hl
0516: 91          sub  c
0517: 10 FB       djnz $0514
0519: CD EC 11    call $11EC
051C: CD E0 11    call $11E0
051F: 21 A1 83    ld   hl,$83A1
0522: 11 20 00    ld   de,$0020
0525: 19          add  hl,de
0526: 3E 7F       ld   a,$7F
0528: 77          ld   (hl),a
0529: 23          inc  hl
052A: 77          ld   (hl),a
052B: 19          add  hl,de
052C: 77          ld   (hl),a
052D: 2B          dec  hl
052E: 77          ld   (hl),a
052F: 21 9E 98    ld   hl,$989E
0532: AF          xor  a
0533: 77          ld   (hl),a
0534: 23          inc  hl
0535: 36 E0       ld   (hl),$E0
0537: 32 EF 87    ld   ($87EF),a
053A: 32 F0 87    ld   ($87F0),a
053D: 21 00 00    ld   hl,$0000
0540: 22 D6 87    ld   ($87D6),hl
0543: 32 6F 89    ld   ($896F),a
0546: 32 6C 89    ld   ($896C),a
0549: 32 A7 87    ld   ($87A7),a
054C: 32 B3 85    ld   ($85B3),a
054F: 32 22 99    ld   ($9922),a
0552: 21 28 85    ld   hl,$8528
0555: 11 10 00    ld   de,$0010
0558: 0E 00       ld   c,$00
055A: 06 08       ld   b,$08
055C: CB 7E       bit  7,(hl)
055E: 28 01       jr   z,$0561
0560: 0C          inc  c
0561: 19          add  hl,de
0562: 10 F8       djnz $055C
0564: 79          ld   a,c
0565: FE 08       cp   $08
0567: 20 0F       jr   nz,$0578
0569: CD 7D 1B    call decrement_lives_1b7d
056C: 21 6C 89    ld   hl,$896C
056F: CB DE       set  3,(hl)
0571: 21 01 84    ld   hl,$8401
0574: CB EE       set  5,(hl)
0576: 18 0E       jr   $0586
0578: CD 2E 1B    call $1B2E
057B: CD 7D 1B    call decrement_lives_1b7d
057E: CD 45 18    call $1845
0581: 21 01 84    ld   hl,$8401
0584: CB AE       res  5,(hl)
0586: 21 93 9A    ld   hl,$9A93
0589: 36 00       ld   (hl),$00
058B: 21 87 87    ld   hl,$8787
058E: 36 FF       ld   (hl),$FF
0590: CD A6 0B    call $0BA6
0593: CD B1 0B    call $0BB1
0596: 3E 02       ld   a,$02
0598: 32 AE 85    ld   ($85AE),a
059B: 32 AF 85    ld   ($85AF),a
059E: 21 E0 01    ld   hl,$01E0
05A1: 22 F2 85    ld   ($85F2),hl
05A4: 21 01 84    ld   hl,$8401
05A7: CB B6       res  6,(hl)
05A9: 32 30 68    ld   (watchdog_6830),a
05AC: 21 00 00    ld   hl,$0000
05AF: 22 F4 85    ld   ($85F4),hl
05B2: 3A 57 86    ld   a,($8657)
05B5: CB 4F       bit  1,a
05B7: 28 05       jr   z,$05BE
05B9: 3E 80       ld   a,$80
05BB: 32 76 86    ld   ($8676),a
05BE: CD A6 0B    call $0BA6
05C1: CD B1 0B    call $0BB1
05C4: C3 27 0A    jp   $0A27
05C7: 3A 6C 89    ld   a,($896C)
05CA: CB 5F       bit  3,a
05CC: 20 61       jr   nz,$062F
05CE: 21 01 84    ld   hl,$8401
05D1: CB 6E       bit  5,(hl)
05D3: 20 30       jr   nz,$0605
05D5: E5          push hl
05D6: CD 94 1C    call $1C94
05D9: 3E 78       ld   a,$78
05DB: 32 D5 85    ld   ($85D5),a
05DE: E1          pop  hl
05DF: CB EE       set  5,(hl)
05E1: 21 85 87    ld   hl,$8785
05E4: 3A 00 84    ld   a,($8400)
05E7: CB 4F       bit  1,a
05E9: 20 0D       jr   nz,$05F8
05EB: CB 46       bit  0,(hl)
05ED: C2 27 0A    jp   nz,$0A27
05F0: 3E 01       ld   a,$01
05F2: 32 81 9A    ld   ($9A81),a
05F5: C3 27 0A    jp   $0A27
05F8: CB 4E       bit  1,(hl)
05FA: C2 27 0A    jp   nz,$0A27
05FD: 3E 01       ld   a,$01
05FF: 32 81 9A    ld   ($9A81),a
0602: C3 27 0A    jp   $0A27
0605: 21 81 9A    ld   hl,$9A81
0608: 7E          ld   a,(hl)
0609: A7          and  a
060A: C2 27 0A    jp   nz,$0A27
060D: 3A D5 85    ld   a,($85D5)
0610: A7          and  a
0611: 28 0C       jr   z,$061F
0613: FE 01       cp   $01
0615: CC D3 1C    call z,$1CD3
0618: 21 D5 85    ld   hl,$85D5
061B: 35          dec  (hl)
061C: C3 27 0A    jp   $0A27
061F: 21 85 87    ld   hl,$8785
0622: 3A 00 84    ld   a,($8400)
0625: CB 4F       bit  1,a
0627: 20 04       jr   nz,$062D
0629: CB C6       set  0,(hl)
062B: 18 02       jr   $062F
062D: CB CE       set  1,(hl)
062F: 21 6C 89    ld   hl,$896C
0632: CB DE       set  3,(hl)
0634: 3A 46 86    ld   a,($8646)
0637: CB 4F       bit  1,a
0639: 28 19       jr   z,$0654
063B: 21 86 9A    ld   hl,$9A86
063E: 3E 00       ld   a,$00
0640: 77          ld   (hl),a
0641: 21 89 9A    ld   hl,$9A89
0644: 77          ld   (hl),a
0645: 21 47 86    ld   hl,$8647
0648: 7E          ld   a,(hl)
0649: A7          and  a
064A: 20 07       jr   nz,$0653
064C: 21 01 84    ld   hl,$8401
064F: CB FE       set  7,(hl)
0651: 18 01       jr   $0654
0653: 35          dec  (hl)
0654: 21 6F 89    ld   hl,$896F
0657: CB 46       bit  0,(hl)
0659: 20 15       jr   nz,$0670
065B: CB C6       set  0,(hl)
065D: 21 00 00    ld   hl,$0000
0660: 22 23 84    ld   ($8423),hl
0663: AF          xor  a
0664: 21 B0 85    ld   hl,$85B0
0667: CD 64 19    call $1964
066A: 21 F4 85    ld   hl,$85F4
066D: 77          ld   (hl),a
066E: 23          inc  hl
066F: 77          ld   (hl),a
0670: 21 F0 87    ld   hl,$87F0
0673: CB 4E       bit  1,(hl)
0675: C2 49 09    jp   nz,$0949
0678: 21 01 84    ld   hl,$8401
067B: CB 7E       bit  7,(hl)
067D: CA 49 09    jp   z,$0949
0680: AF          xor  a
0681: 32 92 9A    ld   ($9A92),a
0684: 23          inc  hl
0685: CB 46       bit  0,(hl)
0687: C2 98 07    jp   nz,$0798
068A: 21 1C 86    ld   hl,$861C
068D: 35          dec  (hl)
068E: 7E          ld   a,(hl)
068F: FE 64       cp   $64
0691: C2 F7 06    jp   nz,$06F7
0694: 21 46 86    ld   hl,$8646
0697: CB 4E       bit  1,(hl)
0699: 28 02       jr   z,$069D
069B: 36 80       ld   (hl),$80
069D: 21 32 85    ld   hl,$8532
06A0: 06 08       ld   b,$08
06A2: 11 10 00    ld   de,$0010
06A5: 36 00       ld   (hl),$00
06A7: 19          add  hl,de
06A8: 32 30 68    ld   (watchdog_6830),a
06AB: 10 F8       djnz $06A5
06AD: 21 9E 98    ld   hl,$989E
06B0: 36 00       ld   (hl),$00
06B2: 23          inc  hl
06B3: 36 E0       ld   (hl),$E0
06B5: 21 26 85    ld   hl,$8526
06B8: 06 08       ld   b,$08
06BA: 11 0E 00    ld   de,$000E
06BD: CB B6       res  6,(hl)
06BF: 23          inc  hl
06C0: 23          inc  hl
06C1: CB B6       res  6,(hl)
06C3: 19          add  hl,de
06C4: 32 30 68    ld   (watchdog_6830),a
06C7: 10 F4       djnz $06BD
06C9: 21 2B 85    ld   hl,$852B
06CC: 11 10 00    ld   de,$0010
06CF: 06 08       ld   b,$08
06D1: 36 32       ld   (hl),$32
06D3: 19          add  hl,de
06D4: 32 30 68    ld   (watchdog_6830),a
06D7: 10 F8       djnz $06D1
06D9: 21 4A 86    ld   hl,$864A
06DC: 36 00       ld   (hl),$00
06DE: CD 51 15    call $1551
06E1: CD 89 0F    call $0F89
06E4: AF          xor  a
06E5: 32 A0 98    ld   ($98A0),a
06E8: 32 A1 98    ld   ($98A1),a
06EB: 21 F4 98    ld   hl,$98F4
06EE: 06 0C       ld   b,$0C
06F0: 77          ld   (hl),a
06F1: 23          inc  hl
06F2: 10 FC       djnz $06F0
06F4: C3 27 0A    jp   $0A27
06F7: FE 50       cp   $50
06F9: C2 1B 07    jp   nz,$071B
06FC: 3E 01       ld   a,$01
06FE: 32 85 9A    ld   ($9A85),a
0701: 21 22 98    ld   hl,$9822
0704: 36 14       ld   (hl),$14
0706: 21 46 86    ld   hl,$8646
0709: CB 7E       bit  7,(hl)
070B: 28 09       jr   z,$0716
070D: CB BE       res  7,(hl)
070F: 21 1C 86    ld   hl,$861C
0712: 36 22       ld   (hl),$22
0714: 18 66       jr   $077C
0716: CD DA 11    call $11DA
0719: 18 61       jr   $077C
071B: FE 34       cp   $34
071D: 20 1A       jr   nz,$0739
071F: 21 22 98    ld   hl,$9822
0722: 36 15       ld   (hl),$15
0724: 21 DA 87    ld   hl,$87DA
0727: 3A 00 84    ld   a,($8400)
072A: CB 4F       bit  1,a
072C: 28 03       jr   z,$0731
072E: 21 D8 87    ld   hl,$87D8
0731: 7E          ld   a,(hl)
0732: FE 02       cp   $02
0734: 20 46       jr   nz,$077C
0736: 34          inc  (hl)
0737: 18 43       jr   $077C
0739: FE 20       cp   $20
073B: 20 07       jr   nz,$0744
073D: 21 22 98    ld   hl,$9822
0740: 36 16       ld   (hl),$16
0742: 18 38       jr   $077C
0744: FE 14       cp   $14
0746: 20 07       jr   nz,$074F
0748: 21 22 98    ld   hl,$9822
074B: 36 17       ld   (hl),$17
074D: 18 2D       jr   $077C
074F: A7          and  a
0750: C2 27 0A    jp   nz,$0A27
0753: 3A 57 86    ld   a,($8657)
0756: CB 4F       bit  1,a
0758: C2 C7 0B    jp   nz,$0BC7
075B: AF          xor  a
075C: 32 80 98    ld   ($9880),a
075F: 32 81 98    ld   ($9881),a
0762: 21 22 98    ld   hl,$9822
0765: 36 32       ld   (hl),$32
0767: 21 A2 98    ld   hl,$98A2
076A: 36 00       ld   (hl),$00
076C: 23          inc  hl
076D: 36 50       ld   (hl),$50
076F: 21 02 84    ld   hl,$8402
0772: CB C6       set  0,(hl)
0774: 21 1C 86    ld   hl,$861C
0777: 36 3C       ld   (hl),$3C
0779: C3 27 0A    jp   $0A27
077C: 3A AE 85    ld   a,($85AE)
077F: CB 4F       bit  1,a
0781: CA 27 0A    jp   z,$0A27
0784: 21 22 98    ld   hl,$9822
0787: 7E          ld   a,(hl)
0788: C6 04       add  a,$04
078A: 77          ld   (hl),a
078B: 21 F4 98    ld   hl,$98F4
078E: 06 0C       ld   b,$0C
0790: 36 00       ld   (hl),$00
0792: 23          inc  hl
0793: 10 FB       djnz $0790
0795: C3 27 0A    jp   $0A27
0798: 21 1C 86    ld   hl,$861C
079B: 7E          ld   a,(hl)
079C: A7          and  a
079D: 28 04       jr   z,$07A3
079F: 35          dec  (hl)
07A0: C3 27 0A    jp   $0A27
07A3: 21 00 84    ld   hl,$8400
07A6: CB 4E       bit  1,(hl)
07A8: 20 0C       jr   nz,$07B6
07AA: 3A 0A 84    ld   a,(player_1_lives_840a)
07AD: A7          and  a
07AE: 20 13       jr   nz,$07C3
07B0: 23          inc  hl
07B1: 23          inc  hl
07B2: CB CE       set  1,(hl)
07B4: 18 69       jr   $081F
07B6: 3A 0B 84    ld   a,(player_2_lives_840b)
07B9: A7          and  a
07BA: 20 51       jr   nz,$080D
07BC: 23          inc  hl
07BD: 23          inc  hl
07BE: CB D6       set  2,(hl)
07C0: C3 66 08    jp   $0866
07C3: CB 46       bit  0,(hl)
07C5: 20 21       jr   nz,$07E8
07C7: 21 00 84    ld   hl,$8400
07CA: CB AE       res  5,(hl)
07CC: CB A6       res  4,(hl)
07CE: 23          inc  hl
07CF: 7E          ld   a,(hl)
07D0: E6 57       and  $57
07D2: 77          ld   (hl),a
07D3: 23          inc  hl
07D4: 7E          ld   a,(hl)
07D5: E6 E6       and  $E6
07D7: 77          ld   (hl),a
07D8: 23          inc  hl
07D9: CB 96       res  2,(hl)
07DB: CB 9E       res  3,(hl)
07DD: 23          inc  hl
07DE: CB B6       res  6,(hl)
07E0: 21 46 86    ld   hl,$8646
07E3: 36 00       ld   (hl),$00
07E5: C3 27 0A    jp   $0A27
07E8: 23          inc  hl
07E9: 23          inc  hl
07EA: CB 56       bit  2,(hl)
07EC: 20 D9       jr   nz,$07C7
07EE: 21 00 84    ld   hl,$8400
07F1: 32 30 68    ld   (watchdog_6830),a
07F4: CB 56       bit  2,(hl)
07F6: 28 05       jr   z,$07FD
07F8: 21 07 A0    ld   hl,$A007
07FB: 36 01       ld   (hl),$01
07FD: 21 00 84    ld   hl,$8400
0800: CB CE       set  1,(hl)
0802: CD 97 12    call $1297
0805: CD A4 12    call $12A4
0808: CD B1 12    call $12B1
080B: 18 BA       jr   $07C7
080D: 21 02 84    ld   hl,$8402
0810: CB 4E       bit  1,(hl)
0812: 20 B3       jr   nz,$07C7
0814: 2B          dec  hl
0815: 2B          dec  hl
0816: CB 8E       res  1,(hl)
0818: 21 07 A0    ld   hl,$A007
081B: 36 00       ld   (hl),$00
081D: 18 E3       jr   $0802
081F: 21 00 84    ld   hl,$8400
0822: CB 46       bit  0,(hl)
0824: CA B0 08    jp   z,$08B0
0827: 23          inc  hl
0828: 23          inc  hl
0829: CB 56       bit  2,(hl)
082B: C2 B0 08    jp   nz,$08B0
082E: 21 02 84    ld   hl,$8402
0831: CB 5E       bit  3,(hl)
0833: 20 17       jr   nz,$084C
0835: 21 1D 86    ld   hl,$861D
0838: 36 78       ld   (hl),$78
083A: CD C9 12    call $12C9
083D: 21 02 84    ld   hl,$8402
0840: CB DE       set  3,(hl)
0842: 21 CC 87    ld   hl,$87CC
0845: CB CE       set  1,(hl)
0847: CB D6       set  2,(hl)
0849: C3 27 0A    jp   $0A27
084C: 21 1D 86    ld   hl,$861D
084F: 7E          ld   a,(hl)
0850: A7          and  a
0851: 28 04       jr   z,$0857
0853: 35          dec  (hl)
0854: C3 27 0A    jp   $0A27
0857: 21 CC 87    ld   hl,$87CC
085A: CB 96       res  2,(hl)
085C: CB 4E       bit  1,(hl)
085E: C2 27 0A    jp   nz,$0A27
0861: CD 4B 13    call $134B
0864: 18 88       jr   $07EE
0866: 21 02 84    ld   hl,$8402
0869: CB 4E       bit  1,(hl)
086B: 20 43       jr   nz,$08B0
086D: 21 02 84    ld   hl,$8402
0870: CB 5E       bit  3,(hl)
0872: 20 17       jr   nz,$088B
0874: 21 1D 86    ld   hl,$861D
0877: 36 78       ld   (hl),$78
0879: CD D3 12    call $12D3
087C: 21 02 84    ld   hl,$8402
087F: CB DE       set  3,(hl)
0881: 21 CC 87    ld   hl,$87CC
0884: CB CE       set  1,(hl)
0886: CB D6       set  2,(hl)
0888: C3 27 0A    jp   $0A27
088B: 21 1D 86    ld   hl,$861D
088E: 7E          ld   a,(hl)
088F: A7          and  a
0890: 28 04       jr   z,$0896
0892: 35          dec  (hl)
0893: C3 27 0A    jp   $0A27
0896: 21 CC 87    ld   hl,$87CC
0899: CB 96       res  2,(hl)
089B: CB 4E       bit  1,(hl)
089D: C2 27 0A    jp   nz,$0A27
08A0: 21 00 84    ld   hl,$8400
08A3: CB 8E       res  1,(hl)
08A5: CD 4B 13    call $134B
08A8: 21 07 A0    ld   hl,$A007
08AB: 36 00       ld   (hl),$00
08AD: C3 02 08    jp   $0802
08B0: 21 02 84    ld   hl,$8402
08B3: CB 66       bit  4,(hl)
08B5: 20 1D       jr   nz,$08D4
08B7: CB E6       set  4,(hl)
08B9: 21 83 9A    ld   hl,$9A83
08BC: CB C6       set  0,(hl)
08BE: 21 1E 86    ld   hl,$861E
08C1: 36 41       ld   (hl),$41
08C3: 21 CC 87    ld   hl,$87CC
08C6: CB CE       set  1,(hl)
08C8: CB D6       set  2,(hl)
08CA: AF          xor  a
08CB: 32 58 86    ld   ($8658),a
08CE: 32 57 86    ld   ($8657),a
08D1: C3 27 0A    jp   $0A27
08D4: 21 1E 86    ld   hl,$861E
08D7: 7E          ld   a,(hl)
08D8: A7          and  a
08D9: 28 1D       jr   z,$08F8
08DB: FE 38       cp   $38
08DD: 20 0A       jr   nz,$08E9
08DF: E5          push hl
08E0: 21 83 9A    ld   hl,$9A83
08E3: 7E          ld   a,(hl)
08E4: E1          pop  hl
08E5: A7          and  a
08E6: C2 27 0A    jp   nz,$0A27
08E9: E5          push hl
08EA: CD CF 12    call $12CF
08ED: E1          pop  hl
08EE: 35          dec  (hl)
08EF: CD 8D 18    call $188D
08F2: CD A7 18    call $18A7
08F5: C3 27 0A    jp   $0A27
08F8: 21 CC 87    ld   hl,$87CC
08FB: CB 96       res  2,(hl)
08FD: CB 4E       bit  1,(hl)
08FF: C2 27 0A    jp   nz,$0A27
0902: CD 4B 13    call $134B
0905: 21 00 84    ld   hl,$8400
0908: 7E          ld   a,(hl)
0909: E6 01       and  $01
090B: 77          ld   (hl),a
090C: 23          inc  hl
090D: 06 06       ld   b,$06
090F: 36 00       ld   (hl),$00
0911: 23          inc  hl
0912: 10 FB       djnz $090F
0914: 3E 90       ld   a,$90
0916: 32 76 86    ld   ($8676),a
0919: 21 46 86    ld   hl,$8646
091C: 36 00       ld   (hl),$00
091E: 3A 0D 84    ld   a,($840D)
0921: 32 A9 87    ld   ($87A9),a
0924: 21 04 89    ld   hl,$8904
0927: 06 04       ld   b,$04
0929: 36 02       ld   (hl),$02
092B: 23          inc  hl
092C: 10 FB       djnz $0929
092E: 21 04 89    ld   hl,$8904
0931: 11 00 70    ld   de,$7000
0934: 01 04 00    ld   bc,$0004
0937: 3E C1       ld   a,$C1
0939: CD A1 00    call enqueue_00a1
093C: 21 87 87    ld   hl,$8787
093F: 36 00       ld   (hl),$00
0941: 21 07 A0    ld   hl,$A007
0944: 36 00       ld   (hl),$00
0946: C3 27 0A    jp   $0A27
0949: 3A F5 98    ld   a,($98F5)
094C: A7          and  a
094D: C2 E6 09    jp   nz,$09E6
0950: 3A F7 98    ld   a,($98F7)
0953: A7          and  a
0954: C2 E6 09    jp   nz,$09E6
0957: 3A 22 98    ld   a,($9822)
095A: FE 08       cp   $08
095C: CA E6 09    jp   z,$09E6
095F: FE 09       cp   $09
0961: CA E6 09    jp   z,$09E6
0964: FE 0C       cp   $0C
0966: CA E6 09    jp   z,$09E6
0969: FE 0D       cp   $0D
096B: CA E6 09    jp   z,$09E6
096E: 3A 87 9A    ld   a,($9A87)
0971: A7          and  a
0972: C2 E6 09    jp   nz,$09E6
0975: 3A 57 86    ld   a,($8657)
0978: CB 4F       bit  1,a
097A: 20 14       jr   nz,$0990
097C: 21 2B 85    ld   hl,$852B
097F: 06 08       ld   b,$08
0981: 11 10 00    ld   de,$0010
0984: 7E          ld   a,(hl)
0985: FE 82       cp   $82
0987: 28 5D       jr   z,$09E6
0989: FE 85       cp   $85
098B: 28 59       jr   z,$09E6
098D: 19          add  hl,de
098E: 10 F4       djnz $0984
0990: 21 28 85    ld   hl,$8528
0993: 06 08       ld   b,$08
0995: 11 10 00    ld   de,$0010
0998: CB 7E       bit  7,(hl)
099A: 28 4A       jr   z,$09E6
099C: CB B6       res  6,(hl)
099E: 19          add  hl,de
099F: 32 30 68    ld   (watchdog_6830),a
09A2: 10 F4       djnz $0998
09A4: 3A 46 86    ld   a,($8646)
09A7: CB 47       bit  0,a
09A9: 20 3B       jr   nz,$09E6
09AB: CD 8C 12    call $128C
09AE: AF          xor  a
09AF: 32 A0 98    ld   ($98A0),a
09B2: 32 A1 98    ld   ($98A1),a
09B5: CD 89 0F    call $0F89
09B8: 21 46 86    ld   hl,$8646
09BB: 36 00       ld   (hl),$00
09BD: 21 88 9A    ld   hl,$9A88
09C0: CB C6       set  0,(hl)
09C2: 21 00 84    ld   hl,$8400
09C5: 7E          ld   a,(hl)
09C6: E6 4F       and  $4F
09C8: 77          ld   (hl),a
09C9: 23          inc  hl
09CA: CB AE       res  5,(hl)
09CC: CB 9E       res  3,(hl)
09CE: 2B          dec  hl
09CF: CB 4E       bit  1,(hl)
09D1: 20 0C       jr   nz,$09DF
09D3: 21 0A 84    ld   hl,player_1_lives_840a
09D6: 34          inc  (hl)
09D7: 21 4A 86    ld   hl,$864A
09DA: 36 00       ld   (hl),$00
09DC: C3 27 0A    jp   $0A27
09DF: 21 0B 84    ld   hl,player_2_lives_840b
09E2: 34          inc  (hl)
09E3: C3 27 0A    jp   $0A27
09E6: CD A6 0B    call $0BA6
09E9: CD B1 0B    call $0BB1
09EC: 2A D6 87    ld   hl,($87D6)
09EF: 23          inc  hl
09F0: 22 D6 87    ld   ($87D6),hl
09F3: CD 32 14    call $1432
09F6: 3A 57 86    ld   a,($8657)
09F9: CB 4F       bit  1,a
09FB: 20 06       jr   nz,$0A03
09FD: 3A 0D 84    ld   a,($840D)
0A00: 32 05 9A    ld   ($9A05),a
0A03: CD 00 1F    call $1F00
0A06: CD 25 14    call $1425
0A09: 3A 46 86    ld   a,($8646)
0A0C: CB 47       bit  0,a
0A0E: 28 05       jr   z,$0A15
0A10: CD 89 0F    call $0F89
0A13: 18 08       jr   $0A1D
0A15: CD A2 0D    call $0DA2
0A18: 3E FF       ld   a,$FF
0A1A: 32 23 68    ld   ($6823),a
0A1D: 3A 46 86    ld   a,($8646)
0A20: CB 47       bit  0,a
0A22: 20 03       jr   nz,$0A27
0A24: CD 4E 13    call $134E
0A27: 21 00 70    ld   hl,$7000
0A2A: 11 CE 87    ld   de,$87CE
0A2D: 01 02 00    ld   bc,$0002
0A30: 3E D2       ld   a,$D2
0A32: CD A1 00    call enqueue_00a1
0A35: 32 30 68    ld   (watchdog_6830),a
0A38: 3A 9A 87    ld   a,($879A)
0A3B: A7          and  a
0A3C: C2 71 0A    jp   nz,$0A71
0A3F: 3A 57 86    ld   a,($8657)
0A42: CB 47       bit  0,a
0A44: 28 09       jr   z,$0A4F
0A46: 3A 58 86    ld   a,($8658)
0A49: E6 0F       and  $0F
0A4B: FE 07       cp   $07
0A4D: 20 22       jr   nz,$0A71
0A4F: CD 0D 1D    call $1D0D
0A52: 21 25 98    ld   hl,$9825
0A55: 06 0C       ld   b,$0C
0A57: 36 05       ld   (hl),$05
0A59: 23          inc  hl
0A5A: 23          inc  hl
0A5B: 32 30 68    ld   (watchdog_6830),a
0A5E: 10 F7       djnz $0A57
0A60: 3A CC 87    ld   a,($87CC)
0A63: CB 4F       bit  1,a
0A65: C2 71 0A    jp   nz,$0A71
0A68: CD 92 1B    call $1B92
0A6B: CD AF 1B    call $1BAF
0A6E: CD E5 16    call $16E5
0A71: CB C7       set  0,a
0A73: 32 20 68    ld   ($6820),a
0A76: F1          pop  af
0A77: C1          pop  bc
0A78: D1          pop  de
0A79: E1          pop  hl
0A7A: FD E1       pop  iy
0A7C: DD E1       pop  ix
0A7E: FB          ei
0A7F: C9          ret
0A80: 21 87 87    ld   hl,$8787
0A83: 3A 57 86    ld   a,($8657)
0A86: CB 47       bit  0,a
0A88: 20 0C       jr   nz,$0A96
0A8A: 3A CF 87    ld   a,($87CF)
0A8D: CB 5F       bit  3,a
0A8F: 20 05       jr   nz,$0A96
0A91: CB 4E       bit  1,(hl)
0A93: CA EC 1D    jp   z,$1DEC
0A96: 36 FF       ld   (hl),$FF
0A98: 21 57 86    ld   hl,$8657
0A9B: CB C6       set  0,(hl)
0A9D: CB 4E       bit  1,(hl)
0A9F: CA 27 0A    jp   z,$0A27
0AA2: CD CA 0B    call $0BCA
0AA5: 3A 58 86    ld   a,($8658)
0AA8: FE 17       cp   $17
0AAA: C2 27 0A    jp   nz,$0A27
0AAD: 3A 76 86    ld   a,($8676)
0AB0: FE 10       cp   $10
0AB2: C2 FB 0A    jp   nz,$0AFB
0AB5: AF          xor  a
0AB6: 32 99 87    ld   ($8799),a
0AB9: 32 6C 89    ld   ($896C),a
0ABC: 32 F0 87    ld   ($87F0),a
0ABF: CD 22 0C    call $0C22
0AC2: CD 15 0C    call $0C15
0AC5: 21 00 00    ld   hl,$0000
0AC8: 22 D6 87    ld   ($87D6),hl
0ACB: 21 9E 98    ld   hl,$989E
0ACE: 36 00       ld   (hl),$00
0AD0: 23          inc  hl
0AD1: 36 E0       ld   (hl),$E0
0AD3: CD 05 0C    call $0C05
0AD6: 21 23 84    ld   hl,$8423
0AD9: 36 FE       ld   (hl),$FE
0ADB: CD 6B 14    call $146B
0ADE: 21 23 84    ld   hl,$8423
0AE1: 36 01       ld   (hl),$01
0AE3: CD 6B 14    call $146B
0AE6: 21 C0 83    ld   hl,$83C0
0AE9: 06 3F       ld   b,$3F
0AEB: 7E          ld   a,(hl)
0AEC: FE 0C       cp   $0C
0AEE: 20 02       jr   nz,$0AF2
0AF0: 36 8C       ld   (hl),$8C
0AF2: 32 30 68    ld   (watchdog_6830),a
0AF5: 23          inc  hl
0AF6: 10 F3       djnz $0AEB
0AF8: C3 E0 04    jp   $04E0
0AFB: FE 80       cp   $80
0AFD: CA 54 06    jp   z,$0654
0B00: C3 27 0A    jp   $0A27
0B03: 21 87 87    ld   hl,$8787
0B06: 3A CF 87    ld   a,($87CF)
0B09: CB 5F       bit  3,a
0B0B: 20 05       jr   nz,$0B12
0B0D: CB 4E       bit  1,(hl)
0B0F: CA EC 1D    jp   z,$1DEC
0B12: 36 FF       ld   (hl),$FF
0B14: CD 9B 19    call $199B
0B17: 21 F0 87    ld   hl,$87F0
0B1A: CB 9E       res  3,(hl)
0B1C: 21 93 9A    ld   hl,$9A93
0B1F: 36 00       ld   (hl),$00
0B21: 21 57 86    ld   hl,$8657
0B24: CB 86       res  0,(hl)
0B26: CB 4E       bit  1,(hl)
0B28: C2 71 0A    jp   nz,$0A71
0B2B: CD CA 0B    call $0BCA
0B2E: 3A 01 84    ld   a,($8401)
0B31: CB 4F       bit  1,a
0B33: CA 5F 0B    jp   z,$0B5F
0B36: CD 8D 18    call $188D
0B39: CD A7 18    call $18A7
0B3C: CD F2 0B    call $0BF2
0B3F: 21 00 84    ld   hl,$8400
0B42: 7E          ld   a,(hl)
0B43: E6 07       and  $07
0B45: 77          ld   (hl),a
0B46: 23          inc  hl
0B47: 7E          ld   a,(hl)
0B48: E6 02       and  $02
0B4A: 77          ld   (hl),a
0B4B: 06 03       ld   b,$03
0B4D: 23          inc  hl
0B4E: 36 00       ld   (hl),$00
0B50: 23          inc  hl
0B51: 10 FB       djnz $0B4E
0B53: CD 06 16    call $1606
0B56: CD DB 15    call $15DB
0B59: CD 90 16    call $1690
0B5C: C3 71 0A    jp   $0A71
0B5F: CB CF       set  1,a
0B61: 32 01 84    ld   ($8401),a
0B64: 21 80 98    ld   hl,$9880
0B67: DD 21 00 99 ld   ix,$9900
0B6B: 11 00 98    ld   de,$9800
0B6E: 06 80       ld   b,$80
0B70: 36 00       ld   (hl),$00
0B72: DD 36 00 00 ld   (ix+$00),$00
0B76: 32 30 68    ld   (watchdog_6830),a
0B79: 3E 32       ld   a,$32
0B7B: 12          ld   (de),a
0B7C: DD 23       inc  ix
0B7E: 13          inc  de
0B7F: 23          inc  hl
0B80: 10 EE       djnz $0B70
0B82: 3E FE       ld   a,$FE
0B84: 32 23 84    ld   ($8423),a
0B87: CD 6B 14    call $146B
0B8A: 3E 01       ld   a,$01
0B8C: 32 23 84    ld   ($8423),a
0B8F: CD 6B 14    call $146B
0B92: CD DF 0B    call $0BDF
0B95: CD 97 15    call $1597
0B98: CD 25 16    call $1625
0B9B: CD 40 16    call $1640
0B9E: 21 03 A0    ld   hl,$A003
0BA1: CB C6       set  0,(hl)
0BA3: C3 71 0A    jp   $0A71
0BA6: 21 00 A0    ld   hl,$A000
0BA9: 06 04       ld   b,$04
0BAB: 36 00       ld   (hl),$00
0BAD: 23          inc  hl
0BAE: 10 FB       djnz $0BAB
0BB0: C9          ret
0BB1: 11 07 A0    ld   de,$A007
0BB4: 21 00 84    ld   hl,$8400
0BB7: CB 4E       bit  1,(hl)
0BB9: 28 08       jr   z,$0BC3
0BBB: CB 56       bit  2,(hl)
0BBD: 28 04       jr   z,$0BC3
0BBF: EB          ex   de,hl
0BC0: 36 01       ld   (hl),$01
0BC2: C9          ret
0BC3: EB          ex   de,hl
0BC4: 36 00       ld   (hl),$00
0BC6: C9          ret
0BC7: C3 F8 08    jp   $08F8
0BCA: CD 32 14    call $1432
0BCD: CD 4F 14    call $144F
0BD0: 21 17 84    ld   hl,player_2_score_8417
0BD3: 01 00 03    ld   bc,$0300
0BD6: 3A 00 84    ld   a,($8400)
0BD9: E6 01       and  $01
0BDB: C2 5B 14    jp   nz,$145B
0BDE: C9          ret
0BDF: 21 C0 83    ld   hl,$83C0
0BE2: 06 3F       ld   b,$3F
0BE4: 7E          ld   a,(hl)
0BE5: FE 8C       cp   $8C
0BE7: 20 02       jr   nz,$0BEB
0BE9: 36 0C       ld   (hl),$0C
0BEB: 32 30 68    ld   (watchdog_6830),a
0BEE: 23          inc  hl
0BEF: 10 F3       djnz $0BE4
0BF1: C9          ret
0BF2: 21 00 98    ld   hl,$9800
0BF5: 11 80 98    ld   de,$9880
0BF8: 06 80       ld   b,$80
0BFA: 32 30 68    ld   (watchdog_6830),a
0BFD: AF          xor  a
0BFE: 77          ld   (hl),a
0BFF: 12          ld   (de),a
0C00: 23          inc  hl
0C01: 13          inc  de
0C02: 10 F6       djnz $0BFA
0C04: C9          ret
0C05: CD 39 1A    call $1A39
0C08: CD 94 1A    call $1A94
0C0B: CD 73 1A    call $1A73
0C0E: CD C6 1A    call $1AC6
0C11: CD 32 14    call $1432
0C14: C9          ret
0C15: CD 8D 18    call $188D
0C18: CD A7 18    call $18A7
0C1B: CD A3 19    call $19A3
0C1E: CD AC 18    call $18AC
0C21: C9          ret
0C22: CD AE 17    call $17AE
0C25: CD 3E 18    call $183E
0C28: CD 45 18    call $1845
0C2B: CD F8 17    call $17F8
0C2E: CD 51 15    call $1551
0C31: AF          xor  a
0C32: 32 A7 87    ld   ($87A7),a
0C35: 32 BF 87    ld   ($87BF),a
0C38: 32 9F 87    ld   ($879F),a
0C3B: 32 EB 87    ld   ($87EB),a
0C3E: 32 DA 87    ld   ($87DA),a
0C41: 32 D8 87    ld   ($87D8),a
0C44: 21 00 00    ld   hl,$0000
0C47: 22 ED 87    ld   ($87ED),hl
0C4A: 22 D4 87    ld   ($87D4),hl
0C4D: 22 D2 87    ld   ($87D2),hl
0C50: C9          ret
0C51: DD 21 2A 86 ld   ix,$862A
0C55: 21 AA 85    ld   hl,$85AA
0C58: CD 6F 0C    call $0C6F
0C5B: DD 21 2D 86 ld   ix,$862D
0C5F: 21 AC 85    ld   hl,$85AC
0C62: E5          push hl
0C63: CD 6F 0C    call $0C6F
0C66: E1          pop  hl
0C67: DD 21 30 86 ld   ix,$8630
0C6B: CD 6F 0C    call $0C6F
0C6E: C9          ret
0C6F: DD 36 00 00 ld   (ix+$00),$00
0C73: 7E          ld   a,(hl)
0C74: 87          add  a,a
0C75: 87          add  a,a
0C76: 87          add  a,a
0C77: 87          add  a,a
0C78: DD 77 01    ld   (ix+$01),a
0C7B: 23          inc  hl
0C7C: 7E          ld   a,(hl)
0C7D: DD 77 02    ld   (ix+$02),a
0C80: C9          ret
0C81: 3A 00 84    ld   a,($8400)
0C84: CB 4F       bit  1,a
0C86: 20 05       jr   nz,$0C8D
0C88: 21 16 84    ld   hl,$8416
0C8B: 18 03       jr   $0C90
0C8D: 21 19 84    ld   hl,$8419
0C90: 7E          ld   a,(hl)
0C91: FE 90       cp   $90
0C93: D0          ret  nc
0C94: 3A 57 86    ld   a,($8657)
0C97: CB 47       bit  0,a
0C99: C0          ret  nz
0C9A: 3A C0 87    ld   a,($87C0)
0C9D: A7          and  a
0C9E: C8          ret  z
0C9F: 21 00 84    ld   hl,$8400
0CA2: CB 4E       bit  1,(hl)
0CA4: 20 1A       jr   nz,$0CC0
0CA6: 21 14 84    ld   hl,player_1_score_8414
0CA9: 11 11 84    ld   de,$8411
0CAC: CD 54 0D    call $0D54
0CAF: 21 2D 86    ld   hl,$862D
0CB2: 11 33 86    ld   de,$8633
0CB5: CD 54 0D    call $0D54
0CB8: 21 02 84    ld   hl,$8402
0CBB: 22 F6 85    ld   ($85F6),hl
0CBE: 18 18       jr   $0CD8
0CC0: 21 17 84    ld   hl,player_2_score_8417
0CC3: 11 11 84    ld   de,$8411
0CC6: CD 54 0D    call $0D54
0CC9: 21 30 86    ld   hl,$8630
0CCC: 11 33 86    ld   de,$8633
0CCF: CD 54 0D    call $0D54
0CD2: 21 03 84    ld   hl,$8403
0CD5: 22 F6 85    ld   ($85F6),hl
0CD8: CB 7E       bit  7,(hl)
0CDA: 20 20       jr   nz,$0CFC
0CDC: 21 11 84    ld   hl,$8411
0CDF: 11 2A 86    ld   de,$862A
0CE2: CD 60 0D    call $0D60
0CE5: D8          ret  c
0CE6: 2A F6 85    ld   hl,($85F6)
0CE9: CB FE       set  7,(hl)
0CEB: 21 87 9A    ld   hl,$9A87
0CEE: CB C6       set  0,(hl)
0CF0: CD 6C 0D    call $0D6C
0CF3: 3E 01       ld   a,$01
0CF5: 21 EA 89    ld   hl,$89EA
0CF8: CD 26 12    call $1226
0CFB: C9          ret
0CFC: 21 11 84    ld   hl,$8411
0CFF: 3A 00 84    ld   a,($8400)
0D02: CB 4F       bit  1,a
0D04: 20 08       jr   nz,$0D0E
0D06: 3A BF 87    ld   a,($87BF)
0D09: CB 47       bit  0,a
0D0B: C0          ret  nz
0D0C: 18 06       jr   $0D14
0D0E: 3A BF 87    ld   a,($87BF)
0D11: CB 4F       bit  1,a
0D13: C0          ret  nz
0D14: 3A C0 87    ld   a,($87C0)
0D17: FE 01       cp   $01
0D19: C8          ret  z
0D1A: 11 33 86    ld   de,$8633
0D1D: CD 60 0D    call $0D60
0D20: D8          ret  c
0D21: CD 6C 0D    call $0D6C
0D24: 21 87 9A    ld   hl,$9A87
0D27: CB C6       set  0,(hl)
0D29: 3E 01       ld   a,$01
0D2B: 21 EA 89    ld   hl,$89EA
0D2E: CD 26 12    call $1226
0D31: DD 21 33 86 ld   ix,$8633
0D35: 21 AC 85    ld   hl,$85AC
0D38: CD 6F 0C    call $0C6F
0D3B: CD 84 0D    call $0D84
0D3E: 3A C0 87    ld   a,($87C0)
0D41: FE 02       cp   $02
0D43: C0          ret  nz
0D44: 21 BF 87    ld   hl,$87BF
0D47: 3A 00 84    ld   a,($8400)
0D4A: CB 4F       bit  1,a
0D4C: 20 03       jr   nz,$0D51
0D4E: CB C6       set  0,(hl)
0D50: C9          ret
0D51: CB CE       set  1,(hl)
0D53: C9          ret
0D54: 06 03       ld   b,$03
0D56: 7E          ld   a,(hl)
0D57: 12          ld   (de),a
0D58: 23          inc  hl
0D59: 13          inc  de
0D5A: 32 30 68    ld   (watchdog_6830),a
0D5D: 10 F7       djnz $0D56
0D5F: C9          ret
0D60: 06 03       ld   b,$03
0D62: EB          ex   de,hl
0D63: A7          and  a
0D64: 1A          ld   a,(de)
0D65: 9E          sbc  a,(hl)
0D66: 23          inc  hl
0D67: 13          inc  de
0D68: 10 FA       djnz $0D64
0D6A: EB          ex   de,hl
0D6B: C9          ret
0D6C: 21 00 84    ld   hl,$8400
0D6F: CB 4E       bit  1,(hl)
0D71: 20 05       jr   nz,$0D78
0D73: 21 0A 84    ld   hl,player_1_lives_840a
0D76: 18 03       jr   $0D7B
0D78: 21 0B 84    ld   hl,player_2_lives_840b
0D7B: 34          inc  (hl)
0D7C: 7E          ld   a,(hl)
0D7D: 32 0C 84    ld   ($840C),a
0D80: CD 45 18    call $1845
0D83: C9          ret
0D84: 21 00 84    ld   hl,$8400
0D87: CB 4E       bit  1,(hl)
0D89: 20 05       jr   nz,$0D90
0D8B: 21 2D 86    ld   hl,$862D
0D8E: 18 03       jr   $0D93
0D90: 21 30 86    ld   hl,$8630
0D93: 11 33 86    ld   de,$8633
0D96: 06 03       ld   b,$03
0D98: A7          and  a
0D99: 1A          ld   a,(de)
0D9A: 8E          adc  a,(hl)
0D9B: 27          daa
0D9C: 77          ld   (hl),a
0D9D: 13          inc  de
0D9E: 23          inc  hl
0D9F: 10 F8       djnz $0D99
0DA1: C9          ret
0DA2: 3A 01 84    ld   a,($8401)
0DA5: CB 7F       bit  7,a
0DA7: 20 51       jr   nz,$0DFA
0DA9: 3A 03 84    ld   a,($8403)
0DAC: CB 57       bit  2,a
0DAE: C2 34 0E    jp   nz,$0E34
0DB1: 21 01 84    ld   hl,$8401
0DB4: CB 5E       bit  3,(hl)
0DB6: 20 36       jr   nz,$0DEE
0DB8: 3A 57 86    ld   a,($8657)
0DBB: CB 4F       bit  1,a
0DBD: 28 05       jr   z,$0DC4
0DBF: 3A 70 89    ld   a,($8970)
0DC2: 18 03       jr   $0DC7
0DC4: 3A B0 85    ld   a,($85B0)
0DC7: CB 67       bit  4,a
0DC9: C0          ret  nz
0DCA: 21 01 84    ld   hl,$8401
0DCD: CB DE       set  3,(hl)
0DCF: 3A 57 86    ld   a,($8657)
0DD2: CB 4F       bit  1,a
0DD4: 20 04       jr   nz,$0DDA
0DD6: 3E 32       ld   a,$32
0DD8: 18 02       jr   $0DDC
0DDA: 3E 36       ld   a,$36
0DDC: 32 3E 86    ld   ($863E),a
0DDF: CD 97 0F    call $0F97
0DE2: AF          xor  a
0DE3: 32 9E 87    ld   ($879E),a
0DE6: 21 8F 9A    ld   hl,$9A8F
0DE9: 36 01       ld   (hl),$01
0DEB: C9          ret
0DEC: 35          dec  (hl)
0DED: C9          ret
0DEE: 21 3E 86    ld   hl,$863E
0DF1: 7E          ld   a,(hl)
0DF2: FE 33       cp   $33
0DF4: 30 F6       jr   nc,$0DEC
0DF6: FE 06       cp   $06
0DF8: 30 0E       jr   nc,$0E08
0DFA: CD 89 0F    call $0F89
0DFD: 21 01 84    ld   hl,$8401
0E00: CB 9E       res  3,(hl)
0E02: 21 3E 86    ld   hl,$863E
0E05: 36 00       ld   (hl),$00
0E07: C9          ret
0E08: 22 42 86    ld   ($8642),hl
0E0B: 3A 87 98    ld   a,($9887)
0E0E: FE 08       cp   $08
0E10: 38 E8       jr   c,$0DFA
0E12: 5F          ld   e,a
0E13: 3A 86 98    ld   a,($9886)
0E16: 57          ld   d,a
0E17: CD 16 1C    call $1C16
0E1A: CD 3B 10    call $103B
0E1D: 79          ld   a,c
0E1E: A7          and  a
0E1F: 28 D9       jr   z,$0DFA
0E21: 21 04 84    ld   hl,$8404
0E24: CB B6       res  6,(hl)
0E26: CD 09 12    call $1209
0E29: 3A 87 98    ld   a,($9887)
0E2C: FE F2       cp   $F2
0E2E: 30 CA       jr   nc,$0DFA
0E30: CD E0 10    call $10E0
0E33: C9          ret
0E34: 21 04 84    ld   hl,$8404
0E37: CB 76       bit  6,(hl)
0E39: C0          ret  nz
0E3A: CB 56       bit  2,(hl)
0E3C: 20 1E       jr   nz,$0E5C
0E3E: 2B          dec  hl
0E3F: CB 9E       res  3,(hl)
0E41: 3A 57 86    ld   a,($8657)
0E44: CB 4F       bit  1,a
0E46: 28 05       jr   z,$0E4D
0E48: 3A 70 89    ld   a,($8970)
0E4B: 18 03       jr   $0E50
0E4D: 3A B0 85    ld   a,($85B0)
0E50: CB 6F       bit  5,a
0E52: 20 03       jr   nz,$0E57
0E54: 23          inc  hl
0E55: CB D6       set  2,(hl)
0E57: AF          xor  a
0E58: 32 41 86    ld   ($8641),a
0E5B: C9          ret
0E5C: 21 41 86    ld   hl,$8641
0E5F: 34          inc  (hl)
0E60: 7E          ld   a,(hl)
0E61: E6 1F       and  $1F
0E63: FE 09       cp   $09
0E65: 30 06       jr   nc,$0E6D
0E67: 21 03 84    ld   hl,$8403
0E6A: CB 9E       res  3,(hl)
0E6C: C9          ret
0E6D: 28 2B       jr   z,$0E9A
0E6F: FE 12       cp   $12
0E71: 28 21       jr   z,$0E94
0E73: D8          ret  c
0E74: FE 1F       cp   $1F
0E76: 20 04       jr   nz,$0E7C
0E78: AF          xor  a
0E79: 32 41 86    ld   ($8641),a
0E7C: 3A 57 86    ld   a,($8657)
0E7F: CB 4F       bit  1,a
0E81: 28 05       jr   z,$0E88
0E83: 3A 70 89    ld   a,($8970)
0E86: 18 03       jr   $0E8B
0E88: 3A B0 85    ld   a,($85B0)
0E8B: CB 6F       bit  5,a
0E8D: C8          ret  z
0E8E: 21 04 84    ld   hl,$8404
0E91: CB 96       res  2,(hl)
0E93: C9          ret
0E94: 21 03 84    ld   hl,$8403
0E97: CB 9E       res  3,(hl)
0E99: C9          ret
0E9A: 21 03 84    ld   hl,$8403
0E9D: CB DE       set  3,(hl)
0E9F: 21 DF 32    ld   hl,$32DF
0EA2: 3A 10 84    ld   a,($8410)
0EA5: 3D          dec  a
0EA6: 5F          ld   e,a
0EA7: 16 00       ld   d,$00
0EA9: 19          add  hl,de
0EAA: 7E          ld   a,(hl)
0EAB: 2A C8 87    ld   hl,($87C8)
0EAE: 11 0C 00    ld   de,$000C
0EB1: 19          add  hl,de
0EB2: 77          ld   (hl),a
0EB3: 2A C8 87    ld   hl,($87C8)
0EB6: 23          inc  hl
0EB7: 23          inc  hl
0EB8: CB 6E       bit  5,(hl)
0EBA: C2 CD 11    jp   nz,$11CD
0EBD: 3E 01       ld   a,$01
0EBF: 32 90 9A    ld   ($9A90),a
0EC2: 2B          dec  hl
0EC3: 2B          dec  hl
0EC4: 7E          ld   a,(hl)
0EC5: 87          add  a,a
0EC6: D8          ret  c
0EC7: E6 38       and  $38
0EC9: 20 03       jr   nz,$0ECE
0ECB: CB D6       set  2,(hl)
0ECD: C9          ret
0ECE: CB 56       bit  2,(hl)
0ED0: 28 09       jr   z,$0EDB
0ED2: CB 96       res  2,(hl)
0ED4: CB DE       set  3,(hl)
0ED6: 23          inc  hl
0ED7: 23          inc  hl
0ED8: CB E6       set  4,(hl)
0EDA: C9          ret
0EDB: CB 5E       bit  3,(hl)
0EDD: 28 09       jr   z,$0EE8
0EDF: CB 9E       res  3,(hl)
0EE1: CB E6       set  4,(hl)
0EE3: 23          inc  hl
0EE4: 23          inc  hl
0EE5: CB E6       set  4,(hl)
0EE7: C9          ret
0EE8: CB 66       bit  4,(hl)
0EEA: C8          ret  z
0EEB: CB A6       res  4,(hl)
0EED: CB B6       res  6,(hl)
0EEF: CB EE       set  5,(hl)
0EF1: 23          inc  hl
0EF2: 23          inc  hl
0EF3: 23          inc  hl
0EF4: CB FE       set  7,(hl)
0EF6: 3E 01       ld   a,$01
0EF8: 32 8B 9A    ld   ($9A8B),a
0EFB: 21 04 84    ld   hl,$8404
0EFE: CB F6       set  6,(hl)
0F00: 2A C8 87    ld   hl,($87C8)
0F03: 11 0C 00    ld   de,$000C
0F06: 19          add  hl,de
0F07: 36 16       ld   (hl),$16
0F09: 2A C8 87    ld   hl,($87C8)
0F0C: CB 46       bit  0,(hl)
0F0E: C2 48 0F    jp   nz,$0F48
0F11: CD 6C 12    call $126C
0F14: F5          push af
0F15: 3C          inc  a
0F16: 6F          ld   l,a
0F17: 87          add  a,a
0F18: 85          add  a,l
0F19: 6F          ld   l,a
0F1A: CD B5 2F    call add_to_score_2fb5
0F1D: F1          pop  af
0F1E: CD 51 12    call $1251
0F21: A7          and  a
0F22: 20 0F       jr   nz,$0F33
0F24: 36 39       ld   (hl),$39
0F26: 3E 0A       ld   a,$0A
0F28: 12          ld   (de),a
0F29: DD 36 00 00 ld   (ix+$00),$00
0F2D: 21 F7 98    ld   hl,$98F7
0F30: 36 01       ld   (hl),$01
0F32: C9          ret
0F33: 3D          dec  a
0F34: 20 05       jr   nz,$0F3B
0F36: 36 3A       ld   (hl),$3A
0F38: C3 26 0F    jp   $0F26
0F3B: 3D          dec  a
0F3C: 20 05       jr   nz,$0F43
0F3E: 36 3B       ld   (hl),$3B
0F40: C3 26 0F    jp   $0F26
0F43: 36 3C       ld   (hl),$3C
0F45: C3 26 0F    jp   $0F26
0F48: 3A 10 84    ld   a,($8410)
0F4B: FE 0A       cp   $0A
0F4D: 30 04       jr   nc,$0F53
0F4F: 3C          inc  a
0F50: 32 10 84    ld   ($8410),a
0F53: 3A AE 85    ld   a,($85AE)
0F56: CB 4F       bit  1,a
0F58: CA 11 0F    jp   z,$0F11
0F5B: CD 6C 12    call $126C
0F5E: F5          push af
0F5F: 6F          ld   l,a
0F60: 87          add  a,a
0F61: 85          add  a,l
0F62: C6 0F       add  a,$0F
0F64: 6F          ld   l,a
0F65: CD B5 2F    call add_to_score_2fb5
0F68: F1          pop  af
0F69: CD 51 12    call $1251
0F6C: A7          and  a
0F6D: 20 05       jr   nz,$0F74
0F6F: 36 3B       ld   (hl),$3B
0F71: C3 26 0F    jp   $0F26
0F74: 3D          dec  a
0F75: 20 05       jr   nz,$0F7C
0F77: 36 3D       ld   (hl),$3D
0F79: C3 26 0F    jp   $0F26
0F7C: 3D          dec  a
0F7D: 20 05       jr   nz,$0F84
0F7F: 36 3E       ld   (hl),$3E
0F81: C3 26 0F    jp   $0F26
0F84: 36 3F       ld   (hl),$3F
0F86: C3 26 0F    jp   $0F26
0F89: 21 82 98    ld   hl,$9882
0F8C: 06 08       ld   b,$08
0F8E: 36 00       ld   (hl),$00
0F90: 23          inc  hl
0F91: 32 30 68    ld   (watchdog_6830),a
0F94: 10 F8       djnz $0F8E
0F96: C9          ret
0F97: 21 08 84    ld   hl,$8408
0F9A: CB C6       set  0,(hl)
0F9C: 11 02 98    ld   de,$9802
0F9F: DD 21 02 99 ld   ix,$9902
0FA3: 01 08 00    ld   bc,$0008
0FA6: FD 21 82 98 ld   iy,$9882
0FAA: 3A AE 85    ld   a,($85AE)
0FAD: 32 E4 87    ld   ($87E4),a
0FB0: CB 4F       bit  1,a
0FB2: 28 17       jr   z,$0FCB
0FB4: 21 BB 0F    ld   hl,$0FBB
0FB7: ED B0       ldir
0FB9: 18 15       jr   $0FD0
0FBB: 37          scf
0FBC: 08          ex   af,af'
0FBD: 37          scf
0FBE: 08          ex   af,af'
0FBF: 36 08       ld   (hl),$08
0FC1: 13          inc  de
0FC2: 06 35       ld   b,$35
0FC4: 08          ex   af,af'
0FC5: 35          dec  (hl)
0FC6: 08          ex   af,af'
0FC7: 34          inc  (hl)
0FC8: 08          ex   af,af'
0FC9: 12          ld   (de),a
0FCA: 06 21       ld   b,$21
0FCC: C3 0F ED    jp   $ED0F
0FCF: B0          or   b
0FD0: DD E5       push ix
0FD2: E1          pop  hl
0FD3: 3A 22 99    ld   a,($9922)
0FD6: 06 04       ld   b,$04
0FD8: 77          ld   (hl),a
0FD9: 23          inc  hl
0FDA: 23          inc  hl
0FDB: 10 FB       djnz $0FD8
0FDD: FD E5       push iy
0FDF: E1          pop  hl
0FE0: 3A A2 98    ld   a,($98A2)
0FE3: 4F          ld   c,a
0FE4: 3A A3 98    ld   a,($98A3)
0FE7: 06 04       ld   b,$04
0FE9: 71          ld   (hl),c
0FEA: 23          inc  hl
0FEB: 77          ld   (hl),a
0FEC: 23          inc  hl
0FED: 10 FA       djnz $0FE9
0FEF: C9          ret
0FF0: 21 82 98    ld   hl,$9882
0FF3: FD 21 83 98 ld   iy,$9883
0FF7: 18 10       jr   $1009
0FF9: 21 84 98    ld   hl,$9884
0FFC: FD 21 85 98 ld   iy,$9885
1000: 18 07       jr   $1009
1002: 21 86 98    ld   hl,$9886
1005: FD 21 87 98 ld   iy,$9887
1009: 3A 06 98    ld   a,($9806)
100C: FE 34       cp   $34
100E: CA 1A 10    jp   z,$101A
1011: 3A 06 99    ld   a,($9906)
1014: E6 02       and  $02
1016: 28 17       jr   z,$102F
1018: 18 09       jr   $1023
101A: 3A 06 99    ld   a,($9906)
101D: E6 01       and  $01
101F: 28 11       jr   z,$1032
1021: 18 03       jr   $1026
1023: 35          dec  (hl)
1024: 35          dec  (hl)
1025: C9          ret
1026: FD 7E 00    ld   a,(iy+$00)
1029: 3C          inc  a
102A: 3C          inc  a
102B: FD 77 00    ld   (iy+$00),a
102E: C9          ret
102F: 34          inc  (hl)
1030: 34          inc  (hl)
1031: C9          ret
1032: FD 7E 00    ld   a,(iy+$00)
1035: 3D          dec  a
1036: 3D          dec  a
1037: FD 77 00    ld   (iy+$00),a
103A: C9          ret
103B: 3A E4 87    ld   a,($87E4)
103E: E6 07       and  $07
1040: 28 11       jr   z,$1053
1042: FE 02       cp   $02
1044: 28 16       jr   z,$105C
1046: FE 04       cp   $04
1048: 28 1B       jr   z,$1065
104A: 2A 02 86    ld   hl,($8602)
104D: ED 5B 06 86 ld   de,($8606)
1051: 18 5C       jr   $10AF
1053: 2A 02 86    ld   hl,($8602)
1056: ED 5B 04 86 ld   de,($8604)
105A: 18 10       jr   $106C
105C: 2A 04 86    ld   hl,($8604)
105F: ED 5B 08 86 ld   de,($8608)
1063: 18 4A       jr   $10AF
1065: 2A 06 86    ld   hl,($8606)
1068: ED 5B 08 86 ld   de,($8608)
106C: 3A 3E 86    ld   a,($863E)
106F: FE 2C       cp   $2C
1071: 38 08       jr   c,$107B
1073: 7E          ld   a,(hl)
1074: FE 7F       cp   $7F
1076: 20 0A       jr   nz,$1082
1078: 0E 00       ld   c,$00
107A: C9          ret
107B: CD 92 10    call $1092
107E: 79          ld   a,c
107F: FE 00       cp   $00
1081: C8          ret  z
1082: EB          ex   de,hl
1083: 3A 3E 86    ld   a,($863E)
1086: FE 2C       cp   $2C
1088: 38 08       jr   c,$1092
108A: 7E          ld   a,(hl)
108B: FE 7F       cp   $7F
108D: 20 1D       jr   nz,$10AC
108F: 0E 00       ld   c,$00
1091: C9          ret
1092: 7E          ld   a,(hl)
1093: FE 02       cp   $02
1095: 28 15       jr   z,$10AC
1097: FE 03       cp   $03
1099: 28 11       jr   z,$10AC
109B: FE 8D       cp   $8D
109D: 28 0D       jr   z,$10AC
109F: FE 7E       cp   $7E
10A1: 28 09       jr   z,$10AC
10A3: CB BF       res  7,a
10A5: FE 0C       cp   $0C
10A7: 28 03       jr   z,$10AC
10A9: 0E 00       ld   c,$00
10AB: C9          ret
10AC: 0E 01       ld   c,$01
10AE: C9          ret
10AF: 3A 3E 86    ld   a,($863E)
10B2: FE 2C       cp   $2C
10B4: 38 08       jr   c,$10BE
10B6: 7E          ld   a,(hl)
10B7: FE 7F       cp   $7F
10B9: 20 0A       jr   nz,$10C5
10BB: 0E 00       ld   c,$00
10BD: C9          ret
10BE: CD D5 10    call $10D5
10C1: 79          ld   a,c
10C2: FE 00       cp   $00
10C4: C8          ret  z
10C5: EB          ex   de,hl
10C6: 3A 3E 86    ld   a,($863E)
10C9: FE 2C       cp   $2C
10CB: 38 08       jr   c,$10D5
10CD: 7E          ld   a,(hl)
10CE: FE 7F       cp   $7F
10D0: 20 DA       jr   nz,$10AC
10D2: 0E 00       ld   c,$00
10D4: C9          ret
10D5: 7E          ld   a,(hl)
10D6: FE 08       cp   $08
10D8: 28 D2       jr   z,$10AC
10DA: FE 09       cp   $09
10DC: 28 CE       jr   z,$10AC
10DE: 18 BB       jr   $109B
10E0: 21 25 85    ld   hl,$8525
10E3: 22 F6 85    ld   ($85F6),hl
10E6: 06 08       ld   b,$08
10E8: 3A E4 87    ld   a,($87E4)
10EB: 4F          ld   c,a
10EC: DD 2A F6 85 ld   ix,($85F6)
10F0: DD CB 00 7E bit  7,(ix+$00)
10F4: 20 32       jr   nz,$1128
10F6: DD CB 03 7E bit  7,(ix+$03)
10FA: 20 2C       jr   nz,$1128
10FC: 2A 86 98    ld   hl,($9886)
10FF: DD 5E 04    ld   e,(ix+$04)
1102: DD 56 05    ld   d,(ix+$05)
1105: DD 7E 06    ld   a,(ix+$06)
1108: FE 40       cp   $40
110A: 30 07       jr   nc,$1113
110C: CD 77 11    call $1177
110F: 30 17       jr   nc,$1128
1111: 18 22       jr   $1135
1113: 3A 00 84    ld   a,($8400)
1116: 2F          cpl
1117: E6 06       and  $06
1119: 20 08       jr   nz,$1123
111B: 3E 10       ld   a,$10
111D: 85          add  a,l
111E: 6F          ld   l,a
111F: 3E 10       ld   a,$10
1121: 84          add  a,h
1122: 67          ld   h,a
1123: CD A1 11    call $11A1
1126: 38 0D       jr   c,$1135
1128: 2A F6 85    ld   hl,($85F6)
112B: 11 10 00    ld   de,$0010
112E: 19          add  hl,de
112F: 22 F6 85    ld   ($85F6),hl
1132: 10 B8       djnz $10EC
1134: C9          ret
1135: 78          ld   a,b
1136: 32 9E 87    ld   ($879E),a
1139: DD 22 C8 87 ld   ($87C8),ix
113D: 21 03 84    ld   hl,$8403
1140: CB D6       set  2,(hl)
1142: 21 01 84    ld   hl,$8401
1145: CB 9E       res  3,(hl)
1147: 2A F6 85    ld   hl,($85F6)
114A: CB B6       res  6,(hl)
114C: 11 0C 00    ld   de,$000C
114F: 19          add  hl,de
1150: 22 F6 85    ld   ($85F6),hl
1153: 21 DF 32    ld   hl,$32DF
1156: 3A 10 84    ld   a,($8410)
1159: 3D          dec  a
115A: 5F          ld   e,a
115B: 16 00       ld   d,$00
115D: 19          add  hl,de
115E: 7E          ld   a,(hl)
115F: DD 77 0C    ld   (ix+$0c),a
1162: 21 03 84    ld   hl,$8403
1165: CB 9E       res  3,(hl)
1167: CD 9F 0E    call $0E9F
116A: 3A 03 84    ld   a,($8403)
116D: CB 57       bit  2,a
116F: C8          ret  z
1170: CD 09 12    call $1209
1173: CD 09 12    call $1209
1176: C9          ret
1177: CB 49       bit  1,c
1179: 20 13       jr   nz,$118E
117B: 7D          ld   a,l
117C: 93          sub  e
117D: C6 08       add  a,$08
117F: FE 0C       cp   $0C
1181: D0          ret  nc
1182: 7C          ld   a,h
1183: 92          sub  d
1184: CB 51       bit  2,c
1186: 28 01       jr   z,$1189
1188: 2F          cpl
1189: D6 02       sub  $02
118B: FE 0C       cp   $0C
118D: C9          ret
118E: 7C          ld   a,h
118F: 92          sub  d
1190: C6 08       add  a,$08
1192: FE 0C       cp   $0C
1194: D0          ret  nc
1195: 7D          ld   a,l
1196: 93          sub  e
1197: CB 51       bit  2,c
1199: 20 01       jr   nz,$119C
119B: 2F          cpl
119C: D6 02       sub  $02
119E: FE 0C       cp   $0C
11A0: C9          ret
11A1: CB 49       bit  1,c
11A3: 20 14       jr   nz,$11B9
11A5: 7D          ld   a,l
11A6: 93          sub  e
11A7: C6 03       add  a,$03
11A9: FE 12       cp   $12
11AB: D0          ret  nc
11AC: 7C          ld   a,h
11AD: 92          sub  d
11AE: CB 51       bit  2,c
11B0: 28 02       jr   z,$11B4
11B2: C6 10       add  a,$10
11B4: D6 03       sub  $03
11B6: FE 12       cp   $12
11B8: C9          ret
11B9: 7C          ld   a,h
11BA: 92          sub  d
11BB: C6 07       add  a,$07
11BD: FE 12       cp   $12
11BF: D0          ret  nc
11C0: 7D          ld   a,l
11C1: 93          sub  e
11C2: CB 51       bit  2,c
11C4: 20 02       jr   nz,$11C8
11C6: C6 10       add  a,$10
11C8: D6 07       sub  $07
11CA: FE 12       cp   $12
11CC: C9          ret
11CD: 2A 03 84    ld   hl,($8403)
11D0: CB 5E       bit  3,(hl)
11D2: C0          ret  nz
11D3: CB 96       res  2,(hl)
11D5: 2B          dec  hl
11D6: 2B          dec  hl
11D7: CB DE       set  3,(hl)
11D9: C9          ret
11DA: 21 56 86    ld   hl,$8656
11DD: CB DE       set  3,(hl)
11DF: C9          ret
11E0: 21 24 98    ld   hl,$9824
11E3: 06 0C       ld   b,$0C
11E5: 36 32       ld   (hl),$32
11E7: 23          inc  hl
11E8: 23          inc  hl
11E9: 10 FA       djnz $11E5
11EB: C9          ret
11EC: 21 00 84    ld   hl,$8400
11EF: CB 4E       bit  1,(hl)
11F1: 20 0B       jr   nz,$11FE
11F3: 21 0D 84    ld   hl,$840D
11F6: 7E          ld   a,(hl)
11F7: 23          inc  hl
11F8: 23          inc  hl
11F9: 77          ld   (hl),a
11FA: 23          inc  hl
11FB: 77          ld   (hl),a
11FC: 18 08       jr   $1206
11FE: 21 0E 84    ld   hl,$840E
1201: 7E          ld   a,(hl)
1202: 23          inc  hl
1203: 77          ld   (hl),a
1204: 23          inc  hl
1205: 77          ld   (hl),a
1206: C3 BD 19    jp   $19BD
1209: 2A 42 86    ld   hl,($8642)
120C: 7E          ld   a,(hl)
120D: A7          and  a
120E: C8          ret  z
120F: 35          dec  (hl)
1210: 35          dec  (hl)
1211: 7E          ld   a,(hl)
1212: FE 22       cp   $22
1214: D2 22 12    jp   nc,$1222
1217: FE 12       cp   $12
1219: D2 1F 12    jp   nc,$121F
121C: CD F0 0F    call $0FF0
121F: CD F9 0F    call $0FF9
1222: CD 02 10    call $1002
1225: C9          ret
1226: A7          and  a
1227: 86          add  a,(hl)
1228: 27          daa
1229: 77          ld   (hl),a
122A: 2B          dec  hl
122B: 7E          ld   a,(hl)
122C: CE 00       adc  a,$00
122E: 27          daa
122F: 77          ld   (hl),a
1230: C9          ret
1231: C5          push bc
1232: F5          push af
1233: 3A 00 84    ld   a,($8400)
1236: CB 4F       bit  1,a
1238: 28 14       jr   z,$124E
123A: CB 57       bit  2,a
123C: 28 10       jr   z,$124E
123E: 2A F6 85    ld   hl,($85F6)
1241: 11 04 00    ld   de,$0004
1244: 19          add  hl,de
1245: 7E          ld   a,(hl)
1246: C6 10       add  a,$10
1248: 77          ld   (hl),a
1249: 23          inc  hl
124A: 7E          ld   a,(hl)
124B: C6 10       add  a,$10
124D: 77          ld   (hl),a
124E: F1          pop  af
124F: C1          pop  bc
1250: C9          ret
1251: DD 21 7E 99 ld   ix,$997E
1255: 21 7E 98    ld   hl,$987E
1258: 36 47       ld   (hl),$47
125A: 23          inc  hl
125B: 36 0A       ld   (hl),$0A
125D: DD 36 00 00 ld   (ix+$00),$00
1261: DD 21 76 99 ld   ix,$9976
1265: 21 76 98    ld   hl,$9876
1268: 11 77 98    ld   de,$9877
126B: C9          ret
126C: 11 05 00    ld   de,$0005
126F: 19          add  hl,de
1270: 3A 00 84    ld   a,($8400)
1273: CB 4F       bit  1,a
1275: 28 09       jr   z,$1280
1277: CB 57       bit  2,a
1279: 28 05       jr   z,$1280
127B: 7E          ld   a,(hl)
127C: D6 10       sub  $10
127E: 18 01       jr   $1281
1280: 7E          ld   a,(hl)
1281: FE 20       cp   $20
1283: 38 02       jr   c,$1287
1285: D6 08       sub  $08
1287: 07          rlca
1288: 07          rlca
1289: E6 03       and  $03
128B: C9          ret
128C: 21 80 9A    ld   hl,$9A80
128F: 06 20       ld   b,$20
1291: 36 00       ld   (hl),$00
1293: 23          inc  hl
1294: 10 FB       djnz $1291
1296: C9          ret
1297: 21 25 85    ld   hl,$8525
129A: 11 A5 84    ld   de,$84A5
129D: 01 80 00    ld   bc,$0080
12A0: CD BE 12    call $12BE
12A3: C9          ret
12A4: 21 65 84    ld   hl,$8465
12A7: 11 25 84    ld   de,$8425
12AA: 01 40 00    ld   bc,$0040
12AD: CD BE 12    call $12BE
12B0: C9          ret
12B1: 21 40 80    ld   hl,$8040
12B4: 11 00 90    ld   de,$9000
12B7: 01 80 03    ld   bc,$0380
12BA: CD BE 12    call $12BE
12BD: C9          ret
12BE: 1A          ld   a,(de)
12BF: ED A0       ldi
12C1: 2B          dec  hl
12C2: 77          ld   (hl),a
12C3: 23          inc  hl
12C4: 79          ld   a,c
12C5: B0          or   b
12C6: 20 F6       jr   nz,$12BE
12C8: C9          ret
12C9: CD 19 13    call $1319
12CC: CD 33 13    call $1333
12CF: CD DC 12    call $12DC
12D2: C9          ret
12D3: CD 19 13    call $1319
12D6: CD 44 13    call $1344
12D9: C3 CF 12    jp   $12CF
12DC: 21 05 13    ld   hl,$1305
12DF: 11 F0 98    ld   de,$98F0
12E2: 01 08 00    ld   bc,$0008
12E5: C5          push bc
12E6: ED B0       ldir
12E8: C1          pop  bc
12E9: 21 FD 12    ld   hl,$12FD
12EC: 11 70 98    ld   de,$9870
12EF: ED B0       ldir
12F1: 21 70 99    ld   hl,$9970
12F4: 06 04       ld   b,$04
12F6: 36 00       ld   (hl),$00
12F8: 23          inc  hl
12F9: 23          inc  hl
12FA: 10 FA       djnz $12F6
12FC: C9          ret
12FD: 68          ld   l,b
12FE: 0C          inc  c
12FF: 71          ld   (hl),c
1300: 0C          inc  c
1301: 70          ld   (hl),b
1302: 0C          inc  c
1303: 6F          ld   l,a
1304: 0C          inc  c
1305: 91          sub  c
1306: 98          sbc  a,b
1307: 81          add  a,c
1308: 98          sbc  a,b
1309: 69          ld   l,c
130A: 98          sbc  a,b
130B: 59          ld   e,c
130C: 98          sbc  a,b
130D: 79          ld   a,c
130E: 70          ld   (hl),b
130F: 69          ld   l,c
1310: 70          ld   (hl),b
1311: 59          ld   e,c
1312: 70          ld   (hl),b
1313: 68          ld   l,b
1314: 0C          inc  c
1315: 67          ld   h,a
1316: 0C          inc  c
1317: 66          ld   h,(hl)
1318: 0C          inc  c
1319: 21 0D 13    ld   hl,$130D
131C: 11 FA 98    ld   de,$98FA
131F: 01 06 00    ld   bc,$0006
1322: C5          push bc
1323: ED B0       ldir
1325: C1          pop  bc
1326: 21 13 13    ld   hl,$1313
1329: 11 7A 98    ld   de,$987A
132C: ED B0       ldir
132E: 21 78 99    ld   hl,$9978
1331: 18 C1       jr   $12F4
1333: 21 78 98    ld   hl,$9878
1336: 36 6A       ld   (hl),$6A
1338: 23          inc  hl
1339: 36 0C       ld   (hl),$0C
133B: 21 F8 98    ld   hl,$98F8
133E: 36 89       ld   (hl),$89
1340: 23          inc  hl
1341: 36 70       ld   (hl),$70
1343: C9          ret
1344: 21 78 98    ld   hl,$9878
1347: 36 6B       ld   (hl),$6B
1349: 18 ED       jr   $1338
134B: C3 D3 1C    jp   $1CD3
134E: 21 29 85    ld   hl,$8529
1351: 11 10 00    ld   de,$0010
1354: 06 08       ld   b,$08
1356: 22 F6 85    ld   ($85F6),hl
1359: 4E          ld   c,(hl)
135A: 3A A2 98    ld   a,($98A2)
135D: B9          cp   c
135E: DA 64 13    jp   c,$1364
1361: 91          sub  c
1362: 18 05       jr   $1369
1364: D5          push de
1365: 57          ld   d,a
1366: 79          ld   a,c
1367: 92          sub  d
1368: D1          pop  de
1369: 32 1A 86    ld   ($861A),a
136C: 2A F6 85    ld   hl,($85F6)
136F: 23          inc  hl
1370: 4E          ld   c,(hl)
1371: 3A A3 98    ld   a,($98A3)
1374: B9          cp   c
1375: DA 7B 13    jp   c,$137B
1378: 91          sub  c
1379: 18 05       jr   $1380
137B: D5          push de
137C: 57          ld   d,a
137D: 79          ld   a,c
137E: 92          sub  d
137F: D1          pop  de
1380: 5F          ld   e,a
1381: 16 00       ld   d,$00
1383: 3A 1A 86    ld   a,($861A)
1386: 6F          ld   l,a
1387: 26 00       ld   h,$00
1389: 19          add  hl,de
138A: 7C          ld   a,h
138B: A7          and  a
138C: C2 FF 13    jp   nz,$13FF
138F: 7D          ld   a,l
1390: FE 0A       cp   $0A
1392: D2 FF 13    jp   nc,$13FF
1395: 2A F6 85    ld   hl,($85F6)
1398: 2B          dec  hl
1399: 2B          dec  hl
139A: 2B          dec  hl
139B: 2B          dec  hl
139C: 7E          ld   a,(hl)
139D: E6 BC       and  $BC
139F: C2 FF 13    jp   nz,$13FF
13A2: 21 4A 86    ld   hl,$864A
13A5: CB 86       res  0,(hl)
13A7: 21 01 84    ld   hl,$8401
13AA: CB 7E       bit  7,(hl)
13AC: C0          ret  nz
13AD: CB FE       set  7,(hl)
13AF: 23          inc  hl
13B0: CB 86       res  0,(hl)
13B2: 21 4A 86    ld   hl,$864A
13B5: CB 46       bit  0,(hl)
13B7: 20 1F       jr   nz,$13D8
13B9: 2A F6 85    ld   hl,($85F6)
13BC: 2B          dec  hl
13BD: 2B          dec  hl
13BE: 2B          dec  hl
13BF: 2B          dec  hl
13C0: CB 8E       res  1,(hl)
13C2: CB 46       bit  0,(hl)
13C4: F5          push af
13C5: 11 06 00    ld   de,$0006
13C8: 19          add  hl,de
13C9: F1          pop  af
13CA: 20 07       jr   nz,$13D3
13CC: 36 20       ld   (hl),$20
13CE: 23          inc  hl
13CF: 36 01       ld   (hl),$01
13D1: 18 05       jr   $13D8
13D3: 36 24       ld   (hl),$24
13D5: 23          inc  hl
13D6: 36 02       ld   (hl),$02
13D8: 21 1C 86    ld   hl,$861C
13DB: 36 A0       ld   (hl),$A0
13DD: CD 8C 12    call $128C
13E0: 21 76 98    ld   hl,$9876
13E3: 36 32       ld   (hl),$32
13E5: 21 7E 98    ld   hl,$987E
13E8: 36 32       ld   (hl),$32
13EA: 3E 01       ld   a,$01
13EC: 32 84 9A    ld   ($9A84),a
13EF: 21 22 98    ld   hl,$9822
13F2: 3A AE 85    ld   a,($85AE)
13F5: CB 4F       bit  1,a
13F7: 28 03       jr   z,$13FC
13F9: 36 4D       ld   (hl),$4D
13FB: C9          ret
13FC: 36 4C       ld   (hl),$4C
13FE: C9          ret
13FF: 2A F6 85    ld   hl,($85F6)
1402: 11 10 00    ld   de,$0010
1405: 19          add  hl,de
1406: 05          dec  b
1407: C2 56 13    jp   nz,$1356
140A: C9          ret
140B: 21 00 84    ld   hl,$8400
140E: CB 4E       bit  1,(hl)
1410: 20 07       jr   nz,$1419
1412: 3A 0A 84    ld   a,(player_1_lives_840a)
1415: 32 0C 84    ld   ($840C),a
1418: C9          ret
1419: 3A 0B 84    ld   a,(player_2_lives_840b)
141C: 32 0C 84    ld   ($840C),a
141F: C9          ret
1420: AF          xor  a
1421: 32 92 9A    ld   ($9A92),a
1424: C9          ret
1425: 3A 46 86    ld   a,($8646)
1428: CB 47       bit  0,a
142A: 20 F4       jr   nz,$1420
142C: 3E 01       ld   a,$01
142E: 32 92 9A    ld   ($9A92),a
1431: C9          ret
1432: 21 D4 83    ld   hl,$83D4
1435: DD 21 45 14 ld   ix,$1445
1439: 06 0A       ld   b,$0A
143B: DD 7E 00    ld   a,(ix+$00)
143E: 77          ld   (hl),a
143F: 2B          dec  hl
1440: DD 23       inc  ix
1442: 10 F7       djnz $143B
1444: C9          ret
1445: A1          and  c
1446: A2          and  d
1447: A0          and  b
1448: A1          and  c
1449: 7F          ld   a,a
144A: AC          xor  h
144B: 9C          sbc  a,h
144C: A8          xor  b
144D: AB          xor  e
144E: 9E          sbc  a,(hl)
144F: 21 DA 83    ld   hl,$83DA
1452: DD 21 65 14 ld   ix,$1465
1456: 06 03       ld   b,$03
1458: C3 3B 14    jp   $143B
145B: 21 C7 83    ld   hl,$83C7
145E: DD 21 68 14 ld   ix,$1468
1462: C3 56 14    jp   $1456
1465: 91          sub  c
1466: AE          xor  (hl)
1467: A9          xor  c
1468: 92          sub  d
1469: AE          xor  (hl)
146A: A9          xor  c
146B: CD 32 14    call $1432
146E: CD 83 14    call $1483
1471: CD DE 14    call $14DE
1474: 3A 00 84    ld   a,($8400)
1477: CB 47       bit  0,a
1479: CA 7F 14    jp   z,$147F
147C: CD F4 14    call $14F4
147F: CD E9 14    call $14E9
1482: C9          ret
1483: 3A 00 84    ld   a,($8400)
1486: CB 47       bit  0,a
1488: C2 9C 14    jp   nz,$149C
148B: CD D8 14    call $14D8
148E: 3A 23 84    ld   a,($8423)
1491: CB 6F       bit  5,a
1493: F5          push af
1494: C4 4F 14    call nz,$144F
1497: F1          pop  af
1498: CC B8 14    call z,$14B8
149B: C9          ret
149C: CB 4F       bit  1,a
149E: C2 A7 14    jp   nz,$14A7
14A1: CD 5B 14    call $145B
14A4: C3 8E 14    jp   $148E
14A7: CD 4F 14    call $144F
14AA: 3A 23 84    ld   a,($8423)
14AD: CB 6F       bit  5,a
14AF: F5          push af
14B0: C4 5B 14    call nz,$145B
14B3: F1          pop  af
14B4: CC D8 14    call z,$14D8
14B7: C9          ret
14B8: 21 DA 83    ld   hl,$83DA
14BB: 3A CC 87    ld   a,($87CC)
14BE: CB 4F       bit  1,a
14C0: CA D0 14    jp   z,$14D0
14C3: CB 57       bit  2,a
14C5: C2 D0 14    jp   nz,$14D0
14C8: 3E 0C       ld   a,$0C
14CA: 77          ld   (hl),a
14CB: 2B          dec  hl
14CC: 77          ld   (hl),a
14CD: 2B          dec  hl
14CE: 77          ld   (hl),a
14CF: C9          ret
14D0: 3E 8C       ld   a,$8C
14D2: 77          ld   (hl),a
14D3: 2B          dec  hl
14D4: 77          ld   (hl),a
14D5: 2B          dec  hl
14D6: 77          ld   (hl),a
14D7: C9          ret
14D8: 21 C7 83    ld   hl,$83C7
14DB: C3 BB 14    jp   $14BB
14DE: 11 27 89    ld   de,$8927
14E1: DD 21 F2 83 ld   ix,$83F2
14E5: CD FF 14    call $14FF
14E8: C9          ret
14E9: 11 14 84    ld   de,player_1_score_8414
14EC: DD 21 FC 83 ld   ix,$83FC
14F0: CD FF 14    call $14FF
14F3: C9          ret
14F4: 11 17 84    ld   de,player_2_score_8417
14F7: DD 21 E9 83 ld   ix,$83E9
14FB: CD FF 14    call $14FF
14FE: C9          ret
14FF: 21 1D 84    ld   hl,$841D
1502: 06 03       ld   b,$03
1504: 1A          ld   a,(de)
1505: E6 0F       and  $0F
1507: 77          ld   (hl),a
1508: 23          inc  hl
1509: 1A          ld   a,(de)
150A: CB 3F       srl  a
150C: CB 3F       srl  a
150E: CB 3F       srl  a
1510: CB 3F       srl  a
1512: 77          ld   (hl),a
1513: 23          inc  hl
1514: 13          inc  de
1515: 10 ED       djnz $1504
1517: 21 22 84    ld   hl,$8422
151A: 06 04       ld   b,$04
151C: 7E          ld   a,(hl)
151D: A7          and  a
151E: 20 18       jr   nz,$1538
1520: 3A CC 87    ld   a,($87CC)
1523: CB 4F       bit  1,a
1525: CA 32 15    jp   z,$1532
1528: CB 57       bit  2,a
152A: C2 32 15    jp   nz,$1532
152D: 3E 0C       ld   a,$0C
152F: C3 34 15    jp   $1534
1532: 3E 8C       ld   a,$8C
1534: 77          ld   (hl),a
1535: 2B          dec  hl
1536: 10 E4       djnz $151C
1538: 21 22 84    ld   hl,$8422
153B: 06 06       ld   b,$06
153D: 7E          ld   a,(hl)
153E: FE 8C       cp   $8C
1540: 28 06       jr   z,$1548
1542: FE 0C       cp   $0C
1544: 28 02       jr   z,$1548
1546: C6 10       add  a,$10
1548: DD 77 00    ld   (ix+$00),a
154B: 2B          dec  hl
154C: DD 2B       dec  ix
154E: 10 ED       djnz $153D
1550: C9          ret
1551: 21 A4 98    ld   hl,$98A4
1554: 06 0C       ld   b,$0C
1556: 36 00       ld   (hl),$00
1558: 23          inc  hl
1559: 36 50       ld   (hl),$50
155B: 23          inc  hl
155C: 10 F8       djnz $1556
155E: C9          ret
155F: DD 4E 00    ld   c,(ix+$00)
1562: 3A A2 98    ld   a,($98A2)
1565: B9          cp   c
1566: DA 6C 15    jp   c,$156C
1569: 91          sub  c
156A: 18 03       jr   $156F
156C: 57          ld   d,a
156D: 79          ld   a,c
156E: 92          sub  d
156F: FE 0B       cp   $0B
1571: D0          ret  nc
1572: FD 4E 00    ld   c,(iy+$00)
1575: 3A A3 98    ld   a,($98A3)
1578: B9          cp   c
1579: DA 7F 15    jp   c,$157F
157C: 91          sub  c
157D: 18 03       jr   $1582
157F: 57          ld   d,a
1580: 79          ld   a,c
1581: 92          sub  d
1582: FE 0B       cp   $0B
1584: D0          ret  nc
1585: 2A F6 85    ld   hl,($85F6)
1588: 11 04 00    ld   de,$0004
158B: 19          add  hl,de
158C: 22 F6 85    ld   ($85F6),hl
158F: 21 4A 86    ld   hl,$864A
1592: CB C6       set  0,(hl)
1594: C3 A7 13    jp   $13A7
1597: F5          push af
1598: 21 00 80    ld   hl,$8000
159B: 01 C0 03    ld   bc,$03C0
159E: CD BF 15    call $15BF
15A1: CD EC 11    call $11EC
15A4: F1          pop  af
15A5: C9          ret
15A6: F5          push af
15A7: 21 40 80    ld   hl,$8040
15AA: 01 80 03    ld   bc,$0380
15AD: CD BF 15    call $15BF
15B0: 21 C0 83    ld   hl,$83C0
15B3: 06 3F       ld   b,$3F
15B5: 36 7F       ld   (hl),$7F
15B7: 32 30 68    ld   (watchdog_6830),a
15BA: 23          inc  hl
15BB: 10 F8       djnz $15B5
15BD: F1          pop  af
15BE: C9          ret
15BF: 36 7F       ld   (hl),$7F
15C1: 32 30 68    ld   (watchdog_6830),a
15C4: 23          inc  hl
15C5: 0B          dec  bc
15C6: 79          ld   a,c
15C7: B0          or   b
15C8: 20 F5       jr   nz,$15BF
15CA: C9          ret
15CB: F5          push af
15CC: 11 20 00    ld   de,$0020
15CF: DD 7E 00    ld   a,(ix+$00)
15D2: 77          ld   (hl),a
15D3: DD 23       inc  ix
15D5: 19          add  hl,de
15D6: F1          pop  af
15D7: 3D          dec  a
15D8: 20 F1       jr   nz,$15CB
15DA: C9          ret
15DB: F5          push af
15DC: 21 62 30    ld   hl,$3062
15DF: 11 16 80    ld   de,$8016
15E2: 01 06 00    ld   bc,$0006
15E5: ED B0       ldir
15E7: 3A A5 85    ld   a,($85A5)
15EA: 47          ld   b,a
15EB: E6 0F       and  $0F
15ED: C6 10       add  a,$10
15EF: 32 13 80    ld   ($8013),a
15F2: 78          ld   a,b
15F3: 0F          rrca
15F4: 0F          rrca
15F5: 0F          rrca
15F6: 0F          rrca
15F7: E6 0F       and  $0F
15F9: 28 04       jr   z,$15FF
15FB: C6 10       add  a,$10
15FD: 18 02       jr   $1601
15FF: 3E 7F       ld   a,$7F
1601: 32 14 80    ld   ($8014),a
1604: F1          pop  af
1605: C9          ret
1606: 21 2D 81    ld   hl,$812D
1609: 11 20 00    ld   de,$0020
160C: 3A A5 85    ld   a,($85A5)
160F: FE 01       cp   $01
1611: 20 0A       jr   nz,$161D
1613: DD 21 6F 30 ld   ix,$306F
1617: 3E 0D       ld   a,$0D
1619: CD CB 15    call $15CB
161C: C9          ret
161D: DD 21 7C 30 ld   ix,$307C
1621: 3E 0E       ld   a,$0E
1623: 18 F4       jr   $1619
1625: F5          push af
1626: 21 FA 80    ld   hl,$80FA
1629: 11 20 00    ld   de,$0020
162C: DD 21 8A 30 ld   ix,$308A
1630: 3E 11       ld   a,$11
1632: CD CB 15    call $15CB
1635: 21 9C 81    ld   hl,$819C
1638: DD 21 9B 30 ld   ix,$309B
163C: 3E 08       ld   a,$08
163E: 18 4B       jr   $168B
1640: F5          push af
1641: 21 EA 80    ld   hl,$80EA
1644: 11 20 00    ld   de,$0020
1647: DD 21 A3 30 ld   ix,$30A3
164B: 3E 11       ld   a,$11
164D: CD CB 15    call $15CB
1650: 3A C0 87    ld   a,($87C0)
1653: A7          and  a
1654: 20 02       jr   nz,$1658
1656: F1          pop  af
1657: C9          ret
1658: 21 B1 80    ld   hl,$80B1
165B: DD 21 B4 30 ld   ix,$30B4
165F: 3E 14       ld   a,$14
1661: CD CB 15    call $15CB
1664: 3A C0 87    ld   a,($87C0)
1667: FE 01       cp   $01
1669: 20 02       jr   nz,$166D
166B: F1          pop  af
166C: C9          ret
166D: 21 B4 80    ld   hl,$80B4
1670: DD 21 C8 30 ld   ix,$30C8
1674: 3E 14       ld   a,$14
1676: CD CB 15    call $15CB
1679: 3A C0 87    ld   a,($87C0)
167C: FE 02       cp   $02
167E: 20 02       jr   nz,$1682
1680: F1          pop  af
1681: C9          ret
1682: 21 B7 80    ld   hl,$80B7
1685: DD 21 DC 30 ld   ix,$30DC
1689: 3E 14       ld   a,$14
168B: CD CB 15    call $15CB
168E: F1          pop  af
168F: C9          ret
1690: F5          push af
1691: 3A C0 87    ld   a,($87C0)
1694: A7          and  a
1695: 20 02       jr   nz,$1699
1697: F1          pop  af
1698: C9          ret
1699: 11 20 00    ld   de,$0020
169C: 21 B1 81    ld   hl,$81B1
169F: 01 AA 85    ld   bc,$85AA
16A2: 0A          ld   a,(bc)
16A3: C6 50       add  a,$50
16A5: 77          ld   (hl),a
16A6: 03          inc  bc
16A7: 19          add  hl,de
16A8: 0A          ld   a,(bc)
16A9: A7          and  a
16AA: 28 05       jr   z,$16B1
16AC: C6 50       add  a,$50
16AE: 77          ld   (hl),a
16AF: 18 02       jr   $16B3
16B1: 36 7F       ld   (hl),$7F
16B3: 3A C0 87    ld   a,($87C0)
16B6: FE 01       cp   $01
16B8: 20 02       jr   nz,$16BC
16BA: F1          pop  af
16BB: C9          ret
16BC: 21 B4 81    ld   hl,$81B4
16BF: CD D3 16    call $16D3
16C2: 3A C0 87    ld   a,($87C0)
16C5: FE 02       cp   $02
16C7: 20 02       jr   nz,$16CB
16C9: F1          pop  af
16CA: C9          ret
16CB: 21 B7 81    ld   hl,$81B7
16CE: CD D3 16    call $16D3
16D1: F1          pop  af
16D2: C9          ret
16D3: 01 AC 85    ld   bc,$85AC
16D6: 11 20 00    ld   de,$0020
16D9: 0A          ld   a,(bc)
16DA: C6 50       add  a,$50
16DC: 77          ld   (hl),a
16DD: 03          inc  bc
16DE: 19          add  hl,de
16DF: DD 19       add  ix,de
16E1: 0A          ld   a,(bc)
16E2: C6 50       add  a,$50
16E4: 77          ld   (hl),a
16E5: 21 32 85    ld   hl,$8532
16E8: 11 64 99    ld   de,$9964
16EB: 06 08       ld   b,$08
16ED: 7E          ld   a,(hl)
16EE: 12          ld   (de),a
16EF: 13          inc  de
16F0: 13          inc  de
16F1: D5          push de
16F2: 11 10 00    ld   de,$0010
16F5: 19          add  hl,de
16F6: D1          pop  de
16F7: 10 F4       djnz $16ED
16F9: C9          ret
16FA: 3A 00 84    ld   a,($8400)
16FD: CB 4F       bit  1,a
16FF: 20 05       jr   nz,$1706
1701: 21 0D 84    ld   hl,$840D
1704: 18 03       jr   $1709
1706: 21 0E 84    ld   hl,$840E
1709: 7E          ld   a,(hl)
170A: 21 E8 87    ld   hl,$87E8
170D: FE 12       cp   $12
170F: DA 14 17    jp   c,$1714
1712: 3E 12       ld   a,$12
1714: 77          ld   (hl),a
1715: D6 01       sub  $01
1717: 87          add  a,a
1718: 87          add  a,a
1719: 5F          ld   e,a
171A: 16 00       ld   d,$00
171C: 21 34 17    ld   hl,$1734
171F: 19          add  hl,de
1720: 7E          ld   a,(hl)
1721: 32 1E 98    ld   ($981E),a
1724: 23          inc  hl
1725: 7E          ld   a,(hl)
1726: 32 1F 98    ld   ($981F),a
1729: 23          inc  hl
172A: 7E          ld   a,(hl)
172B: 32 E7 87    ld   ($87E7),a
172E: 23          inc  hl
172F: 7E          ld   a,(hl)
1730: 32 E6 87    ld   ($87E6),a
1733: C9          ret
1734: 52          ld   d,d
1735: 0D          dec  c
1736: 04          inc  b
1737: 5D          ld   e,l
1738: 53          ld   d,e
1739: 0E 06       ld   c,$06
173B: 5E          ld   e,(hl)
173C: 54          ld   d,h
173D: 0F          rrca
173E: 08          ex   af,af'
173F: 5F          ld   e,a
1740: 55          ld   d,l
1741: 10 10       djnz $1753
1743: 60          ld   h,b
1744: 55          ld   d,l
1745: 10 10       djnz $1757
1747: 60          ld   h,b
1748: 56          ld   d,(hl)
1749: 10 20       djnz $176B
174B: 4E          ld   c,(hl)
174C: 56          ld   d,(hl)
174D: 10 20       djnz $176F
174F: 4E          ld   c,(hl)
1750: 57          ld   d,a
1751: 11 30 4F    ld   de,$4F30
1754: 57          ld   d,a
1755: 11 30 4F    ld   de,$4F30
1758: 58          ld   e,b
1759: 12          ld   (de),a
175A: 40          ld   b,b
175B: 61          ld   h,c
175C: 58          ld   e,b
175D: 12          ld   (de),a
175E: 40          ld   b,b
175F: 61          ld   h,c
1760: 59          ld   e,c
1761: 13          inc  de
1762: 50          ld   d,b
1763: 50          ld   d,b
1764: 59          ld   e,c
1765: 13          inc  de
1766: 50          ld   d,b
1767: 50          ld   d,b
1768: 5A          ld   e,d
1769: 14          inc  d
176A: 60          ld   h,b
176B: 62          ld   h,d
176C: 5A          ld   e,d
176D: 14          inc  d
176E: 60          ld   h,b
176F: 62          ld   h,d
1770: 5B          ld   e,e
1771: 15          dec  d
1772: 70          ld   (hl),b
1773: 51          ld   d,c
1774: 5B          ld   e,e
1775: 15          dec  d
1776: 70          ld   (hl),b
1777: 51          ld   d,c
1778: 5C          ld   e,h
1779: 16 80       ld   d,$80
177B: 63          ld   h,e
177C: 21 00 90    ld   hl,$9000
177F: 7D          ld   a,l
1780: E6 1F       and  $1F
1782: FE 03       cp   $03
1784: DA A2 17    jp   c,$17A2
1787: 36 7F       ld   (hl),$7F
1789: 23          inc  hl
178A: 32 30 68    ld   (watchdog_6830),a
178D: 7D          ld   a,l
178E: FE 80       cp   $80
1790: 20 ED       jr   nz,$177F
1792: 7C          ld   a,h
1793: FE 93       cp   $93
1795: 20 E8       jr   nz,$177F
1797: 3E 8F       ld   a,$8F
1799: 32 01 90    ld   ($9001),a
179C: 3E 8E       ld   a,$8E
179E: 32 61 93    ld   ($9361),a
17A1: C9          ret
17A2: FE 01       cp   $01
17A4: 20 04       jr   nz,$17AA
17A6: 36 8D       ld   (hl),$8D
17A8: 18 DF       jr   $1789
17AA: 36 7E       ld   (hl),$7E
17AC: 18 DB       jr   $1789
17AE: 21 40 80    ld   hl,$8040
17B1: 7D          ld   a,l
17B2: E6 1F       and  $1F
17B4: FE 03       cp   $03
17B6: DA E1 17    jp   c,$17E1
17B9: 36 7F       ld   (hl),$7F
17BB: 23          inc  hl
17BC: 32 30 68    ld   (watchdog_6830),a
17BF: 7D          ld   a,l
17C0: FE C0       cp   $C0
17C2: 20 ED       jr   nz,$17B1
17C4: 7C          ld   a,h
17C5: FE 83       cp   $83
17C7: 20 E8       jr   nz,$17B1
17C9: 3E 8F       ld   a,$8F
17CB: 32 41 80    ld   ($8041),a
17CE: 36 8E       ld   (hl),$8E
17D0: 32 A1 83    ld   ($83A1),a
17D3: 21 00 80    ld   hl,$8000
17D6: 06 40       ld   b,$40
17D8: 32 30 68    ld   (watchdog_6830),a
17DB: 36 0C       ld   (hl),$0C
17DD: 23          inc  hl
17DE: 10 F8       djnz $17D8
17E0: C9          ret
17E1: FE 01       cp   $01
17E3: 20 04       jr   nz,$17E9
17E5: 36 8D       ld   (hl),$8D
17E7: 18 D2       jr   $17BB
17E9: 36 7E       ld   (hl),$7E
17EB: 18 CE       jr   $17BB
17ED: 21 11 84    ld   hl,$8411
17F0: 06 09       ld   b,$09
17F2: 36 00       ld   (hl),$00
17F4: 23          inc  hl
17F5: 10 FB       djnz $17F2
17F7: C9          ret
17F8: 3A CF 87    ld   a,($87CF)
17FB: CB 5F       bit  3,a
17FD: 20 1F       jr   nz,$181E
17FF: 3A 87 87    ld   a,($8787)
1802: CB 4F       bit  1,a
1804: 20 18       jr   nz,$181E
1806: 21 0D 84    ld   hl,$840D
1809: 7E          ld   a,(hl)
180A: FE 00       cp   $00
180C: 28 01       jr   z,$180F
180E: 35          dec  (hl)
180F: 4E          ld   c,(hl)
1810: 23          inc  hl
1811: 7E          ld   a,(hl)
1812: FE 00       cp   $00
1814: 20 02       jr   nz,$1818
1816: 36 01       ld   (hl),$01
1818: 23          inc  hl
1819: 71          ld   (hl),c
181A: 23          inc  hl
181B: 71          ld   (hl),c
181C: 18 0F       jr   $182D
181E: 21 0D 84    ld   hl,$840D
1821: 06 04       ld   b,$04
1823: 36 00       ld   (hl),$00
1825: 23          inc  hl
1826: 10 FB       djnz $1823
1828: 3E 01       ld   a,$01
182A: 32 0E 84    ld   ($840E),a
182D: 3A 57 86    ld   a,($8657)
1830: CB 4F       bit  1,a
1832: C8          ret  z
1833: 06 04       ld   b,$04
1835: 21 0D 84    ld   hl,$840D
1838: 36 02       ld   (hl),$02
183A: 23          inc  hl
183B: 10 FB       djnz $1838
183D: C9          ret
183E: 21 09 84    ld   hl,$8409
1841: 7E          ld   a,(hl)
1842: C3 64 19    jp   $1964

1845: 21 0C 80    ld   hl,$800C
1848: 11 2C 80    ld   de,$802C
184B: 06 14       ld   b,$14
184D: 3E 0C       ld   a,$0C
184F: 77          ld   (hl),a
1850: 32 30 68    ld   (watchdog_6830),a
1853: 12          ld   (de),a
1854: 23          inc  hl
1855: 13          inc  de
1856: 10 F5       djnz $184D
1858: 3A 0C 84    ld   a,($840C)
185B: FE 00       cp   $00
185D: C8          ret  z
185E: FE 0A       cp   $0A
1860: 38 02       jr   c,$1864
1862: 3E 09       ld   a,$09
1864: 47          ld   b,a
1865: 21 1D 80    ld   hl,$801D
1868: E5          push hl
1869: CD 72 18    call $1872
186C: E1          pop  hl
186D: 2B          dec  hl
186E: 2B          dec  hl
186F: 10 F7       djnz $1868
1871: C9          ret
1872: 11 20 00    ld   de,$0020
1875: 3E 7F       ld   a,$7F
1877: 77          ld   (hl),a
1878: 2B          dec  hl
1879: 77          ld   (hl),a
187A: 19          add  hl,de
187B: 77          ld   (hl),a
187C: 23          inc  hl
187D: 77          ld   (hl),a
187E: C9          ret
187F: 21 A5 84    ld   hl,$84A5
1882: 06 80       ld   b,$80
1884: 36 00       ld   (hl),$00
1886: 23          inc  hl
1887: 32 30 68    ld   (watchdog_6830),a
188A: 10 F8       djnz $1884
188C: C9          ret
188D: 21 25 85    ld   hl,$8525
1890: 18 F0       jr   $1882
1892: 21 25 84    ld   hl,$8425
1895: 06 08       ld   b,$08
1897: 3E 00       ld   a,$00
1899: 77          ld   (hl),a
189A: 23          inc  hl
189B: 36 90       ld   (hl),$90
189D: CD 64 19    call $1964
18A0: CD 64 19    call $1964
18A3: 23          inc  hl
18A4: 10 F1       djnz $1897
18A6: C9          ret
18A7: 21 65 84    ld   hl,$8465
18AA: 18 E9       jr   $1895
18AC: 21 68 31    ld   hl,$3168
18AF: CD DE 1B    call $1BDE
18B2: 4F          ld   c,a
18B3: 87          add  a,a
18B4: 87          add  a,a
18B5: 87          add  a,a
18B6: 87          add  a,a
18B7: 5F          ld   e,a
18B8: 16 00       ld   d,$00
18BA: 19          add  hl,de
18BB: 06 08       ld   b,$08
18BD: E5          push hl
18BE: 5E          ld   e,(hl)
18BF: 23          inc  hl
18C0: 56          ld   d,(hl)
18C1: 7A          ld   a,d
18C2: A7          and  a
18C3: 28 04       jr   z,$18C9
18C5: EB          ex   de,hl
18C6: CD 28 19    call $1928
18C9: E1          pop  hl
18CA: 23          inc  hl
18CB: 23          inc  hl
18CC: 32 30 68    ld   (watchdog_6830),a
18CF: 10 EC       djnz $18BD
18D1: 21 D0 81    ld   hl,$81D0
18D4: 3E 02       ld   a,$02
18D6: 4F          ld   c,a
18D7: AF          xor  a
18D8: CD 28 19    call $1928
18DB: 3A 57 86    ld   a,($8657)
18DE: CB 4F       bit  1,a
18E0: 20 12       jr   nz,$18F4
18E2: 21 85 87    ld   hl,$8785
18E5: 3A 00 84    ld   a,($8400)
18E8: CB 4F       bit  1,a
18EA: 20 05       jr   nz,$18F1
18EC: CB 46       bit  0,(hl)
18EE: C8          ret  z
18EF: 18 03       jr   $18F4
18F1: CB 4E       bit  1,(hl)
18F3: C8          ret  z
18F4: 21 0A 19    ld   hl,$190A
18F7: 11 02 82    ld   de,$8202
18FA: 01 0F 00    ld   bc,$000F
18FD: C5          push bc
18FE: ED B0       ldir
1900: C1          pop  bc
1901: 21 19 19    ld   hl,$1919
1904: 11 22 82    ld   de,$8222
1907: ED B0       ldir
1909: C9          ret
190A: 8C          adc  a,h
190B: 02          ld   (bc),a
190C: 02          ld   (bc),a
190D: 02          ld   (bc),a
190E: 02          ld   (bc),a
190F: 02          ld   (bc),a
1910: 02          ld   (bc),a
1911: 02          ld   (bc),a
1912: 02          ld   (bc),a
1913: 02          ld   (bc),a
1914: 02          ld   (bc),a
1915: 02          ld   (bc),a
1916: 02          ld   (bc),a
1917: 02          ld   (bc),a
1918: 0C          inc  c
1919: 8C          adc  a,h
191A: 03          inc  bc
191B: 03          inc  bc
191C: 03          inc  bc
191D: 03          inc  bc
191E: 03          inc  bc
191F: 03          inc  bc
1920: 03          inc  bc
1921: 03          inc  bc
1922: 03          inc  bc
1923: 03          inc  bc
1924: 03          inc  bc
1925: 03          inc  bc
1926: 03          inc  bc
1927: 0C          inc  c
1928: C5          push bc
1929: 78          ld   a,b
192A: FE 05       cp   $05
192C: DA 6B 19    jp   c,$196B
192F: E5          push hl
1930: 36 00       ld   (hl),$00
1932: 3E 02       ld   a,$02
1934: CD 64 19    call $1964
1937: 79          ld   a,c
1938: FE 00       cp   $00
193A: 20 05       jr   nz,$1941
193C: 3E 02       ld   a,$02
193E: CD 62 19    call $1962
1941: 23          inc  hl
1942: 36 02       ld   (hl),$02
1944: 23          inc  hl
1945: 36 04       ld   (hl),$04
1947: E1          pop  hl
1948: 11 20 00    ld   de,$0020
194B: 19          add  hl,de
194C: 36 01       ld   (hl),$01
194E: 3E 03       ld   a,$03
1950: CD 62 19    call $1962
1953: 79          ld   a,c
1954: FE 00       cp   $00
1956: 20 05       jr   nz,$195D
1958: 3E 03       ld   a,$03
195A: CD 62 19    call $1962
195D: 23          inc  hl
195E: 36 05       ld   (hl),$05
1960: C1          pop  bc
1961: C9          ret
1962: 23          inc  hl
1963: 77          ld   (hl),a
1964: 23          inc  hl
1965: 77          ld   (hl),a
1966: 23          inc  hl
1967: 77          ld   (hl),a
1968: 23          inc  hl
1969: 77          ld   (hl),a
196A: C9          ret
196B: 11 20 00    ld   de,$0020
196E: 36 0A       ld   (hl),$0A
1970: 23          inc  hl
1971: 36 0B       ld   (hl),$0B
1973: 2B          dec  hl
1974: 79          ld   a,c
1975: FE 00       cp   $00
1977: 20 06       jr   nz,$197F
1979: CD 93 19    call $1993
197C: CD 93 19    call $1993
197F: CD 93 19    call $1993
1982: CD 93 19    call $1993
1985: CD 93 19    call $1993
1988: CD 93 19    call $1993
198B: 19          add  hl,de
198C: 36 06       ld   (hl),$06
198E: 23          inc  hl
198F: 36 07       ld   (hl),$07
1991: C1          pop  bc
1992: C9          ret
1993: 19          add  hl,de
1994: 36 08       ld   (hl),$08
1996: 23          inc  hl
1997: 36 09       ld   (hl),$09
1999: 2B          dec  hl
199A: C9          ret
199B: 21 05 9A    ld   hl,$9A05
199E: 7E          ld   a,(hl)
199F: 23          inc  hl
19A0: 77          ld   (hl),a
19A1: 18 22       jr   $19C5
19A3: 21 00 84    ld   hl,$8400
19A6: CB 4E       bit  1,(hl)
19A8: 20 0C       jr   nz,$19B6
19AA: 21 0D 84    ld   hl,$840D
19AD: 34          inc  (hl)
19AE: 7E          ld   a,(hl)
19AF: 23          inc  hl
19B0: 23          inc  hl
19B1: 77          ld   (hl),a
19B2: 23          inc  hl
19B3: 77          ld   (hl),a
19B4: 18 07       jr   $19BD
19B6: 21 0E 84    ld   hl,$840E
19B9: 34          inc  (hl)
19BA: 7E          ld   a,(hl)
19BB: 18 F3       jr   $19B0
19BD: 3A 57 86    ld   a,($8657)
19C0: CB 4F       bit  1,a
19C2: 20 D7       jr   nz,$199B
19C4: 2B          dec  hl
19C5: CD 21 1A    call $1A21
19C8: 7E          ld   a,(hl)
19C9: E6 0F       and  $0F
19CB: C6 10       add  a,$10
19CD: 32 23 80    ld   ($8023),a
19D0: 7E          ld   a,(hl)
19D1: 0F          rrca
19D2: 0F          rrca
19D3: 0F          rrca
19D4: 0F          rrca
19D5: E6 0F       and  $0F
19D7: 28 07       jr   z,$19E0
19D9: C6 10       add  a,$10
19DB: 32 24 80    ld   ($8024),a
19DE: 18 05       jr   $19E5
19E0: 3E 7F       ld   a,$7F
19E2: 32 24 80    ld   ($8024),a
19E5: 21 08 80    ld   hl,$8008
19E8: 06 07       ld   b,$07
19EA: DD 21 68 30 ld   ix,$3068
19EE: DD 7E 00    ld   a,(ix+$00)
19F1: 77          ld   (hl),a
19F2: 2B          dec  hl
19F3: DD 23       inc  ix
19F5: 10 F7       djnz $19EE
19F7: 21 00 84    ld   hl,$8400
19FA: CB 4E       bit  1,(hl)
19FC: 20 0B       jr   nz,$1A09
19FE: 21 0D 84    ld   hl,$840D
1A01: 7E          ld   a,(hl)
1A02: 23          inc  hl
1A03: 23          inc  hl
1A04: 77          ld   (hl),a
1A05: 23          inc  hl
1A06: 77          ld   (hl),a
1A07: 18 08       jr   $1A11
1A09: 21 0E 84    ld   hl,$840E
1A0C: 7E          ld   a,(hl)
1A0D: 23          inc  hl
1A0E: 77          ld   (hl),a
1A0F: 23          inc  hl
1A10: 77          ld   (hl),a
1A11: 21 0F 84    ld   hl,$840F
1A14: 7E          ld   a,(hl)
1A15: 32 27 86    ld   ($8627),a
1A18: FE 0F       cp   $0F
1A1A: D8          ret  c
1A1B: 3E 0F       ld   a,$0F
1A1D: 77          ld   (hl),a
1A1E: 23          inc  hl
1A1F: 77          ld   (hl),a
1A20: C9          ret

1A21: 11 01 00    ld   de,$0001
1A24: 7E          ld   a,(hl)
1A25: A7          and  a
1A26: 28 0F       jr   z,$1A37
1A28: 1F          rra
1A29: 47          ld   b,a
1A2A: 30 04       jr   nc,$1A30
1A2C: 7A          ld   a,d
1A2D: 83          add  a,e
1A2E: 27          daa
1A2F: 57          ld   d,a
1A30: 7B          ld   a,e
1A31: 87          add  a,a
1A32: 27          daa
1A33: 5F          ld   e,a
1A34: 78          ld   a,b
1A35: 18 EE       jr   $1A25
1A37: 72          ld   (hl),d
1A38: C9          ret
1A39: 21 58 32    ld   hl,$3258
1A3C: CD DE 1B    call $1BDE
1A3F: 87          add  a,a
1A40: 87          add  a,a
1A41: 87          add  a,a
1A42: 5F          ld   e,a
1A43: 16 00       ld   d,$00
1A45: 19          add  hl,de
1A46: 11 10 00    ld   de,$0010
1A49: E5          push hl
1A4A: DD E1       pop  ix
1A4C: 21 29 85    ld   hl,$8529
1A4F: 06 08       ld   b,$08
1A51: E5          push hl
1A52: DD 7E 00    ld   a,(ix+$00)
1A55: 4F          ld   c,a
1A56: A7          and  a
1A57: 28 10       jr   z,$1A69
1A59: 79          ld   a,c
1A5A: 87          add  a,a
1A5B: 87          add  a,a
1A5C: 87          add  a,a
1A5D: 87          add  a,a
1A5E: 3C          inc  a
1A5F: 77          ld   (hl),a
1A60: 23          inc  hl
1A61: 79          ld   a,c
1A62: DD 23       inc  ix
1A64: E6 F0       and  $F0
1A66: 77          ld   (hl),a
1A67: 18 05       jr   $1A6E
1A69: DD 23       inc  ix
1A6B: 2B          dec  hl
1A6C: CB FE       set  7,(hl)
1A6E: E1          pop  hl
1A6F: 19          add  hl,de
1A70: 10 DF       djnz $1A51
1A72: C9          ret
1A73: 11 10 00    ld   de,$0010
1A76: 21 28 85    ld   hl,$8528
1A79: 06 08       ld   b,$08
1A7B: E5          push hl
1A7C: CB 7E       bit  7,(hl)
1A7E: 28 06       jr   z,$1A86
1A80: 23          inc  hl
1A81: 36 00       ld   (hl),$00
1A83: 23          inc  hl
1A84: 36 00       ld   (hl),$00
1A86: E1          pop  hl
1A87: E5          push hl
1A88: 2B          dec  hl
1A89: 2B          dec  hl
1A8A: 2B          dec  hl
1A8B: 7E          ld   a,(hl)
1A8C: E6 01       and  $01
1A8E: 77          ld   (hl),a
1A8F: E1          pop  hl
1A90: 19          add  hl,de
1A91: 10 E8       djnz $1A7B
1A93: C9          ret
1A94: 21 2B 85    ld   hl,$852B
1A97: 11 10 00    ld   de,$0010
1A9A: 06 08       ld   b,$08
1A9C: E5          push hl
1A9D: 78          ld   a,b
1A9E: FE 05       cp   $05
1AA0: 38 07       jr   c,$1AA9
1AA2: 36 20       ld   (hl),$20
1AA4: 23          inc  hl
1AA5: 36 01       ld   (hl),$01
1AA7: 18 15       jr   $1ABE
1AA9: 22 F6 85    ld   ($85F6),hl
1AAC: E1          pop  hl
1AAD: E5          push hl
1AAE: 2B          dec  hl
1AAF: 2B          dec  hl
1AB0: 2B          dec  hl
1AB1: 2B          dec  hl
1AB2: 2B          dec  hl
1AB3: 2B          dec  hl
1AB4: CB C6       set  0,(hl)
1AB6: 2A F6 85    ld   hl,($85F6)
1AB9: 36 24       ld   (hl),$24
1ABB: 23          inc  hl
1ABC: 36 02       ld   (hl),$02
1ABE: 23          inc  hl
1ABF: 36 00       ld   (hl),$00
1AC1: E1          pop  hl
1AC2: 19          add  hl,de
1AC3: 10 D7       djnz $1A9C
1AC5: C9          ret
1AC6: 21 F0 30    ld   hl,$30F0
1AC9: CD DE 1B    call $1BDE
1ACC: 87          add  a,a
1ACD: 87          add  a,a
1ACE: 87          add  a,a
1ACF: 5F          ld   e,a
1AD0: 16 00       ld   d,$00
1AD2: 19          add  hl,de
1AD3: E5          push hl
1AD4: DD E1       pop  ix
1AD6: 21 67 84    ld   hl,$8467
1AD9: 11 08 00    ld   de,$0008
1ADC: 06 08       ld   b,$08
1ADE: FD 21 65 84 ld   iy,$8465
1AE2: FD E5       push iy
1AE4: CB 46       bit  0,(hl)
1AE6: 28 10       jr   z,$1AF8
1AE8: 36 FF       ld   (hl),$FF
1AEA: FD 36 00 00 ld   (iy+$00),$00
1AEE: FD 23       inc  iy
1AF0: FD 36 00 60 ld   (iy+$00),$60
1AF4: DD 23       inc  ix
1AF6: 18 1A       jr   $1B12
1AF8: DD 7E 00    ld   a,(ix+$00)
1AFB: A7          and  a
1AFC: 28 EA       jr   z,$1AE8
1AFE: 87          add  a,a
1AFF: 87          add  a,a
1B00: 87          add  a,a
1B01: 87          add  a,a
1B02: 3C          inc  a
1B03: FD 77 00    ld   (iy+$00),a
1B06: FD 23       inc  iy
1B08: DD 7E 00    ld   a,(ix+$00)
1B0B: E6 F0       and  $F0
1B0D: FD 77 00    ld   (iy+$00),a
1B10: DD 23       inc  ix
1B12: FD E1       pop  iy
1B14: FD 19       add  iy,de
1B16: 19          add  hl,de
1B17: 10 C9       djnz $1AE2
1B19: 21 3C 98    ld   hl,$983C
1B1C: 11 3C 99    ld   de,$993C
1B1F: 06 08       ld   b,$08
1B21: 36 1E       ld   (hl),$1E
1B23: 23          inc  hl
1B24: 36 04       ld   (hl),$04
1B26: 23          inc  hl
1B27: AF          xor  a
1B28: 12          ld   (de),a
1B29: 13          inc  de
1B2A: 13          inc  de
1B2B: 10 F4       djnz $1B21
1B2D: C9          ret
1B2E: 3E 02       ld   a,$02
1B30: 32 22 98    ld   ($9822),a
1B33: AF          xor  a
1B34: 32 23 98    ld   ($9823),a
1B37: 32 80 98    ld   ($9880),a
1B3A: 32 81 98    ld   ($9881),a
1B3D: 3E 38       ld   a,$38
1B3F: 32 00 98    ld   ($9800),a
1B42: 3E 06       ld   a,$06
1B44: 32 01 98    ld   ($9801),a
1B47: 3A 57 86    ld   a,($8657)
1B4A: CB 4F       bit  1,a
1B4C: 20 1F       jr   nz,$1B6D
1B4E: 21 85 87    ld   hl,$8785
1B51: 3A 00 84    ld   a,($8400)
1B54: CB 4F       bit  1,a
1B56: 20 06       jr   nz,$1B5E
1B58: CB 46       bit  0,(hl)
1B5A: 20 11       jr   nz,$1B6D
1B5C: 18 04       jr   $1B62
1B5E: CB 4E       bit  1,(hl)
1B60: 20 0B       jr   nz,$1B6D
1B62: 3E 08       ld   a,$08
1B64: 32 A3 98    ld   ($98A3),a
1B67: 3E B1       ld   a,$B1
1B69: 32 A2 98    ld   ($98A2),a
1B6C: C9          ret
1B6D: 3E 71       ld   a,$71
1B6F: 32 A2 98    ld   ($98A2),a
1B72: 3E 80       ld   a,$80
1B74: 32 A3 98    ld   ($98A3),a
1B77: 21 01 84    ld   hl,$8401
1B7A: CB E6       set  4,(hl)
1B7C: C9          ret

decrement_lives_1b7d:
1B7D: 21 00 84    ld   hl,$8400
1B80: CB 4E       bit  1,(hl)
1B82: 20 05       jr   nz,$1B89
1B84: 21 0A 84    ld   hl,player_1_lives_840a
1B87: 18 03       jr   $1B8C
1B89: 21 0B 84    ld   hl,player_2_lives_840b
1B8C: 35          dec  (hl)
1B8D: 7E          ld   a,(hl)
1B8E: 32 0C 84    ld   ($840C),a
1B91: C9          ret
1B92: 21 65 84    ld   hl,$8465
1B95: 11 07 00    ld   de,$0007
1B98: 06 08       ld   b,$08
1B9A: DD 21 BC 98 ld   ix,$98BC
1B9E: 7E          ld   a,(hl)
1B9F: DD 77 00    ld   (ix+$00),a
1BA2: 23          inc  hl
1BA3: DD 23       inc  ix
1BA5: 7E          ld   a,(hl)
1BA6: DD 77 00    ld   (ix+$00),a
1BA9: DD 23       inc  ix
1BAB: 19          add  hl,de
1BAC: 10 F0       djnz $1B9E
1BAE: C9          ret
1BAF: 21 29 85    ld   hl,$8529
1BB2: 06 08       ld   b,$08
1BB4: 11 0D 00    ld   de,$000D
1BB7: DD 21 64 98 ld   ix,$9864
1BBB: FD 21 E4 98 ld   iy,$98E4
1BBF: 7E          ld   a,(hl)
1BC0: FD 77 00    ld   (iy+$00),a
1BC3: FD 23       inc  iy
1BC5: 23          inc  hl
1BC6: 7E          ld   a,(hl)
1BC7: FD 77 00    ld   (iy+$00),a
1BCA: 23          inc  hl
1BCB: FD 23       inc  iy
1BCD: 7E          ld   a,(hl)
1BCE: DD 77 00    ld   (ix+$00),a
1BD1: 23          inc  hl
1BD2: DD 23       inc  ix
1BD4: 7E          ld   a,(hl)
1BD5: DD 77 00    ld   (ix+$00),a
1BD8: DD 23       inc  ix
1BDA: 19          add  hl,de
1BDB: 10 E2       djnz $1BBF
1BDD: C9          ret
1BDE: 3A 27 86    ld   a,($8627)
1BE1: FE 10       cp   $10
1BE3: 38 04       jr   c,$1BE9
1BE5: E6 03       and  $03
1BE7: C6 0C       add  a,$0C
1BE9: 3D          dec  a
1BEA: C9          ret
1BEB: 06 00       ld   b,$00
1BED: 2A D6 85    ld   hl,($85D6)
1BF0: CD 8E 1C    call $1C8E
1BF3: 2A D8 85    ld   hl,($85D8)
1BF6: CD 8E 1C    call $1C8E
1BF9: 2A DA 85    ld   hl,($85DA)
1BFC: CD 8E 1C    call $1C8E
1BFF: 2A DC 85    ld   hl,($85DC)
1C02: CD 8E 1C    call $1C8E
1C05: 78          ld   a,b
1C06: 21 01 84    ld   hl,$8401
1C09: CB A6       res  4,(hl)
1C0B: A7          and  a
1C0C: C0          ret  nz
1C0D: CB E6       set  4,(hl)
1C0F: C9          ret
1C10: DD 21 FA 85 ld   ix,$85FA
1C14: 18 23       jr   $1C39
1C16: DD 21 02 86 ld   ix,$8602
1C1A: 18 1D       jr   $1C39
1C1C: DD 21 0A 86 ld   ix,$860A
1C20: 18 17       jr   $1C39
1C22: 3A AE 85    ld   a,($85AE)
1C25: E6 0F       and  $0F
1C27: 28 0C       jr   z,$1C35
1C29: FE 06       cp   $06
1C2B: 28 08       jr   z,$1C35
1C2D: 3E 06       ld   a,$06
1C2F: 82          add  a,d
1C30: 57          ld   d,a
1C31: 3E 06       ld   a,$06
1C33: 83          add  a,e
1C34: 5F          ld   e,a
1C35: DD 21 D6 85 ld   ix,$85D6
1C39: CD 5A 1C    call $1C5A
1C3C: DD 75 00    ld   (ix+$00),l
1C3F: DD 74 01    ld   (ix+$01),h
1C42: CD 87 1C    call $1C87
1C45: DD 73 02    ld   (ix+$02),e
1C48: DD 72 03    ld   (ix+$03),d
1C4B: 23          inc  hl
1C4C: DD 75 04    ld   (ix+$04),l
1C4F: DD 74 05    ld   (ix+$05),h
1C52: 13          inc  de
1C53: DD 73 06    ld   (ix+$06),e
1C56: DD 72 07    ld   (ix+$07),d
1C59: C9          ret
1C5A: 7A          ld   a,d
1C5B: D6 11       sub  $11
1C5D: CB 3F       srl  a
1C5F: CB 3F       srl  a
1C61: 57          ld   d,a
1C62: CB 3F       srl  a
1C64: 87          add  a,a
1C65: 87          add  a,a
1C66: 87          add  a,a
1C67: 87          add  a,a
1C68: 87          add  a,a
1C69: 6F          ld   l,a
1C6A: 7A          ld   a,d
1C6B: CB 3F       srl  a
1C6D: CB 3F       srl  a
1C6F: CB 3F       srl  a
1C71: CB 3F       srl  a
1C73: 67          ld   h,a
1C74: 16 00       ld   d,$00
1C76: CB 3B       srl  e
1C78: CB 3B       srl  e
1C7A: CB 3B       srl  e
1C7C: A7          and  a
1C7D: ED 52       sbc  hl,de
1C7F: EB          ex   de,hl
1C80: 21 A0 83    ld   hl,$83A0
1C83: A7          and  a
1C84: ED 52       sbc  hl,de
1C86: C9          ret
1C87: 11 E0 FF    ld   de,$FFE0
1C8A: EB          ex   de,hl
1C8B: 19          add  hl,de
1C8C: EB          ex   de,hl
1C8D: C9          ret
1C8E: 7E          ld   a,(hl)
1C8F: FE 7F       cp   $7F
1C91: C0          ret  nz
1C92: 04          inc  b
1C93: C9          ret
1C94: CD 19 13    call $1319
1C97: 3A 00 84    ld   a,($8400)
1C9A: CB 4F       bit  1,a
1C9C: 20 05       jr   nz,$1CA3
1C9E: CD 33 13    call $1333
1CA1: 18 03       jr   $1CA6
1CA3: CD 44 13    call $1344
1CA6: 21 C7 1C    ld   hl,$1CC7
1CA9: 11 DE 98    ld   de,$98DE
1CAC: 01 06 00    ld   bc,$0006
1CAF: C5          push bc
1CB0: ED B0       ldir
1CB2: C1          pop  bc
1CB3: 21 CD 1C    ld   hl,$1CCD
1CB6: 11 5E 98    ld   de,$985E
1CB9: ED B0       ldir
1CBB: 21 5E 99    ld   hl,$995E
1CBE: 06 03       ld   b,$03
1CC0: 36 00       ld   (hl),$00
1CC2: 23          inc  hl
1CC3: 23          inc  hl
1CC4: 10 FA       djnz $1CC0
1CC6: C9          ret
1CC7: 81          add  a,c
1CC8: 98          sbc  a,b
1CC9: 71          ld   (hl),c
1CCA: 98          sbc  a,b
1CCB: 61          ld   h,c
1CCC: 98          sbc  a,b
1CCD: 6E          ld   l,(hl)
1CCE: 0C          inc  c
1CCF: 6D          ld   l,l
1CD0: 0C          inc  c
1CD1: 6C          ld   l,h
1CD2: 0C          inc  c
1CD3: 21 F0 98    ld   hl,$98F0
1CD6: 06 10       ld   b,$10
1CD8: 36 00       ld   (hl),$00
1CDA: 23          inc  hl
1CDB: 10 FB       djnz $1CD8
1CDD: 21 70 98    ld   hl,$9870
1CE0: 06 10       ld   b,$10
1CE2: 36 00       ld   (hl),$00
1CE4: 23          inc  hl
1CE5: 10 FB       djnz $1CE2
1CE7: 21 5E 98    ld   hl,$985E
1CEA: 11 DE 98    ld   de,$98DE
1CED: 06 06       ld   b,$06
1CEF: 3E 00       ld   a,$00
1CF1: 77          ld   (hl),a
1CF2: 12          ld   (de),a
1CF3: 23          inc  hl
1CF4: 13          inc  de
1CF5: 10 F8       djnz $1CEF
1CF7: C9          ret
1CF8: E5          push hl
1CF9: D5          push de
1CFA: F5          push af
1CFB: 2A F4 85    ld   hl,($85F4)
1CFE: ED 5B F4 85 ld   de,($85F4)
1D02: 29          add  hl,hl
1D03: 29          add  hl,hl
1D04: 19          add  hl,de
1D05: 23          inc  hl
1D06: 22 F4 85    ld   ($85F4),hl
1D09: F1          pop  af
1D0A: D1          pop  de
1D0B: E1          pop  hl
1D0C: C9          ret
1D0D: DD E5       push ix
1D0F: FD E5       push iy
1D11: E5          push hl
1D12: D5          push de
1D13: C5          push bc
1D14: F5          push af
1D15: 21 56 86    ld   hl,$8656
1D18: CB 56       bit  2,(hl)
1D1A: 28 1C       jr   z,$1D38
1D1C: CB 96       res  2,(hl)
1D1E: 21 48 86    ld   hl,$8648
1D21: 3A A3 98    ld   a,($98A3)
1D24: FE 18       cp   $18
1D26: D2 2D 1D    jp   nc,$1D2D
1D29: 36 00       ld   (hl),$00
1D2B: 18 0B       jr   $1D38
1D2D: 34          inc  (hl)
1D2E: 7E          ld   a,(hl)
1D2F: FE 02       cp   $02
1D31: 20 05       jr   nz,$1D38
1D33: 36 00       ld   (hl),$00
1D35: CD B3 2F    call $2FB3
1D38: F1          pop  af
1D39: C1          pop  bc
1D3A: D1          pop  de
1D3B: E1          pop  hl
1D3C: FD E1       pop  iy
1D3E: DD E1       pop  ix
1D40: C9          ret
1D41: 3A A2 98    ld   a,($98A2)
1D44: 57          ld   d,a
1D45: 3A A3 98    ld   a,($98A3)
1D48: 5F          ld   e,a
1D49: 3A AF 85    ld   a,($85AF)
1D4C: C3 25 1C    jp   $1C25
1D4F: 27          daa
1D50: 28 2D       jr   z,$1D7F
1D52: 2D          dec  l
1D53: 2E 1B       ld   l,$1B
1D55: 0C          inc  c
1D56: 29          add  hl,hl
1D57: 26 2E       ld   h,$2E
1D59: 29          add  hl,hl
1D5A: 0C          inc  c
1D5B: 1D          dec  e
1D5C: 25          dec  h
1D5D: 28 21       jr   z,$1D80
1D5F: 0C          inc  c
1D60: 1D          dec  e
1D61: 27          daa
1D62: 1A          ld   a,(de)
1D63: 0C          inc  c
1D64: 21 2C 2E    ld   hl,$2E2C
1D67: 29          add  hl,hl
1D68: 5E          ld   e,(hl)
1D69: 66          ld   h,(hl)
1D6A: 62          ld   h,d
1D6B: 6D          ld   l,l
1D6C: 35          dec  (hl)
1D6D: 10 0C       djnz $1D7B
1D6F: 2C          inc  l
1D70: 2B          dec  hl
1D71: 1E 2D       ld   e,$2D
1D73: 27          daa
1D74: 1E 0C       ld   e,$0C
1D76: 2D          dec  l
1D77: 27          daa
1D78: 2E 28       ld   l,$28
1D7A: 1C          inc  e
1D7B: 0C          inc  c
1D7C: 1E 26       ld   e,$26
1D7E: 22 2D 27    ld   ($272D),hl
1D81: 28 2D       jr   z,$1DB0
1D83: 2D          dec  l
1D84: 2E 1B       ld   l,$1B
1D86: 0C          inc  c
1D87: 2D          dec  l
1D88: 2B          dec  hl
1D89: 1A          ld   a,(de)
1D8A: 2D          dec  l
1D8B: 2C          inc  l
1D8C: 0C          inc  c
1D8D: 21 2C 2E    ld   hl,$2E2C
1D90: 29          add  hl,hl
1D91: 0C          inc  c
1D92: 27          daa
1D93: 1E 21       ld   e,$21
1D95: 2D          dec  l
1D96: 1E 2B       ld   e,$2B
1D98: 28 1F       jr   z,$1DB9
1D9A: 1E 1B       ld   e,$1B
1D9C: 0C          inc  c
1D9D: 9E          sbc  a,(hl)
1D9E: A6          and  (hl)
1D9F: 9A          sbc  a,d
1DA0: A0          and  b
1DA1: 0C          inc  c
1DA2: 9E          sbc  a,(hl)
1DA3: AE          xor  (hl)
1DA4: A7          and  a
1DA5: A2          and  d
1DA6: AD          xor  l
1DA7: A7          and  a
1DA8: A8          xor  b
1DA9: 9C          sbc  a,h
1DAA: 0C          inc  c
1DAB: A8          xor  b
1DAC: AD          xor  l
1DAD: 0C          inc  c
1DAE: 0C          inc  c
1DAF: 0C          inc  c
1DB0: 0C          inc  c
1DB1: 0C          inc  c
1DB2: 0C          inc  c
1DB3: 0C          inc  c
1DB4: 0C          inc  c
1DB5: 0C          inc  c
1DB6: 0C          inc  c
1DB7: 0C          inc  c
1DB8: 0C          inc  c
1DB9: 0C          inc  c
1DBA: 0C          inc  c
1DBB: 0C          inc  c
1DBC: 0C          inc  c
1DBD: 0C          inc  c
1DBE: 0C          inc  c
1DBF: 0C          inc  c
1DC0: 0C          inc  c
1DC1: 0C          inc  c
1DC2: 1D          dec  e
1DC3: 27          daa
1DC4: 1A          ld   a,(de)
1DC5: 0C          inc  c
1DC6: 27          daa
1DC7: 22 28 1C    ld   ($1C28),hl
1DCA: 0C          inc  c
1DCB: 2D          dec  l
1DCC: 2B          dec  hl
1DCD: 1E 2C       ld   e,$2C
1DCF: 27          daa
1DD0: 22 6C 6B    ld   ($6B6C),hl
1DD3: 5E          ld   e,(hl)
1DD4: 72          ld   (hl),d
1DD5: 5A          ld   e,d
1DD6: 65          ld   h,l
1DD7: 69          ld   l,c
1DD8: 0C          inc  c
1DD9: 52          ld   d,d
1DDA: 0C          inc  c
1DDB: 6B          ld   l,e
1DDC: 68          ld   l,b
1DDD: 0C          inc  c
1DDE: 51          ld   d,c
1DDF: 72          ld   (hl),d
1DE0: 65          ld   h,l
1DE1: 67          ld   h,a
1DE2: 68          ld   l,b
1DE3: 0C          inc  c
1DE4: 6B          ld   l,e
1DE5: 5E          ld   e,(hl)
1DE6: 72          ld   (hl),d
1DE7: 5A          ld   e,d
1DE8: 65          ld   h,l
1DE9: 69          ld   l,c
1DEA: 0C          inc  c
1DEB: 51          ld   d,c
1DEC: CB 56       bit  2,(hl)
1DEE: C2 17 1E    jp   nz,$1E17
1DF1: CB D6       set  2,(hl)
1DF3: 26 17       ld   h,$17
1DF5: 2E 3A       ld   l,$3A
1DF7: 22 89 87    ld   ($8789),hl
1DFA: 3E 01       ld   a,$01
1DFC: 32 03 A0    ld   ($A003),a
1DFF: CD 8D 18    call $188D
1E02: CD A7 18    call $18A7
1E05: CD F2 0B    call $0BF2
1E08: CD 97 15    call $1597
1E0B: CD 6B 14    call $146B
1E0E: CD CA 0B    call $0BCA
1E11: CD DF 0B    call $0BDF
1E14: C3 71 0A    jp   $0A71
1E17: CD DB 15    call $15DB
1E1A: 2A 89 87    ld   hl,($8789)
1E1D: 2C          inc  l
1E1E: 7D          ld   a,l
1E1F: FE 3C       cp   $3C
1E21: 20 2D       jr   nz,$1E50
1E23: 2E 00       ld   l,$00
1E25: A7          and  a
1E26: 25          dec  h
1E27: 7C          ld   a,h
1E28: FE 0F       cp   $0F
1E2A: 20 02       jr   nz,$1E2E
1E2C: 26 09       ld   h,$09
1E2E: 7C          ld   a,h
1E2F: FE 40       cp   $40
1E31: 38 08       jr   c,$1E3B
1E33: 21 87 87    ld   hl,$8787
1E36: CB CE       set  1,(hl)
1E38: C3 71 0A    jp   $0A71
1E3B: E6 0F       and  $0F
1E3D: C6 50       add  a,$50
1E3F: 32 D7 81    ld   ($81D7),a
1E42: 7C          ld   a,h
1E43: CB 3F       srl  a
1E45: CB 3F       srl  a
1E47: CB 3F       srl  a
1E49: CB 3F       srl  a
1E4B: C6 50       add  a,$50
1E4D: 32 F7 81    ld   ($81F7),a
1E50: 22 89 87    ld   ($8789),hl
1E53: 3E 04       ld   a,$04
1E55: 21 57 82    ld   hl,$8257
1E58: DD 21 68 1D ld   ix,$1D68
1E5C: CD CB 15    call $15CB
1E5F: 3E 14       ld   a,$14
1E61: 21 D4 80    ld   hl,$80D4
1E64: DD 21 6C 1D ld   ix,$1D6C
1E68: CD CB 15    call $15CB
1E6B: 3E 06       ld   a,$06
1E6D: 21 92 82    ld   hl,$8292
1E70: DD 21 96 1D ld   ix,$1D96
1E74: CD CB 15    call $15CB
1E77: 3E 16       ld   a,$16
1E79: 21 CE 80    ld   hl,$80CE
1E7C: DD 21 80 1D ld   ix,$1D80
1E80: CD CB 15    call $15CB
1E83: 3E 19       ld   a,$19
1E85: 21 6C 80    ld   hl,$806C
1E88: DD 21 4F 1D ld   ix,$1D4F
1E8C: CD CB 15    call $15CB
1E8F: 2A 89 87    ld   hl,($8789)
1E92: 7D          ld   a,l
1E93: FE 1E       cp   $1E
1E95: 30 06       jr   nc,$1E9D
1E97: DD 21 AF 1D ld   ix,$1DAF
1E9B: 18 04       jr   $1EA1
1E9D: DD 21 9C 1D ld   ix,$1D9C
1EA1: 21 E6 80    ld   hl,$80E6
1EA4: 3E 13       ld   a,$13
1EA6: CD CB 15    call $15CB
1EA9: 3A A5 85    ld   a,($85A5)
1EAC: FE 00       cp   $00
1EAE: 20 06       jr   nz,$1EB6
1EB0: CD CC 1E    call $1ECC
1EB3: C3 71 0A    jp   $0A71
1EB6: FE 01       cp   $01
1EB8: 20 09       jr   nz,$1EC3
1EBA: CD CC 1E    call $1ECC
1EBD: CD D9 1E    call $1ED9
1EC0: C3 71 0A    jp   $0A71
1EC3: CD E6 1E    call $1EE6
1EC6: CD F3 1E    call $1EF3
1EC9: C3 71 0A    jp   $0A71
1ECC: 3E 0F       ld   a,$0F
1ECE: 21 2A 81    ld   hl,$812A
1ED1: DD 21 C2 1D ld   ix,$1DC2
1ED5: CD CB 15    call $15CB
1ED8: C9          ret
1ED9: 3E 0D       ld   a,$0D
1EDB: 21 30 81    ld   hl,$8130
1EDE: DD 21 DF 1D ld   ix,$1DDF
1EE2: CD CB 15    call $15CB
1EE5: C9          ret
1EE6: 3E 0E       ld   a,$0E
1EE8: 21 10 81    ld   hl,$8110
1EEB: DD 21 D1 1D ld   ix,$1DD1
1EEF: CD CB 15    call $15CB
1EF2: C9          ret
1EF3: 21 2A 81    ld   hl,$812A
1EF6: 3E 0F       ld   a,$0F
1EF8: DD 21 AF 1D ld   ix,$1DAF
1EFC: CD CB 15    call $15CB
1EFF: C9          ret
1F00: 2A 23 84    ld   hl,($8423)
1F03: 7D          ld   a,l
1F04: E6 03       and  $03
1F06: FE 03       cp   $03
1F08: 28 10       jr   z,$1F1A
1F0A: FE 02       cp   $02
1F0C: 28 1A       jr   z,$1F28
1F0E: FE 01       cp   $01
1F10: 28 24       jr   z,$1F36
1F12: 21 6D 84    ld   hl,$846D
1F15: CD 75 1F    call $1F75
1F18: 18 24       jr   $1F3E
1F1A: 21 75 84    ld   hl,$8475
1F1D: CD 75 1F    call $1F75
1F20: 21 7D 84    ld   hl,$847D
1F23: CD 75 1F    call $1F75
1F26: 18 1B       jr   $1F43
1F28: 21 85 84    ld   hl,$8485
1F2B: CD 75 1F    call $1F75
1F2E: 21 8D 84    ld   hl,$848D
1F31: CD 75 1F    call $1F75
1F34: 18 08       jr   $1F3E
1F36: 21 95 84    ld   hl,$8495
1F39: CD 75 1F    call $1F75
1F3C: 18 05       jr   $1F43
1F3E: 21 25 85    ld   hl,$8525
1F41: 18 03       jr   $1F46
1F43: 21 65 85    ld   hl,$8565
1F46: 11 10 00    ld   de,$0010
1F49: 06 04       ld   b,$04
1F4B: 78          ld   a,b
1F4C: 32 29 86    ld   ($8629),a
1F4F: C5          push bc
1F50: D5          push de
1F51: E5          push hl
1F52: A7          and  a
1F53: 11 25 85    ld   de,$8525
1F56: ED 52       sbc  hl,de
1F58: 7D          ld   a,l
1F59: CB 3F       srl  a
1F5B: CB 3F       srl  a
1F5D: CB 3F       srl  a
1F5F: CB 3F       srl  a
1F61: 4F          ld   c,a
1F62: 3E 08       ld   a,$08
1F64: A7          and  a
1F65: 91          sub  c
1F66: 32 9D 87    ld   ($879D),a
1F69: E1          pop  hl
1F6A: E5          push hl
1F6B: CD 39 23    call $2339
1F6E: E1          pop  hl
1F6F: D1          pop  de
1F70: C1          pop  bc
1F71: 19          add  hl,de
1F72: 10 D7       djnz $1F4B
1F74: C9          ret
1F75: E5          push hl
1F76: 23          inc  hl
1F77: 23          inc  hl
1F78: CB 66       bit  4,(hl)
1F7A: 20 07       jr   nz,$1F83
1F7C: CB 7E       bit  7,(hl)
1F7E: C2 BC 21    jp   nz,$21BC
1F81: 18 02       jr   $1F85
1F83: E1          pop  hl
1F84: C9          ret
1F85: E1          pop  hl
1F86: E5          push hl
1F87: 56          ld   d,(hl)
1F88: 7A          ld   a,d
1F89: A7          and  a
1F8A: 28 54       jr   z,$1FE0
1F8C: 23          inc  hl
1F8D: 5E          ld   e,(hl)
1F8E: 7B          ld   a,e
1F8F: FE F0       cp   $F0
1F91: 30 4D       jr   nc,$1FE0
1F93: CD CB 22    call $22CB
1F96: 2A EA 85    ld   hl,($85EA)
1F99: 7E          ld   a,(hl)
1F9A: FE 09       cp   $09
1F9C: 28 1E       jr   z,$1FBC
1F9E: FE 08       cp   $08
1FA0: 28 1A       jr   z,$1FBC
1FA2: FE 0C       cp   $0C
1FA4: 28 16       jr   z,$1FBC
1FA6: FE 03       cp   $03
1FA8: 28 12       jr   z,$1FBC
1FAA: FE 01       cp   $01
1FAC: 28 0E       jr   z,$1FBC
1FAE: FE 05       cp   $05
1FB0: 28 0A       jr   z,$1FBC
1FB2: FE 06       cp   $06
1FB4: 28 06       jr   z,$1FBC
1FB6: FE 07       cp   $07
1FB8: 28 02       jr   z,$1FBC
1FBA: 20 24       jr   nz,$1FE0
1FBC: 2A EC 85    ld   hl,($85EC)
1FBF: 7E          ld   a,(hl)
1FC0: FE 09       cp   $09
1FC2: 28 24       jr   z,$1FE8
1FC4: FE 08       cp   $08
1FC6: 28 20       jr   z,$1FE8
1FC8: FE 0C       cp   $0C
1FCA: 28 1C       jr   z,$1FE8
1FCC: FE 02       cp   $02
1FCE: 28 18       jr   z,$1FE8
1FD0: FE 00       cp   $00
1FD2: 28 14       jr   z,$1FE8
1FD4: FE 04       cp   $04
1FD6: 28 10       jr   z,$1FE8
1FD8: FE 0A       cp   $0A
1FDA: 28 0C       jr   z,$1FE8
1FDC: FE 0B       cp   $0B
1FDE: 28 08       jr   z,$1FE8
1FE0: E1          pop  hl
1FE1: E5          push hl
1FE2: 23          inc  hl
1FE3: 23          inc  hl
1FE4: CB 8E       res  1,(hl)
1FE6: 18 0D       jr   $1FF5
1FE8: 21 F0 87    ld   hl,$87F0
1FEB: CB CE       set  1,(hl)
1FED: E1          pop  hl
1FEE: E5          push hl
1FEF: 23          inc  hl
1FF0: 23          inc  hl
1FF1: CB C6       set  0,(hl)
1FF3: CB CE       set  1,(hl)
1FF5: CB 46       bit  0,(hl)
1FF7: 20 02       jr   nz,$1FFB
1FF9: E1          pop  hl
1FFA: C9          ret
1FFB: CB 4E       bit  1,(hl)
1FFD: CA BC 21    jp   z,$21BC
2000: CB 56       bit  2,(hl)
2002: 20 0A       jr   nz,$200E
2004: 23          inc  hl
2005: 23          inc  hl
2006: 36 0C       ld   (hl),$0C
2008: 2B          dec  hl
2009: 2B          dec  hl
200A: CB D6       set  2,(hl)
200C: E1          pop  hl
200D: C9          ret
200E: 23          inc  hl
200F: 23          inc  hl
2010: 7E          ld   a,(hl)
2011: FE 0C       cp   $0C
2013: 28 2B       jr   z,$2040
2015: FE 09       cp   $09
2017: 28 32       jr   z,$204B
2019: FE 06       cp   $06
201B: 28 23       jr   z,$2040
201D: FE 03       cp   $03
201F: 28 2A       jr   z,$204B
2021: FE 0A       cp   $0A
2023: 38 02       jr   c,$2027
2025: 18 2D       jr   $2054
2027: F5          push af
2028: E5          push hl
2029: 21 33 85    ld   hl,$8533
202C: 06 08       ld   b,$08
202E: 11 10 00    ld   de,$0010
2031: 7E          ld   a,(hl)
2032: E6 07       and  $07
2034: 20 03       jr   nz,$2039
2036: C6 04       add  a,$04
2038: 77          ld   (hl),a
2039: 19          add  hl,de
203A: 10 F5       djnz $2031
203C: E1          pop  hl
203D: F1          pop  af
203E: 18 14       jr   $2054
2040: E5          push hl
2041: F5          push af
2042: CD 0C 29    call $290C
2045: 36 1F       ld   (hl),$1F
2047: F1          pop  af
2048: E1          pop  hl
2049: 18 09       jr   $2054
204B: E5          push hl
204C: F5          push af
204D: CD 0C 29    call $290C
2050: 36 1E       ld   (hl),$1E
2052: F1          pop  af
2053: E1          pop  hl
2054: A7          and  a
2055: 28 0C       jr   z,$2063
2057: FE 01       cp   $01
2059: 20 05       jr   nz,$2060
205B: 3E 01       ld   a,$01
205D: 32 8D 9A    ld   ($9A8D),a
2060: 35          dec  (hl)
2061: E1          pop  hl
2062: C9          ret
2063: DD E1       pop  ix
2065: DD E5       push ix
2067: 3A 46 86    ld   a,($8646)
206A: CB 47       bit  0,a
206C: C2 A9 20    jp   nz,$20A9
206F: 21 A2 98    ld   hl,$98A2
2072: DD 7E 00    ld   a,(ix+$00)
2075: BE          cp   (hl)
2076: 30 05       jr   nc,$207D
2078: 4F          ld   c,a
2079: 7E          ld   a,(hl)
207A: 91          sub  c
207B: 18 01       jr   $207E
207D: 96          sub  (hl)
207E: FE 07       cp   $07
2080: D2 B6 20    jp   nc,$20B6
2083: 23          inc  hl
2084: DD 4E 01    ld   c,(ix+$01)
2087: 7E          ld   a,(hl)
2088: 91          sub  c
2089: FE 12       cp   $12
208B: 30 29       jr   nc,$20B6
208D: AF          xor  a
208E: 32 22 99    ld   ($9922),a
2091: 21 46 86    ld   hl,$8646
2094: CB C6       set  0,(hl)
2096: 3E 01       ld   a,$01
2098: 32 8A 9A    ld   ($9A8A),a
209B: DD 36 03 FF ld   (ix+$03),$FF
209F: 3A A3 98    ld   a,($98A3)
20A2: D6 02       sub  $02
20A4: 32 A3 98    ld   ($98A3),a
20A7: 18 0D       jr   $20B6
20A9: 21 A3 98    ld   hl,$98A3
20AC: 7E          ld   a,(hl)
20AD: C6 08       add  a,$08
20AF: 77          ld   (hl),a
20B0: FE EE       cp   $EE
20B2: 38 02       jr   c,$20B6
20B4: 36 EE       ld   (hl),$EE
20B6: 21 25 85    ld   hl,$8525
20B9: 22 F6 85    ld   ($85F6),hl
20BC: 11 04 00    ld   de,$0004
20BF: 19          add  hl,de
20C0: 22 1A 86    ld   ($861A),hl
20C3: 11 10 00    ld   de,$0010
20C6: 06 08       ld   b,$08
20C8: 2A F6 85    ld   hl,($85F6)
20CB: CB 7E       bit  7,(hl)
20CD: C2 9B 21    jp   nz,$219B
20D0: CB 6E       bit  5,(hl)
20D2: C2 A3 21    jp   nz,$21A3
20D5: D5          push de
20D6: 11 06 00    ld   de,$0006
20D9: 19          add  hl,de
20DA: D1          pop  de
20DB: 7E          ld   a,(hl)
20DC: FE 3F       cp   $3F
20DE: 38 49       jr   c,$2129
20E0: 2A 1A 86    ld   hl,($861A)
20E3: 3A 00 84    ld   a,($8400)
20E6: CB 4F       bit  1,a
20E8: 28 04       jr   z,$20EE
20EA: CB 57       bit  2,a
20EC: 20 03       jr   nz,$20F1
20EE: 7E          ld   a,(hl)
20EF: 18 03       jr   $20F4
20F1: 7E          ld   a,(hl)
20F2: D6 10       sub  $10
20F4: 4F          ld   c,a
20F5: DD 7E 00    ld   a,(ix+$00)
20F8: B9          cp   c
20F9: 30 0C       jr   nc,$2107
20FB: 79          ld   a,c
20FC: DD 4E 00    ld   c,(ix+$00)
20FF: 91          sub  c
2100: FE 09       cp   $09
2102: D2 A3 21    jp   nc,$21A3
2105: 18 06       jr   $210D
2107: 91          sub  c
2108: FE 19       cp   $19
210A: D2 A3 21    jp   nc,$21A3
210D: 23          inc  hl
210E: DD 4E 01    ld   c,(ix+$01)
2111: 3A 00 84    ld   a,($8400)
2114: CB 4F       bit  1,a
2116: 28 04       jr   z,$211C
2118: CB 57       bit  2,a
211A: 20 03       jr   nz,$211F
211C: 7E          ld   a,(hl)
211D: 18 03       jr   $2122
211F: 7E          ld   a,(hl)
2120: D6 10       sub  $10
2122: 91          sub  c
2123: FE 0C       cp   $0C
2125: 30 7C       jr   nc,$21A3
2127: 18 1F       jr   $2148
2129: 2A 1A 86    ld   hl,($861A)
212C: DD 7E 00    ld   a,(ix+$00)
212F: BE          cp   (hl)
2130: 30 05       jr   nc,$2137
2132: 4F          ld   c,a
2133: 7E          ld   a,(hl)
2134: 91          sub  c
2135: 18 01       jr   $2138
2137: 96          sub  (hl)
2138: FE 0C       cp   $0C
213A: 30 67       jr   nc,$21A3
213C: 23          inc  hl
213D: DD 4E 01    ld   c,(ix+$01)
2140: 7E          ld   a,(hl)
2141: 91          sub  c
2142: FE 0C       cp   $0C
2144: 30 5D       jr   nc,$21A3
2146: 18 28       jr   $2170
2148: DD 7E 01    ld   a,(ix+$01)
214B: C6 08       add  a,$08
214D: 2A 1A 86    ld   hl,($861A)
2150: 23          inc  hl
2151: 77          ld   (hl),a
2152: 2B          dec  hl
2153: 3A 00 84    ld   a,($8400)
2156: CB 4F       bit  1,a
2158: 28 0A       jr   z,$2164
215A: CB 57       bit  2,a
215C: 28 06       jr   z,$2164
215E: 7E          ld   a,(hl)
215F: D6 08       sub  $08
2161: 77          ld   (hl),a
2162: 18 04       jr   $2168
2164: 7E          ld   a,(hl)
2165: C6 08       add  a,$08
2167: 77          ld   (hl),a
2168: D5          push de
2169: 2A F6 85    ld   hl,($85F6)
216C: CD F8 26    call $26F8
216F: D1          pop  de
2170: 2A F6 85    ld   hl,($85F6)
2173: 3E C3       ld   a,$C3
2175: A6          and  (hl)
2176: 77          ld   (hl),a
2177: CB FE       set  7,(hl)
2179: D5          push de
217A: 11 0D 00    ld   de,$000D
217D: 19          add  hl,de
217E: D1          pop  de
217F: CB 9E       res  3,(hl)
2181: CB 96       res  2,(hl)
2183: 3E 01       ld   a,$01
2185: 32 8A 9A    ld   ($9A8A),a
2188: 21 C5 87    ld   hl,$87C5
218B: CB C6       set  0,(hl)
218D: DD 36 03 FF ld   (ix+$03),$FF
2191: 2A 1A 86    ld   hl,($861A)
2194: 23          inc  hl
2195: 7E          ld   a,(hl)
2196: D6 02       sub  $02
2198: 77          ld   (hl),a
2199: 18 08       jr   $21A3
219B: 2A 1A 86    ld   hl,($861A)
219E: 23          inc  hl
219F: 7E          ld   a,(hl)
21A0: C6 08       add  a,$08
21A2: 77          ld   (hl),a
21A3: 2A F6 85    ld   hl,($85F6)
21A6: 19          add  hl,de
21A7: 22 F6 85    ld   ($85F6),hl
21AA: 2A 1A 86    ld   hl,($861A)
21AD: 19          add  hl,de
21AE: 22 1A 86    ld   ($861A),hl
21B1: 05          dec  b
21B2: C2 C8 20    jp   nz,$20C8
21B5: E1          pop  hl
21B6: 23          inc  hl
21B7: 3E 08       ld   a,$08
21B9: 86          add  a,(hl)
21BA: 77          ld   (hl),a
21BB: C9          ret
21BC: CB 5E       bit  3,(hl)
21BE: C2 6B 22    jp   nz,$226B
21C1: CB DE       set  3,(hl)
21C3: CB FE       set  7,(hl)
21C5: 23          inc  hl
21C6: 23          inc  hl
21C7: 36 14       ld   (hl),$14
21C9: E1          pop  hl
21CA: 11 03 00    ld   de,$0003
21CD: 19          add  hl,de
21CE: CB 46       bit  0,(hl)
21D0: 28 0D       jr   z,$21DF
21D2: 2B          dec  hl
21D3: 2B          dec  hl
21D4: 3A 46 86    ld   a,($8646)
21D7: CB 47       bit  0,a
21D9: 20 04       jr   nz,$21DF
21DB: 7E          ld   a,(hl)
21DC: D6 08       sub  $08
21DE: 77          ld   (hl),a
21DF: 3E 01       ld   a,$01
21E1: 32 8C 9A    ld   ($9A8C),a
21E4: C9          ret
21E5: 21 C5 87    ld   hl,$87C5
21E8: 36 00       ld   (hl),$00
21EA: 21 25 85    ld   hl,$8525
21ED: 11 10 00    ld   de,$0010
21F0: 0E 00       ld   c,$00
21F2: 06 08       ld   b,$08
21F4: 22 F6 85    ld   ($85F6),hl
21F7: CB 7E       bit  7,(hl)
21F9: 28 0E       jr   z,$2209
21FB: 0C          inc  c
21FC: 36 00       ld   (hl),$00
21FE: 23          inc  hl
21FF: 23          inc  hl
2200: 23          inc  hl
2201: CB FE       set  7,(hl)
2203: 23          inc  hl
2204: 36 00       ld   (hl),$00
2206: 23          inc  hl
2207: 36 00       ld   (hl),$00
2209: 2A F6 85    ld   hl,($85F6)
220C: 19          add  hl,de
220D: 22 F6 85    ld   ($85F6),hl
2210: 10 E2       djnz $21F4
2212: 21 47 86    ld   hl,$8647
2215: 36 3C       ld   (hl),$3C
2217: 21 1C 86    ld   hl,$861C
221A: 36 C8       ld   (hl),$C8
221C: 21 46 86    ld   hl,$8646
221F: CB 46       bit  0,(hl)
2221: 28 02       jr   z,$2225
2223: CB CE       set  1,(hl)
2225: 79          ld   a,c
2226: A7          and  a
2227: CA 69 22    jp   z,$2269
222A: 06 3E       ld   b,$3E
222C: 80          add  a,b
222D: 32 74 98    ld   ($9874),a
2230: 3E 47       ld   a,$47
2232: 32 78 98    ld   ($9878),a
2235: 3E 0A       ld   a,$0A
2237: 32 75 98    ld   ($9875),a
223A: 32 79 98    ld   ($9879),a
223D: AF          xor  a
223E: 32 74 99    ld   ($9974),a
2241: 32 78 99    ld   ($9978),a
2244: E1          pop  hl
2245: E5          push hl
2246: 7E          ld   a,(hl)
2247: D6 08       sub  $08
2249: 32 F4 98    ld   ($98F4),a
224C: C6 10       add  a,$10
224E: 32 F8 98    ld   ($98F8),a
2251: 36 00       ld   (hl),$00
2253: 23          inc  hl
2254: 7E          ld   a,(hl)
2255: 32 F5 98    ld   ($98F5),a
2258: 32 F9 98    ld   ($98F9),a
225B: 36 00       ld   (hl),$00
225D: E1          pop  hl
225E: 79          ld   a,c
225F: 87          add  a,a
2260: C8          ret  z
2261: 81          add  a,c
2262: C6 15       add  a,$15
2264: 6F          ld   l,a
2265: CD B5 2F    call add_to_score_2fb5
2268: C9          ret
2269: E1          pop  hl
226A: C9          ret
226B: 23          inc  hl
226C: 23          inc  hl
226D: 7E          ld   a,(hl)
226E: A7          and  a
226F: 28 35       jr   z,$22A6
2271: 35          dec  (hl)
2272: FE 04       cp   $04
2274: CA E5 21    jp   z,$21E5
2277: E5          push hl
2278: 21 C5 87    ld   hl,$87C5
227B: CB 46       bit  0,(hl)
227D: 28 03       jr   z,$2282
227F: E1          pop  hl
2280: E1          pop  hl
2281: C9          ret
2282: E1          pop  hl
2283: FE 12       cp   $12
2285: 28 0A       jr   z,$2291
2287: FE 09       cp   $09
2289: 28 0D       jr   z,$2298
228B: FE 05       cp   $05
228D: 28 10       jr   z,$229F
228F: E1          pop  hl
2290: C9          ret
2291: CD 0C 29    call $290C
2294: 36 74       ld   (hl),$74
2296: E1          pop  hl
2297: C9          ret
2298: CD 0C 29    call $290C
229B: 36 75       ld   (hl),$75
229D: E1          pop  hl
229E: C9          ret
229F: CD 0C 29    call $290C
22A2: 36 32       ld   (hl),$32
22A4: E1          pop  hl
22A5: C9          ret
22A6: E1          pop  hl
22A7: AF          xor  a
22A8: 77          ld   (hl),a
22A9: 23          inc  hl
22AA: 36 90       ld   (hl),$90
22AC: 23          inc  hl
22AD: 36 11       ld   (hl),$11
22AF: CD 62 19    call $1962
22B2: 23          inc  hl
22B3: 77          ld   (hl),a
22B4: 32 F4 98    ld   ($98F4),a
22B7: 32 F5 98    ld   ($98F5),a
22BA: 32 F8 98    ld   ($98F8),a
22BD: 32 F9 98    ld   ($98F9),a
22C0: 21 99 87    ld   hl,$8799
22C3: CB C6       set  0,(hl)
22C5: 21 F0 87    ld   hl,$87F0
22C8: CB 8E       res  1,(hl)
22CA: C9          ret
22CB: C5          push bc
22CC: E5          push hl
22CD: D5          push de
22CE: CD 10 1C    call $1C10
22D1: 2A FE 85    ld   hl,($85FE)
22D4: 23          inc  hl
22D5: 22 EA 85    ld   ($85EA),hl
22D8: 2A 00 86    ld   hl,($8600)
22DB: 23          inc  hl
22DC: 22 EC 85    ld   ($85EC),hl
22DF: 2A EA 85    ld   hl,($85EA)
22E2: 7E          ld   a,(hl)
22E3: FE 7F       cp   $7F
22E5: 28 14       jr   z,$22FB
22E7: 2A EC 85    ld   hl,($85EC)
22EA: 7E          ld   a,(hl)
22EB: FE 7F       cp   $7F
22ED: 28 0C       jr   z,$22FB
22EF: 2A FE 85    ld   hl,($85FE)
22F2: CD FF 22    call $22FF
22F5: 2A 00 86    ld   hl,($8600)
22F8: CD FF 22    call $22FF
22FB: D1          pop  de
22FC: E1          pop  hl
22FD: C1          pop  bc
22FE: C9          ret
22FF: E5          push hl
2300: 2B          dec  hl
2301: 7E          ld   a,(hl)
2302: FE 7F       cp   $7F
2304: 20 02       jr   nz,$2308
2306: E1          pop  hl
2307: C9          ret
2308: 23          inc  hl
2309: 7E          ld   a,(hl)
230A: FE 00       cp   $00
230C: 28 1F       jr   z,$232D
230E: 3D          dec  a
230F: 28 20       jr   z,$2331
2311: 3D          dec  a
2312: 3D          dec  a
2313: 3D          dec  a
2314: 28 17       jr   z,$232D
2316: 3D          dec  a
2317: 28 18       jr   z,$2331
2319: 3D          dec  a
231A: 28 15       jr   z,$2331
231C: 3D          dec  a
231D: 28 12       jr   z,$2331
231F: 3D          dec  a
2320: 28 13       jr   z,$2335
2322: 3D          dec  a
2323: 28 10       jr   z,$2335
2325: 3D          dec  a
2326: 28 05       jr   z,$232D
2328: 3D          dec  a
2329: 28 02       jr   z,$232D
232B: E1          pop  hl
232C: C9          ret
232D: 36 02       ld   (hl),$02
232F: E1          pop  hl
2330: C9          ret
2331: 36 03       ld   (hl),$03
2333: E1          pop  hl
2334: C9          ret
2335: 36 0C       ld   (hl),$0C
2337: E1          pop  hl
2338: C9          ret
2339: E5          push hl
233A: CD 8E 26    call $268E
233D: E1          pop  hl
233E: 3A 01 84    ld   a,($8401)
2341: CB 7F       bit  7,a
2343: C0          ret  nz
2344: CD 48 23    call $2348
2347: C9          ret
2348: E5          push hl
2349: 7E          ld   a,(hl)
234A: E6 BC       and  $BC
234C: C2 31 25    jp   nz,$2531
234F: CB 4E       bit  1,(hl)
2351: CA 1F 29    jp   z,$291F
2354: 22 F6 85    ld   ($85F6),hl
2357: 11 0B 00    ld   de,$000B
235A: 19          add  hl,de
235B: 7E          ld   a,(hl)
235C: A7          and  a
235D: 28 0E       jr   z,$236D
235F: FE 01       cp   $01
2361: 20 09       jr   nz,$236C
2363: ED 5B F6 85 ld   de,($85F6)
2367: EB          ex   de,hl
2368: 23          inc  hl
2369: CB 86       res  0,(hl)
236B: EB          ex   de,hl
236C: 35          dec  (hl)
236D: 2A F6 85    ld   hl,($85F6)
2370: 23          inc  hl
2371: 23          inc  hl
2372: 23          inc  hl
2373: CB 7E       bit  7,(hl)
2375: 28 02       jr   z,$2379
2377: E1          pop  hl
2378: C9          ret
2379: 3A BD 87    ld   a,($87BD)
237C: 47          ld   b,a
237D: 2A F6 85    ld   hl,($85F6)
2380: 11 09 00    ld   de,$0009
2383: 19          add  hl,de
2384: 7E          ld   a,(hl)
2385: 90          sub  b
2386: 77          ld   (hl),a
2387: 38 02       jr   c,$238B
2389: E1          pop  hl
238A: C9          ret
238B: 2A F6 85    ld   hl,($85F6)
238E: 11 04 00    ld   de,$0004
2391: 19          add  hl,de
2392: 7E          ld   a,(hl)
2393: FE 01       cp   $01
2395: 20 05       jr   nz,$239C
2397: 2B          dec  hl
2398: CB FE       set  7,(hl)
239A: E1          pop  hl
239B: C9          ret
239C: CD F8 1C    call $1CF8
239F: 2A F6 85    ld   hl,($85F6)
23A2: 23          inc  hl
23A3: CB 8E       res  1,(hl)
23A5: 2B          dec  hl
23A6: 11 04 00    ld   de,$0004
23A9: 19          add  hl,de
23AA: 46          ld   b,(hl)
23AB: 23          inc  hl
23AC: 4E          ld   c,(hl)
23AD: 2A F6 85    ld   hl,($85F6)
23B0: 23          inc  hl
23B1: 23          inc  hl
23B2: 23          inc  hl
23B3: CB 76       bit  6,(hl)
23B5: C2 02 24    jp   nz,$2402
23B8: 3A F0 87    ld   a,($87F0)
23BB: CB 47       bit  0,a
23BD: C2 02 24    jp   nz,$2402
23C0: 3A A2 98    ld   a,($98A2)
23C3: B8          cp   b
23C4: DA CA 23    jp   c,$23CA
23C7: 90          sub  b
23C8: 18 06       jr   $23D0
23CA: 3A A2 98    ld   a,($98A2)
23CD: 57          ld   d,a
23CE: 78          ld   a,b
23CF: 92          sub  d
23D0: FE 20       cp   $20
23D2: D2 02 24    jp   nc,$2402
23D5: 3A A3 98    ld   a,($98A3)
23D8: B9          cp   c
23D9: DA DF 23    jp   c,$23DF
23DC: 91          sub  c
23DD: 18 06       jr   $23E5
23DF: 3A A3 98    ld   a,($98A3)
23E2: 57          ld   d,a
23E3: 79          ld   a,c
23E4: 92          sub  d
23E5: FE 20       cp   $20
23E7: D2 02 24    jp   nc,$2402
23EA: 2A F6 85    ld   hl,($85F6)
23ED: 11 0F 00    ld   de,$000F
23F0: 19          add  hl,de
23F1: 3A A3 98    ld   a,($98A3)
23F4: 77          ld   (hl),a
23F5: 2B          dec  hl
23F6: 3A A2 98    ld   a,($98A2)
23F9: 77          ld   (hl),a
23FA: 2A F6 85    ld   hl,($85F6)
23FD: 23          inc  hl
23FE: 23          inc  hl
23FF: 23          inc  hl
2400: CB F6       set  6,(hl)
2402: 3A F4 85    ld   a,($85F4)
2405: CB 4F       bit  1,a
2407: 28 4A       jr   z,$2453
2409: 2A F6 85    ld   hl,($85F6)
240C: 23          inc  hl
240D: 23          inc  hl
240E: 23          inc  hl
240F: CB 76       bit  6,(hl)
2411: 28 0E       jr   z,$2421
2413: 3A F0 87    ld   a,($87F0)
2416: CB 47       bit  0,a
2418: 20 07       jr   nz,$2421
241A: 11 0C 00    ld   de,$000C
241D: 19          add  hl,de
241E: 7E          ld   a,(hl)
241F: 18 0E       jr   $242F
2421: 3A F0 87    ld   a,($87F0)
2424: CB 47       bit  0,a
2426: 28 04       jr   z,$242C
2428: 3E 08       ld   a,$08
242A: 18 03       jr   $242F
242C: 3A A3 98    ld   a,($98A3)
242F: B9          cp   c
2430: DA 4A 24    jp   c,$244A
2433: CA 90 24    jp   z,$2490
2436: CD 3F 24    call $243F
2439: 19          add  hl,de
243A: 34          inc  (hl)
243B: 34          inc  (hl)
243C: C3 90 24    jp   $2490
243F: 2A F6 85    ld   hl,($85F6)
2442: 23          inc  hl
2443: CB CE       set  1,(hl)
2445: 2B          dec  hl
2446: 11 05 00    ld   de,$0005
2449: C9          ret
244A: CD 3F 24    call $243F
244D: 19          add  hl,de
244E: 35          dec  (hl)
244F: 35          dec  (hl)
2450: C3 90 24    jp   $2490
2453: 2A F6 85    ld   hl,($85F6)
2456: 23          inc  hl
2457: 23          inc  hl
2458: 23          inc  hl
2459: CB 76       bit  6,(hl)
245B: 28 0E       jr   z,$246B
245D: 3A F0 87    ld   a,($87F0)
2460: CB 47       bit  0,a
2462: 20 07       jr   nz,$246B
2464: 11 0B 00    ld   de,$000B
2467: 19          add  hl,de
2468: 7E          ld   a,(hl)
2469: 18 0E       jr   $2479
246B: 3A F0 87    ld   a,($87F0)
246E: CB 47       bit  0,a
2470: 28 04       jr   z,$2476
2472: 3E 21       ld   a,$21
2474: 18 03       jr   $2479
2476: 3A A2 98    ld   a,($98A2)
2479: B8          cp   b
247A: DA 88 24    jp   c,$2488
247D: CA 90 24    jp   z,$2490
2480: 2A F6 85    ld   hl,($85F6)
2483: 11 04 00    ld   de,$0004
2486: 18 B1       jr   $2439
2488: 2A F6 85    ld   hl,($85F6)
248B: 11 04 00    ld   de,$0004
248E: 18 BD       jr   $244D
2490: 21 4A 86    ld   hl,$864A
2493: CB F6       set  6,(hl)
2495: 2A F6 85    ld   hl,($85F6)
2498: 23          inc  hl
2499: CB 46       bit  0,(hl)
249B: C2 04 25    jp   nz,$2504
249E: 06 00       ld   b,$00
24A0: 2A F6 85    ld   hl,($85F6)
24A3: 23          inc  hl
24A4: CB 4E       bit  1,(hl)
24A6: CC A1 28    call z,$28A1
24A9: C4 B7 28    call nz,$28B7
24AC: CB 40       bit  0,b
24AE: CA 04 25    jp   z,$2504
24B1: CD DB 28    call $28DB
24B4: CB 40       bit  0,b
24B6: CA 04 25    jp   z,$2504
24B9: 2A F6 85    ld   hl,($85F6)
24BC: CB 8E       res  1,(hl)
24BE: 23          inc  hl
24BF: CB 4E       bit  1,(hl)
24C1: 20 28       jr   nz,$24EB
24C3: 23          inc  hl
24C4: 23          inc  hl
24C5: 23          inc  hl
24C6: 23          inc  hl
24C7: 7E          ld   a,(hl)
24C8: FE 20       cp   $20
24CA: D2 D7 24    jp   nc,$24D7
24CD: FE 16       cp   $16
24CF: D2 DE 24    jp   nc,$24DE
24D2: 36 08       ld   (hl),$08
24D4: C3 1F 25    jp   $251F
24D7: E6 0F       and  $0F
24D9: FE 08       cp   $08
24DB: DA E7 24    jp   c,$24E7
24DE: 0E 10       ld   c,$10
24E0: 7E          ld   a,(hl)
24E1: E6 F0       and  $F0
24E3: 81          add  a,c
24E4: 77          ld   (hl),a
24E5: E1          pop  hl
24E6: C9          ret
24E7: 0E 00       ld   c,$00
24E9: 18 F5       jr   $24E0
24EB: 23          inc  hl
24EC: 23          inc  hl
24ED: 23          inc  hl
24EE: 7E          ld   a,(hl)
24EF: E6 0F       and  $0F
24F1: FE 08       cp   $08
24F3: DA FF 24    jp   c,$24FF
24F6: 7E          ld   a,(hl)
24F7: E6 F0       and  $F0
24F9: C6 11       add  a,$11
24FB: 77          ld   (hl),a
24FC: C3 1F 25    jp   $251F
24FF: 7E          ld   a,(hl)
2500: E6 F0       and  $F0
2502: 3C          inc  a
2503: 77          ld   (hl),a
2504: 21 4A 86    ld   hl,$864A
2507: CB 76       bit  6,(hl)
2509: 28 14       jr   z,$251F
250B: CB B6       res  6,(hl)
250D: 2A F6 85    ld   hl,($85F6)
2510: 23          inc  hl
2511: CB 4E       bit  1,(hl)
2513: 28 05       jr   z,$251A
2515: CB 8E       res  1,(hl)
2517: C3 95 24    jp   $2495
251A: CB CE       set  1,(hl)
251C: C3 95 24    jp   $2495
251F: E1          pop  hl
2520: C9          ret
2521: 7E          ld   a,(hl)
2522: E6 7F       and  $7F
2524: FE 10       cp   $10
2526: DA 2F 25    jp   c,$252F
2529: FE 7E       cp   $7E
252B: CA 2F 25    jp   z,$252F
252E: C9          ret
252F: 0D          dec  c
2530: C9          ret
2531: 22 F6 85    ld   ($85F6),hl
2534: 2A F6 85    ld   hl,($85F6)
2537: 23          inc  hl
2538: 23          inc  hl
2539: CB 66       bit  4,(hl)
253B: C2 C7 25    jp   nz,$25C7
253E: 2A F6 85    ld   hl,($85F6)
2541: CB 46       bit  0,(hl)
2543: C2 37 26    jp   nz,$2637
2546: 2A F6 85    ld   hl,($85F6)
2549: 7E          ld   a,(hl)
254A: E6 3C       and  $3C
254C: CA C7 25    jp   z,$25C7
254F: 11 0C 00    ld   de,$000C
2552: 19          add  hl,de
2553: 35          dec  (hl)
2554: 7E          ld   a,(hl)
2555: FE 0D       cp   $0D
2557: C2 C9 25    jp   nz,$25C9
255A: 2A F6 85    ld   hl,($85F6)
255D: CB 6E       bit  5,(hl)
255F: CA C7 25    jp   z,$25C7
2562: 11 04 00    ld   de,$0004
2565: 19          add  hl,de
2566: 3A 00 84    ld   a,($8400)
2569: E6 06       and  $06
256B: FE 06       cp   $06
256D: C2 85 25    jp   nz,$2585
2570: 7E          ld   a,(hl)
2571: 32 FE 98    ld   ($98FE),a
2574: D6 10       sub  $10
2576: 32 F6 98    ld   ($98F6),a
2579: 23          inc  hl
257A: 7E          ld   a,(hl)
257B: D6 09       sub  $09
257D: 32 FF 98    ld   ($98FF),a
2580: 32 F7 98    ld   ($98F7),a
2583: 18 13       jr   $2598
2585: 7E          ld   a,(hl)
2586: 32 F6 98    ld   ($98F6),a
2589: C6 10       add  a,$10
258B: 32 FE 98    ld   ($98FE),a
258E: 23          inc  hl
258F: 7E          ld   a,(hl)
2590: C6 07       add  a,$07
2592: 32 F7 98    ld   ($98F7),a
2595: 32 FF 98    ld   ($98FF),a
2598: 2A F6 85    ld   hl,($85F6)
259B: CB EE       set  5,(hl)
259D: 23          inc  hl
259E: 23          inc  hl
259F: CB C6       set  0,(hl)
25A1: 23          inc  hl
25A2: CB FE       set  7,(hl)
25A4: 2B          dec  hl
25A5: 2B          dec  hl
25A6: 2B          dec  hl
25A7: 11 04 00    ld   de,$0004
25AA: 19          add  hl,de
25AB: 36 F1       ld   (hl),$F1
25AD: 23          inc  hl
25AE: 36 00       ld   (hl),$00
25B0: 23          inc  hl
25B1: 36 32       ld   (hl),$32
25B3: 11 07 00    ld   de,$0007
25B6: 19          add  hl,de
25B7: CB 96       res  2,(hl)
25B9: CB 9E       res  3,(hl)
25BB: AF          xor  a
25BC: 32 A0 98    ld   ($98A0),a
25BF: 32 A1 98    ld   ($98A1),a
25C2: 21 03 84    ld   hl,$8403
25C5: CB 96       res  2,(hl)
25C7: E1          pop  hl
25C8: C9          ret
25C9: A7          and  a
25CA: C2 C7 25    jp   nz,$25C7
25CD: 21 DF 32    ld   hl,$32DF
25D0: 3A 10 84    ld   a,($8410)
25D3: 3D          dec  a
25D4: 5F          ld   e,a
25D5: 16 00       ld   d,$00
25D7: 19          add  hl,de
25D8: 7E          ld   a,(hl)
25D9: 2A F6 85    ld   hl,($85F6)
25DC: 11 0C 00    ld   de,$000C
25DF: 19          add  hl,de
25E0: 77          ld   (hl),a
25E1: 2A F6 85    ld   hl,($85F6)
25E4: CB 56       bit  2,(hl)
25E6: 28 1B       jr   z,$2603
25E8: CB 96       res  2,(hl)
25EA: CB B6       res  6,(hl)
25EC: 21 9E 87    ld   hl,$879E
25EF: 3A 9D 87    ld   a,($879D)
25F2: BE          cp   (hl)
25F3: 20 0C       jr   nz,$2601
25F5: CD 89 0F    call $0F89
25F8: 21 03 84    ld   hl,$8403
25FB: CB 96       res  2,(hl)
25FD: 2B          dec  hl
25FE: 2B          dec  hl
25FF: CB 9E       res  3,(hl)
2601: E1          pop  hl
2602: C9          ret
2603: CB 5E       bit  3,(hl)
2605: 28 06       jr   z,$260D
2607: CB 9E       res  3,(hl)
2609: CB D6       set  2,(hl)
260B: 18 08       jr   $2615
260D: CB 66       bit  4,(hl)
260F: 28 0A       jr   z,$261B
2611: CB A6       res  4,(hl)
2613: CB DE       set  3,(hl)
2615: 23          inc  hl
2616: 23          inc  hl
2617: CB EE       set  5,(hl)
2619: E1          pop  hl
261A: C9          ret
261B: CB 6E       bit  5,(hl)
261D: 20 02       jr   nz,$2621
261F: E1          pop  hl
2620: C9          ret
2621: CB AE       res  5,(hl)
2623: 21 04 84    ld   hl,$8404
2626: CB B6       res  6,(hl)
2628: AF          xor  a
2629: 32 F6 98    ld   ($98F6),a
262C: 32 F7 98    ld   ($98F7),a
262F: 32 FE 98    ld   ($98FE),a
2632: 32 FF 98    ld   ($98FF),a
2635: E1          pop  hl
2636: C9          ret
2637: 3A 29 86    ld   a,($8629)
263A: E5          push hl
263B: C5          push bc
263C: 3D          dec  a
263D: 28 10       jr   z,$264F
263F: 3D          dec  a
2640: 28 12       jr   z,$2654
2642: 3D          dec  a
2643: 20 05       jr   nz,$264A
2645: 21 A4 98    ld   hl,$98A4
2648: 18 0D       jr   $2657
264A: 21 B6 98    ld   hl,$98B6
264D: 18 08       jr   $2657
264F: 21 AA 98    ld   hl,$98AA
2652: 18 03       jr   $2657
2654: 21 B0 98    ld   hl,$98B0
2657: 06 03       ld   b,$03
2659: 36 00       ld   (hl),$00
265B: 23          inc  hl
265C: 36 50       ld   (hl),$50
265E: 23          inc  hl
265F: 10 F8       djnz $2659
2661: C1          pop  bc
2662: E1          pop  hl
2663: C3 46 25    jp   $2546
2666: 11 06 00    ld   de,$0006
2669: 19          add  hl,de
266A: 22 F6 85    ld   ($85F6),hl
266D: 11 04 00    ld   de,$0004
2670: 19          add  hl,de
2671: 34          inc  (hl)
2672: 7E          ld   a,(hl)
2673: E6 0F       and  $0F
2675: FE 08       cp   $08
2677: DA 84 26    jp   c,$2684
267A: 2A F6 85    ld   hl,($85F6)
267D: 36 2A       ld   (hl),$2A
267F: 23          inc  hl
2680: 36 03       ld   (hl),$03
2682: E1          pop  hl
2683: C9          ret
2684: 2A F6 85    ld   hl,($85F6)
2687: 36 2B       ld   (hl),$2B
2689: 23          inc  hl
268A: 36 03       ld   (hl),$03
268C: E1          pop  hl
268D: C9          ret
268E: E5          push hl
268F: 7E          ld   a,(hl)
2690: E6 FC       and  $FC
2692: C2 C7 26    jp   nz,$26C7
2695: CB 4E       bit  1,(hl)
2697: CA 2D 28    jp   z,$282D
269A: CB 46       bit  0,(hl)
269C: C2 66 26    jp   nz,$2666
269F: 11 06 00    ld   de,$0006
26A2: 19          add  hl,de
26A3: 22 F6 85    ld   ($85F6),hl
26A6: 11 04 00    ld   de,$0004
26A9: 19          add  hl,de
26AA: 34          inc  (hl)
26AB: 7E          ld   a,(hl)
26AC: E6 0F       and  $0F
26AE: FE 08       cp   $08
26B0: DA BD 26    jp   c,$26BD
26B3: 2A F6 85    ld   hl,($85F6)
26B6: 36 28       ld   (hl),$28
26B8: 23          inc  hl
26B9: 36 03       ld   (hl),$03
26BB: E1          pop  hl
26BC: C9          ret
26BD: 2A F6 85    ld   hl,($85F6)
26C0: 36 29       ld   (hl),$29
26C2: 23          inc  hl
26C3: 36 03       ld   (hl),$03
26C5: E1          pop  hl
26C6: C9          ret
26C7: CB 7F       bit  7,a
26C9: 28 3C       jr   z,$2707
26CB: 3A 9E 87    ld   a,($879E)
26CE: 57          ld   d,a
26CF: 3A 9D 87    ld   a,($879D)
26D2: BA          cp   d
26D3: 20 13       jr   nz,$26E8
26D5: E5          push hl
26D6: CD 89 0F    call $0F89
26D9: 21 01 84    ld   hl,$8401
26DC: CB 9E       res  3,(hl)
26DE: 23          inc  hl
26DF: 23          inc  hl
26E0: CB 96       res  2,(hl)
26E2: 21 3E 86    ld   hl,$863E
26E5: 36 00       ld   (hl),$00
26E7: E1          pop  hl
26E8: CB 46       bit  0,(hl)
26EA: C2 FC 26    jp   nz,$26FC
26ED: 11 06 00    ld   de,$0006
26F0: 19          add  hl,de
26F1: 36 22       ld   (hl),$22
26F3: 23          inc  hl
26F4: 36 01       ld   (hl),$01
26F6: E1          pop  hl
26F7: C9          ret
26F8: E5          push hl
26F9: C3 E8 26    jp   $26E8
26FC: 11 06 00    ld   de,$0006
26FF: 19          add  hl,de
2700: 36 26       ld   (hl),$26
2702: 23          inc  hl
2703: 36 02       ld   (hl),$02
2705: E1          pop  hl
2706: C9          ret
2707: 22 F6 85    ld   ($85F6),hl
270A: 11 07 00    ld   de,$0007
270D: 19          add  hl,de
270E: E5          push hl
270F: DD E1       pop  ix
2711: 2B          dec  hl
2712: E5          push hl
2713: FD E1       pop  iy
2715: 2A F6 85    ld   hl,($85F6)
2718: 23          inc  hl
2719: 23          inc  hl
271A: CB 46       bit  0,(hl)
271C: CA 21 27    jp   z,$2721
271F: E1          pop  hl
2720: C9          ret
2721: 2A F6 85    ld   hl,($85F6)
2724: CB 46       bit  0,(hl)
2726: C2 E4 27    jp   nz,$27E4
2729: DD 36 00 01 ld   (ix+$00),$01
272D: CB 56       bit  2,(hl)
272F: 28 21       jr   z,$2752
2731: FD 36 00 23 ld   (iy+$00),$23
2735: 23          inc  hl
2736: 23          inc  hl
2737: CB 6E       bit  5,(hl)
2739: C2 3E 27    jp   nz,$273E
273C: E1          pop  hl
273D: C9          ret
273E: CB AE       res  5,(hl)
2740: 3A 00 84    ld   a,($8400)
2743: E6 06       and  $06
2745: FE 06       cp   $06
2747: CA 8B 27    jp   z,$278B
274A: CD A9 27    call $27A9
274D: C6 04       add  a,$04
274F: 77          ld   (hl),a
2750: E1          pop  hl
2751: C9          ret
2752: CB 5E       bit  3,(hl)
2754: 28 70       jr   z,$27C6
2756: FD 36 00 80 ld   (iy+$00),$80
275A: 23          inc  hl
275B: 23          inc  hl
275C: CB 6E       bit  5,(hl)
275E: C2 68 27    jp   nz,$2768
2761: CB 66       bit  4,(hl)
2763: C2 77 27    jp   nz,$2777
2766: E1          pop  hl
2767: C9          ret
2768: CB AE       res  5,(hl)
276A: 2A F6 85    ld   hl,($85F6)
276D: 11 05 00    ld   de,$0005
2770: 19          add  hl,de
2771: 7E          ld   a,(hl)
2772: C6 04       add  a,$04
2774: 77          ld   (hl),a
2775: E1          pop  hl
2776: C9          ret
2777: CB A6       res  4,(hl)
2779: 3A 00 84    ld   a,($8400)
277C: E6 06       and  $06
277E: FE 06       cp   $06
2780: CA 93 27    jp   z,$2793
2783: CD 9B 27    call $279B
2786: D6 04       sub  $04
2788: 77          ld   (hl),a
2789: E1          pop  hl
278A: C9          ret
278B: CD 9B 27    call $279B
278E: D6 0C       sub  $0C
2790: 77          ld   (hl),a
2791: E1          pop  hl
2792: C9          ret
2793: CD A9 27    call $27A9
2796: C6 0C       add  a,$0C
2798: 77          ld   (hl),a
2799: E1          pop  hl
279A: C9          ret
279B: 2A F6 85    ld   hl,($85F6)
279E: 11 04 00    ld   de,$0004
27A1: 19          add  hl,de
27A2: 7E          ld   a,(hl)
27A3: D6 08       sub  $08
27A5: 77          ld   (hl),a
27A6: 23          inc  hl
27A7: 7E          ld   a,(hl)
27A8: C9          ret
27A9: 2A F6 85    ld   hl,($85F6)
27AC: 11 04 00    ld   de,$0004
27AF: 19          add  hl,de
27B0: 7E          ld   a,(hl)
27B1: C6 08       add  a,$08
27B3: 77          ld   (hl),a
27B4: 23          inc  hl
27B5: 7E          ld   a,(hl)
27B6: C9          ret
27B7: CB A6       res  4,(hl)
27B9: 2A F6 85    ld   hl,($85F6)
27BC: 11 05 00    ld   de,$0005
27BF: 19          add  hl,de
27C0: 7E          ld   a,(hl)
27C1: D6 04       sub  $04
27C3: 77          ld   (hl),a
27C4: E1          pop  hl
27C5: C9          ret
27C6: CB 66       bit  4,(hl)
27C8: 28 0D       jr   z,$27D7
27CA: FD 36 00 81 ld   (iy+$00),$81
27CE: 23          inc  hl
27CF: 23          inc  hl
27D0: CB 66       bit  4,(hl)
27D2: C2 B7 27    jp   nz,$27B7
27D5: E1          pop  hl
27D6: C9          ret
27D7: CB 6E       bit  5,(hl)
27D9: 28 07       jr   z,$27E2
27DB: FD 36 00 82 ld   (iy+$00),$82
27DF: CD 89 0F    call $0F89
27E2: E1          pop  hl
27E3: C9          ret
27E4: DD 36 00 02 ld   (ix+$00),$02
27E8: CB 56       bit  2,(hl)
27EA: 28 0D       jr   z,$27F9
27EC: FD 36 00 27 ld   (iy+$00),$27
27F0: 23          inc  hl
27F1: 23          inc  hl
27F2: CB 6E       bit  5,(hl)
27F4: C2 3E 27    jp   nz,$273E
27F7: E1          pop  hl
27F8: C9          ret
27F9: CB 5E       bit  3,(hl)
27FB: 28 12       jr   z,$280F
27FD: FD 36 00 83 ld   (iy+$00),$83
2801: 23          inc  hl
2802: 23          inc  hl
2803: CB 6E       bit  5,(hl)
2805: C2 68 27    jp   nz,$2768
2808: CB 66       bit  4,(hl)
280A: C2 77 27    jp   nz,$2777
280D: E1          pop  hl
280E: C9          ret
280F: CB 66       bit  4,(hl)
2811: 28 0D       jr   z,$2820
2813: FD 36 00 84 ld   (iy+$00),$84
2817: 23          inc  hl
2818: 23          inc  hl
2819: CB 66       bit  4,(hl)
281B: C2 B7 27    jp   nz,$27B7
281E: E1          pop  hl
281F: C9          ret
2820: CB 6E       bit  5,(hl)
2822: 28 07       jr   z,$282B
2824: FD 36 00 85 ld   (iy+$00),$85
2828: CD 89 0F    call $0F89
282B: E1          pop  hl
282C: C9          ret
282D: 3A 01 84    ld   a,($8401)
2830: CB 7F       bit  7,a
2832: 28 02       jr   z,$2836
2834: E1          pop  hl
2835: C9          ret
2836: 11 0E 00    ld   de,$000E
2839: 19          add  hl,de
283A: 7E          ld   a,(hl)
283B: E6 07       and  $07
283D: FE 02       cp   $02
283F: 28 09       jr   z,$284A
2841: FE 06       cp   $06
2843: 20 08       jr   nz,$284D
2845: 2B          dec  hl
2846: 36 02       ld   (hl),$02
2848: 18 03       jr   $284D
284A: 2B          dec  hl
284B: 36 00       ld   (hl),$00
284D: E1          pop  hl
284E: E5          push hl
284F: CB 46       bit  0,(hl)
2851: 20 1C       jr   nz,$286F
2853: 11 06 00    ld   de,$0006
2856: CD 94 28    call $2894
2859: FE 04       cp   $04
285B: DA 68 28    jp   c,$2868
285E: 2A F6 85    ld   hl,($85F6)
2861: 36 21       ld   (hl),$21
2863: 23          inc  hl
2864: 36 01       ld   (hl),$01
2866: E1          pop  hl
2867: C9          ret
2868: 2A F6 85    ld   hl,($85F6)
286B: 36 20       ld   (hl),$20
286D: 18 F4       jr   $2863
286F: 23          inc  hl
2870: CB 76       bit  6,(hl)
2872: 28 02       jr   z,$2876
2874: E1          pop  hl
2875: C9          ret
2876: 11 05 00    ld   de,$0005
2879: CD 94 28    call $2894
287C: E6 07       and  $07
287E: FE 04       cp   $04
2880: DA 8D 28    jp   c,$288D
2883: 2A F6 85    ld   hl,($85F6)
2886: 36 25       ld   (hl),$25
2888: 23          inc  hl
2889: 36 02       ld   (hl),$02
288B: E1          pop  hl
288C: C9          ret
288D: 2A F6 85    ld   hl,($85F6)
2890: 36 24       ld   (hl),$24
2892: 18 F4       jr   $2888
2894: 19          add  hl,de
2895: 22 F6 85    ld   ($85F6),hl
2898: 11 04 00    ld   de,$0004
289B: 19          add  hl,de
289C: 34          inc  (hl)
289D: 7E          ld   a,(hl)
289E: E6 0F       and  $0F
28A0: C9          ret
28A1: E5          push hl
28A2: F5          push af
28A3: 23          inc  hl
28A4: 23          inc  hl
28A5: 23          inc  hl
28A6: 7E          ld   a,(hl)
28A7: E6 0F       and  $0F
28A9: FE 01       cp   $01
28AB: 28 05       jr   z,$28B2
28AD: CB 80       res  0,b
28AF: F1          pop  af
28B0: E1          pop  hl
28B1: C9          ret
28B2: CB C0       set  0,b
28B4: F1          pop  af
28B5: E1          pop  hl
28B6: C9          ret
28B7: E5          push hl
28B8: F5          push af
28B9: 23          inc  hl
28BA: 23          inc  hl
28BB: 23          inc  hl
28BC: 23          inc  hl
28BD: 7E          ld   a,(hl)
28BE: 4F          ld   c,a
28BF: E6 0F       and  $0F
28C1: 57          ld   d,a
28C2: 79          ld   a,c
28C3: FE 20       cp   $20
28C5: D2 D2 28    jp   nc,$28D2
28C8: FE 08       cp   $08
28CA: CA D6 28    jp   z,$28D6
28CD: CB 80       res  0,b
28CF: F1          pop  af
28D0: E1          pop  hl
28D1: C9          ret
28D2: 7A          ld   a,d
28D3: A7          and  a
28D4: 20 F7       jr   nz,$28CD
28D6: CB C0       set  0,b
28D8: F1          pop  af
28D9: E1          pop  hl
28DA: C9          ret
28DB: 2A F6 85    ld   hl,($85F6)
28DE: 11 04 00    ld   de,$0004
28E1: 19          add  hl,de
28E2: 56          ld   d,(hl)
28E3: 23          inc  hl
28E4: 5E          ld   e,(hl)
28E5: CD 10 1C    call $1C10
28E8: 0E 04       ld   c,$04
28EA: 2A FA 85    ld   hl,($85FA)
28ED: CD 21 25    call $2521
28F0: 2A FC 85    ld   hl,($85FC)
28F3: CD 21 25    call $2521
28F6: 2A FE 85    ld   hl,($85FE)
28F9: CD 21 25    call $2521
28FC: 2A 00 86    ld   hl,($8600)
28FF: CD 21 25    call $2521
2902: 79          ld   a,c
2903: A7          and  a
2904: 28 03       jr   z,$2909
2906: CB 80       res  0,b
2908: C9          ret
2909: CB C0       set  0,b
290B: C9          ret
290C: 11 69 84    ld   de,$8469
290F: A7          and  a
2910: ED 52       sbc  hl,de
2912: 7D          ld   a,l
2913: CB 3F       srl  a
2915: CB 3F       srl  a
2917: 5F          ld   e,a
2918: 16 00       ld   d,$00
291A: 21 3C 98    ld   hl,$983C
291D: 19          add  hl,de
291E: C9          ret
291F: 22 F6 85    ld   ($85F6),hl
2922: 11 04 00    ld   de,$0004
2925: 19          add  hl,de
2926: 7E          ld   a,(hl)
2927: FE 01       cp   $01
2929: C2 31 29    jp   nz,$2931
292C: 2B          dec  hl
292D: CB FE       set  7,(hl)
292F: E1          pop  hl
2930: C9          ret
2931: 11 0B 00    ld   de,$000B
2934: 19          add  hl,de
2935: 22 1A 86    ld   ($861A),hl
2938: 2A F6 85    ld   hl,($85F6)
293B: 23          inc  hl
293C: 23          inc  hl
293D: CB A6       res  4,(hl)
293F: CB AE       res  5,(hl)
2941: 23          inc  hl
2942: CB B6       res  6,(hl)
2944: CB 7E       bit  7,(hl)
2946: 28 02       jr   z,$294A
2948: E1          pop  hl
2949: C9          ret
294A: 2A F6 85    ld   hl,($85F6)
294D: 11 05 00    ld   de,$0005
2950: 19          add  hl,de
2951: 7E          ld   a,(hl)
2952: FE 08       cp   $08
2954: C2 6A 29    jp   nz,$296A
2957: 3A BD 87    ld   a,($87BD)
295A: 2A F6 85    ld   hl,($85F6)
295D: CB 46       bit  0,(hl)
295F: 28 06       jr   z,$2967
2961: C6 0A       add  a,$0A
2963: 30 02       jr   nc,$2967
2965: 3E FF       ld   a,$FF
2967: 47          ld   b,a
2968: 18 41       jr   $29AB
296A: 3A 46 86    ld   a,($8646)
296D: CB 5F       bit  3,a
296F: 28 11       jr   z,$2982
2971: 2A F6 85    ld   hl,($85F6)
2974: CB 46       bit  0,(hl)
2976: 28 05       jr   z,$297D
2978: 21 A5 87    ld   hl,$87A5
297B: 18 2C       jr   $29A9
297D: 21 A2 87    ld   hl,$87A2
2980: 18 27       jr   $29A9
2982: 3A 53 86    ld   a,($8653)
2985: CB 4F       bit  1,a
2987: 28 11       jr   z,$299A
2989: 2A F6 85    ld   hl,($85F6)
298C: CB 46       bit  0,(hl)
298E: 28 05       jr   z,$2995
2990: 21 A4 87    ld   hl,$87A4
2993: 18 14       jr   $29A9
2995: 21 A1 87    ld   hl,$87A1
2998: 18 0F       jr   $29A9
299A: 2A F6 85    ld   hl,($85F6)
299D: CB 46       bit  0,(hl)
299F: 28 05       jr   z,$29A6
29A1: 21 A3 87    ld   hl,$87A3
29A4: 18 03       jr   $29A9
29A6: 21 A0 87    ld   hl,$87A0
29A9: 00          nop
29AA: 46          ld   b,(hl)
29AB: 2A F6 85    ld   hl,($85F6)
29AE: 11 0E 00    ld   de,$000E
29B1: 19          add  hl,de
29B2: 7E          ld   a,(hl)
29B3: E6 07       and  $07
29B5: FE 04       cp   $04
29B7: 20 19       jr   nz,$29D2
29B9: 3A 57 86    ld   a,($8657)
29BC: CB 4F       bit  1,a
29BE: 20 07       jr   nz,$29C7
29C0: 3A 0F 84    ld   a,($840F)
29C3: FE 04       cp   $04
29C5: 38 0B       jr   c,$29D2
29C7: 3A EE 32    ld   a,($32EE)
29CA: 80          add  a,b
29CB: 47          ld   b,a
29CC: FE 28       cp   $28
29CE: 30 02       jr   nc,$29D2
29D0: 06 FF       ld   b,$FF
29D2: 2A F6 85    ld   hl,($85F6)
29D5: 11 09 00    ld   de,$0009
29D8: 19          add  hl,de
29D9: 7E          ld   a,(hl)
29DA: 90          sub  b
29DB: 77          ld   (hl),a
29DC: 38 02       jr   c,$29E0
29DE: E1          pop  hl
29DF: C9          ret
29E0: 2A F6 85    ld   hl,($85F6)
29E3: 23          inc  hl
29E4: CD A1 28    call $28A1
29E7: CB 40       bit  0,b
29E9: 20 0B       jr   nz,$29F6
29EB: CD B7 28    call $28B7
29EE: CB 40       bit  0,b
29F0: CA 71 2C    jp   z,$2C71
29F3: C3 E2 2C    jp   $2CE2
29F6: CD B7 28    call $28B7
29F9: CB 40       bit  0,b
29FB: CA E2 2C    jp   z,$2CE2
29FE: 23          inc  hl
29FF: 23          inc  hl
2A00: 23          inc  hl
2A01: 56          ld   d,(hl)
2A02: 23          inc  hl
2A03: 5E          ld   e,(hl)
2A04: CD 16 1C    call $1C16
2A07: 2A F6 85    ld   hl,($85F6)
2A0A: CB 46       bit  0,(hl)
2A0C: CA 28 2C    jp   z,$2C28
2A0F: 11 06 00    ld   de,$0006
2A12: 19          add  hl,de
2A13: 7E          ld   a,(hl)
2A14: FE 2A       cp   $2A
2A16: CA 28 2C    jp   z,$2C28
2A19: FE 2B       cp   $2B
2A1B: CA 28 2C    jp   z,$2C28
2A1E: FE 27       cp   $27
2A20: C2 25 2A    jp   nz,$2A25
2A23: 36 24       ld   (hl),$24
2A25: 2A 1A 86    ld   hl,($861A)
2A28: 2B          dec  hl
2A29: CB 4E       bit  1,(hl)
2A2B: CA 28 2C    jp   z,$2C28
2A2E: 2A F6 85    ld   hl,($85F6)
2A31: 11 04 00    ld   de,$0004
2A34: 19          add  hl,de
2A35: 7E          ld   a,(hl)
2A36: FE D1       cp   $D1
2A38: D2 28 2C    jp   nc,$2C28
2A3B: FE 22       cp   $22
2A3D: DA 28 2C    jp   c,$2C28
2A40: CD D4 2E    call $2ED4
2A43: 78          ld   a,b
2A44: FE 03       cp   $03
2A46: CA 28 2C    jp   z,$2C28
2A49: 2A F6 85    ld   hl,($85F6)
2A4C: 23          inc  hl
2A4D: CB 76       bit  6,(hl)
2A4F: C2 A4 2A    jp   nz,$2AA4
2A52: 21 D0 32    ld   hl,$32D0
2A55: 3A 0F 84    ld   a,($840F)
2A58: 3D          dec  a
2A59: E6 0F       and  $0F
2A5B: 5F          ld   e,a
2A5C: 16 00       ld   d,$00
2A5E: 19          add  hl,de
2A5F: 46          ld   b,(hl)
2A60: 2A F6 85    ld   hl,($85F6)
2A63: 11 04 00    ld   de,$0004
2A66: 19          add  hl,de
2A67: 3A A2 98    ld   a,($98A2)
2A6A: BE          cp   (hl)
2A6B: 38 03       jr   c,$2A70
2A6D: 96          sub  (hl)
2A6E: 18 03       jr   $2A73
2A70: 4F          ld   c,a
2A71: 7E          ld   a,(hl)
2A72: 91          sub  c
2A73: FE 3C       cp   $3C
2A75: 30 15       jr   nc,$2A8C
2A77: 3A A3 98    ld   a,($98A3)
2A7A: 23          inc  hl
2A7B: BE          cp   (hl)
2A7C: 38 03       jr   c,$2A81
2A7E: 96          sub  (hl)
2A7F: 18 03       jr   $2A84
2A81: 4F          ld   c,a
2A82: 7E          ld   a,(hl)
2A83: 91          sub  c
2A84: FE 3C       cp   $3C
2A86: 30 04       jr   nc,$2A8C
2A88: 78          ld   a,b
2A89: 87          add  a,a
2A8A: 87          add  a,a
2A8B: 47          ld   b,a
2A8C: CD F8 1C    call $1CF8
2A8F: 3A F4 85    ld   a,($85F4)
2A92: 90          sub  b
2A93: D2 28 2C    jp   nc,$2C28
2A96: 2A F6 85    ld   hl,($85F6)
2A99: 23          inc  hl
2A9A: CB F6       set  6,(hl)
2A9C: 11 0A 00    ld   de,$000A
2A9F: 19          add  hl,de
2AA0: 36 0E       ld   (hl),$0E
2AA2: E1          pop  hl
2AA3: C9          ret
2AA4: DD 21 A4 98 ld   ix,$98A4
2AA8: FD 21 A5 98 ld   iy,$98A5
2AAC: 21 24 98    ld   hl,$9824
2AAF: 01 24 99    ld   bc,$9924
2AB2: 3A 29 86    ld   a,($8629)
2AB5: FE 01       cp   $01
2AB7: 28 12       jr   z,$2ACB
2AB9: FE 02       cp   $02
2ABB: 28 09       jr   z,$2AC6
2ABD: FE 03       cp   $03
2ABF: 28 19       jr   z,$2ADA
2AC1: 11 12 00    ld   de,$0012
2AC4: 18 08       jr   $2ACE
2AC6: 11 0C 00    ld   de,$000C
2AC9: 18 03       jr   $2ACE
2ACB: 11 06 00    ld   de,$0006
2ACE: 19          add  hl,de
2ACF: E5          push hl
2AD0: C5          push bc
2AD1: E1          pop  hl
2AD2: 19          add  hl,de
2AD3: E5          push hl
2AD4: C1          pop  bc
2AD5: E1          pop  hl
2AD6: DD 19       add  ix,de
2AD8: FD 19       add  iy,de
2ADA: EB          ex   de,hl
2ADB: 2A 1A 86    ld   hl,($861A)
2ADE: 2B          dec  hl
2ADF: 7E          ld   a,(hl)
2AE0: 2A F6 85    ld   hl,($85F6)
2AE3: 23          inc  hl
2AE4: 23          inc  hl
2AE5: 23          inc  hl
2AE6: 23          inc  hl
2AE7: E6 07       and  $07
2AE9: FE 02       cp   $02
2AEB: 28 1C       jr   z,$2B09
2AED: 7E          ld   a,(hl)
2AEE: D6 10       sub  $10
2AF0: DD 77 00    ld   (ix+$00),a
2AF3: DD 23       inc  ix
2AF5: DD 23       inc  ix
2AF7: D6 10       sub  $10
2AF9: DD 77 00    ld   (ix+$00),a
2AFC: DD 23       inc  ix
2AFE: DD 23       inc  ix
2B00: D6 10       sub  $10
2B02: DD 77 00    ld   (ix+$00),a
2B05: 3E 02       ld   a,$02
2B07: 18 19       jr   $2B22
2B09: 7E          ld   a,(hl)
2B0A: C6 10       add  a,$10
2B0C: DD 77 00    ld   (ix+$00),a
2B0F: DD 23       inc  ix
2B11: DD 23       inc  ix
2B13: C6 10       add  a,$10
2B15: DD 77 00    ld   (ix+$00),a
2B18: DD 23       inc  ix
2B1A: DD 23       inc  ix
2B1C: C6 10       add  a,$10
2B1E: DD 77 00    ld   (ix+$00),a
2B21: AF          xor  a
2B22: 02          ld   (bc),a
2B23: 03          inc  bc
2B24: 03          inc  bc
2B25: 02          ld   (bc),a
2B26: 03          inc  bc
2B27: 03          inc  bc
2B28: 02          ld   (bc),a
2B29: 23          inc  hl
2B2A: 7E          ld   a,(hl)
2B2B: FD 77 00    ld   (iy+$00),a
2B2E: FD 23       inc  iy
2B30: FD 23       inc  iy
2B32: FD 77 00    ld   (iy+$00),a
2B35: FD 23       inc  iy
2B37: FD 23       inc  iy
2B39: FD 77 00    ld   (iy+$00),a
2B3C: ED 53 27 86 ld   ($8627),de
2B40: 2A F6 85    ld   hl,($85F6)
2B43: 11 0B 00    ld   de,$000B
2B46: 19          add  hl,de
2B47: 35          dec  (hl)
2B48: 4E          ld   c,(hl)
2B49: 2A F6 85    ld   hl,($85F6)
2B4C: 11 08 00    ld   de,$0008
2B4F: 19          add  hl,de
2B50: 7E          ld   a,(hl)
2B51: A7          and  a
2B52: 20 28       jr   nz,$2B7C
2B54: 79          ld   a,c
2B55: A7          and  a
2B56: 28 5D       jr   z,$2BB5
2B58: 3D          dec  a
2B59: CA 13 2C    jp   z,$2C13
2B5C: 3D          dec  a
2B5D: CA 13 2C    jp   z,$2C13
2B60: 3D          dec  a
2B61: CA F8 2B    jp   z,$2BF8
2B64: 3D          dec  a
2B65: 28 68       jr   z,$2BCF
2B67: 3D          dec  a
2B68: 28 3D       jr   z,$2BA7
2B6A: 3D          dec  a
2B6B: 3D          dec  a
2B6C: 28 2E       jr   z,$2B9C
2B6E: 3D          dec  a
2B6F: 3D          dec  a
2B70: 28 35       jr   z,$2BA7
2B72: 3D          dec  a
2B73: 3D          dec  a
2B74: 28 26       jr   z,$2B9C
2B76: 3D          dec  a
2B77: 3D          dec  a
2B78: 28 2D       jr   z,$2BA7
2B7A: E1          pop  hl
2B7B: C9          ret
2B7C: FE 01       cp   $01
2B7E: 20 0F       jr   nz,$2B8F
2B80: 79          ld   a,c
2B81: 3D          dec  a
2B82: 28 31       jr   z,$2BB5
2B84: 3D          dec  a
2B85: 28 71       jr   z,$2BF8
2B87: 3D          dec  a
2B88: 28 6E       jr   z,$2BF8
2B8A: 3D          dec  a
2B8B: 28 42       jr   z,$2BCF
2B8D: 18 D8       jr   $2B67
2B8F: 79          ld   a,c
2B90: 3D          dec  a
2B91: 3D          dec  a
2B92: 28 21       jr   z,$2BB5
2B94: 3D          dec  a
2B95: 28 38       jr   z,$2BCF
2B97: 3D          dec  a
2B98: 28 35       jr   z,$2BCF
2B9A: 18 CB       jr   $2B67
2B9C: 2A F6 85    ld   hl,($85F6)
2B9F: 11 07 00    ld   de,$0007
2BA2: 19          add  hl,de
2BA3: 36 02       ld   (hl),$02
2BA5: 18 09       jr   $2BB0
2BA7: 2A F6 85    ld   hl,($85F6)
2BAA: 11 07 00    ld   de,$0007
2BAD: 19          add  hl,de
2BAE: 36 0C       ld   (hl),$0C
2BB0: CD 9D 2F    call $2F9D
2BB3: E1          pop  hl
2BB4: C9          ret
2BB5: 2A F6 85    ld   hl,($85F6)
2BB8: 23          inc  hl
2BB9: CB B6       res  6,(hl)
2BBB: CD 9D 2F    call $2F9D
2BBE: 2A 27 86    ld   hl,($8627)
2BC1: 3E 32       ld   a,$32
2BC3: 77          ld   (hl),a
2BC4: 23          inc  hl
2BC5: 23          inc  hl
2BC6: 77          ld   (hl),a
2BC7: 23          inc  hl
2BC8: 23          inc  hl
2BC9: 77          ld   (hl),a
2BCA: CD 5F 15    call $155F
2BCD: E1          pop  hl
2BCE: C9          ret
2BCF: 2A 27 86    ld   hl,($8627)
2BD2: 36 2C       ld   (hl),$2C
2BD4: 23          inc  hl
2BD5: 36 05       ld   (hl),$05
2BD7: 23          inc  hl
2BD8: 36 32       ld   (hl),$32
2BDA: 23          inc  hl
2BDB: 23          inc  hl
2BDC: 36 32       ld   (hl),$32
2BDE: DD 2B       dec  ix
2BE0: DD 2B       dec  ix
2BE2: DD 2B       dec  ix
2BE4: DD 2B       dec  ix
2BE6: FD 2B       dec  iy
2BE8: FD 2B       dec  iy
2BEA: FD 2B       dec  iy
2BEC: FD 2B       dec  iy
2BEE: CD 5F 15    call $155F
2BF1: 21 8E 9A    ld   hl,$9A8E
2BF4: 36 01       ld   (hl),$01
2BF6: E1          pop  hl
2BF7: C9          ret
2BF8: 2A 27 86    ld   hl,($8627)
2BFB: 3E 05       ld   a,$05
2BFD: 36 2D       ld   (hl),$2D
2BFF: 23          inc  hl
2C00: 77          ld   (hl),a
2C01: 23          inc  hl
2C02: 36 2E       ld   (hl),$2E
2C04: 23          inc  hl
2C05: 77          ld   (hl),a
2C06: 23          inc  hl
2C07: 36 32       ld   (hl),$32
2C09: DD 2B       dec  ix
2C0B: DD 2B       dec  ix
2C0D: FD 2B       dec  iy
2C0F: FD 2B       dec  iy
2C11: 18 B7       jr   $2BCA
2C13: 2A 27 86    ld   hl,($8627)
2C16: 3E 05       ld   a,$05
2C18: 36 2F       ld   (hl),$2F
2C1A: 23          inc  hl
2C1B: 77          ld   (hl),a
2C1C: 23          inc  hl
2C1D: 36 30       ld   (hl),$30
2C1F: 23          inc  hl
2C20: 77          ld   (hl),a
2C21: 23          inc  hl
2C22: 36 31       ld   (hl),$31
2C24: 23          inc  hl
2C25: 77          ld   (hl),a
2C26: 18 A2       jr   $2BCA
2C28: CD F8 1C    call $1CF8
2C2B: 3A F4 85    ld   a,($85F4)
2C2E: CB 47       bit  0,a
2C30: 20 12       jr   nz,$2C44
2C32: CD 3A 2D    call $2D3A
2C35: CB 41       bit  0,c
2C37: C2 CE 2C    jp   nz,$2CCE
2C3A: CD 67 2D    call $2D67
2C3D: CB 41       bit  0,c
2C3F: C2 CE 2C    jp   nz,$2CCE
2C42: 18 10       jr   $2C54
2C44: CD 67 2D    call $2D67
2C47: CB 41       bit  0,c
2C49: C2 CE 2C    jp   nz,$2CCE
2C4C: CD 3A 2D    call $2D3A
2C4F: CB 41       bit  0,c
2C51: C2 CE 2C    jp   nz,$2CCE
2C54: 2A 1A 86    ld   hl,($861A)
2C57: 2B          dec  hl
2C58: 7E          ld   a,(hl)
2C59: 23          inc  hl
2C5A: 77          ld   (hl),a
2C5B: CD A8 2D    call $2DA8
2C5E: CB 41       bit  0,c
2C60: C2 CE 2C    jp   nz,$2CCE
2C63: CD F8 1C    call $1CF8
2C66: 3A F4 85    ld   a,($85F4)
2C69: E6 0F       and  $0F
2C6B: FE 0A       cp   $0A
2C6D: 38 1E       jr   c,$2C8D
2C6F: 18 44       jr   $2CB5
2C71: 2A F6 85    ld   hl,($85F6)
2C74: CB CE       set  1,(hl)
2C76: 23          inc  hl
2C77: CB C6       set  0,(hl)
2C79: 11 0A 00    ld   de,$000A
2C7C: 19          add  hl,de
2C7D: 36 28       ld   (hl),$28
2C7F: 23          inc  hl
2C80: 23          inc  hl
2C81: 23          inc  hl
2C82: 7E          ld   a,(hl)
2C83: 3C          inc  a
2C84: 3C          inc  a
2C85: 77          ld   (hl),a
2C86: CD 7A 2F    call $2F7A
2C89: 36 03       ld   (hl),$03
2C8B: E1          pop  hl
2C8C: C9          ret
2C8D: 2A 1A 86    ld   hl,($861A)
2C90: 2B          dec  hl
2C91: 7E          ld   a,(hl)
2C92: 23          inc  hl
2C93: 77          ld   (hl),a
2C94: 35          dec  (hl)
2C95: 35          dec  (hl)
2C96: CD A8 2D    call $2DA8
2C99: CB 41       bit  0,c
2C9B: F5          push af
2C9C: C4 92 2F    call nz,$2F92
2C9F: F1          pop  af
2CA0: 20 2C       jr   nz,$2CCE
2CA2: 2A 1A 86    ld   hl,($861A)
2CA5: 34          inc  (hl)
2CA6: 34          inc  (hl)
2CA7: 34          inc  (hl)
2CA8: 34          inc  (hl)
2CA9: CD A8 2D    call $2DA8
2CAC: CB 41       bit  0,c
2CAE: F5          push af
2CAF: C4 98 2F    call nz,$2F98
2CB2: F1          pop  af
2CB3: 20 19       jr   nz,$2CCE
2CB5: 2A 1A 86    ld   hl,($861A)
2CB8: 2B          dec  hl
2CB9: 7E          ld   a,(hl)
2CBA: 23          inc  hl
2CBB: 3C          inc  a
2CBC: 3C          inc  a
2CBD: 3C          inc  a
2CBE: 3C          inc  a
2CBF: 77          ld   (hl),a
2CC0: CD A8 2D    call $2DA8
2CC3: CB 41       bit  0,c
2CC5: F5          push af
2CC6: C4 98 2F    call nz,$2F98
2CC9: F1          pop  af
2CCA: 20 02       jr   nz,$2CCE
2CCC: 18 A3       jr   $2C71
2CCE: CD 7A 2F    call $2F7A
2CD1: 7E          ld   a,(hl)
2CD2: FE 06       cp   $06
2CD4: 38 04       jr   c,$2CDA
2CD6: FE C0       cp   $C0
2CD8: 38 97       jr   c,$2C71
2CDA: 2A 1A 86    ld   hl,($861A)
2CDD: 7E          ld   a,(hl)
2CDE: E6 07       and  $07
2CE0: 2B          dec  hl
2CE1: 77          ld   (hl),a
2CE2: 2A F6 85    ld   hl,($85F6)
2CE5: 11 05 00    ld   de,$0005
2CE8: 19          add  hl,de
2CE9: 7E          ld   a,(hl)
2CEA: FE 08       cp   $08
2CEC: 20 0F       jr   nz,$2CFD
2CEE: 3A F0 87    ld   a,($87F0)
2CF1: CB 47       bit  0,a
2CF3: 28 08       jr   z,$2CFD
2CF5: 2A 1A 86    ld   hl,($861A)
2CF8: 2B          dec  hl
2CF9: 36 06       ld   (hl),$06
2CFB: 18 11       jr   $2D0E
2CFD: 2A 1A 86    ld   hl,($861A)
2D00: 2B          dec  hl
2D01: 7E          ld   a,(hl)
2D02: E6 07       and  $07
2D04: 28 1E       jr   z,$2D24
2D06: FE 02       cp   $02
2D08: 28 0F       jr   z,$2D19
2D0A: FE 04       cp   $04
2D0C: 28 1B       jr   z,$2D29
2D0E: 11 04 00    ld   de,$0004
2D11: 2A F6 85    ld   hl,($85F6)
2D14: 19          add  hl,de
2D15: 35          dec  (hl)
2D16: 35          dec  (hl)
2D17: E1          pop  hl
2D18: C9          ret
2D19: 11 04 00    ld   de,$0004
2D1C: 2A F6 85    ld   hl,($85F6)
2D1F: 19          add  hl,de
2D20: 34          inc  (hl)
2D21: 34          inc  (hl)
2D22: E1          pop  hl
2D23: C9          ret
2D24: 11 05 00    ld   de,$0005
2D27: 18 E8       jr   $2D11
2D29: 2A F6 85    ld   hl,($85F6)
2D2C: 11 05 00    ld   de,$0005
2D2F: 19          add  hl,de
2D30: 3A F0 87    ld   a,($87F0)
2D33: CB 47       bit  0,a
2D35: C2 71 2C    jp   nz,$2C71
2D38: 18 E6       jr   $2D20
2D3A: 2A F6 85    ld   hl,($85F6)
2D3D: CB 46       bit  0,(hl)
2D3F: C2 55 2F    jp   nz,$2F55
2D42: 3A A2 98    ld   a,($98A2)
2D45: 21 F0 87    ld   hl,$87F0
2D48: CB 46       bit  0,(hl)
2D4A: CA 4E 2D    jp   z,$2D4E
2D4D: AF          xor  a
2D4E: 2A F6 85    ld   hl,($85F6)
2D51: 11 04 00    ld   de,$0004
2D54: 19          add  hl,de
2D55: BE          cp   (hl)
2D56: CA A1 2D    jp   z,$2DA1
2D59: D2 61 2D    jp   nc,$2D61
2D5C: 3E 06       ld   a,$06
2D5E: C3 63 2D    jp   $2D63
2D61: 3E 02       ld   a,$02
2D63: 23          inc  hl
2D64: C3 90 2D    jp   $2D90
2D67: 2A F6 85    ld   hl,($85F6)
2D6A: CB 46       bit  0,(hl)
2D6C: C2 68 2F    jp   nz,$2F68
2D6F: 3A A3 98    ld   a,($98A3)
2D72: 21 F0 87    ld   hl,$87F0
2D75: CB 46       bit  0,(hl)
2D77: CA 7C 2D    jp   z,$2D7C
2D7A: 3E 08       ld   a,$08
2D7C: 2A F6 85    ld   hl,($85F6)
2D7F: 11 05 00    ld   de,$0005
2D82: 19          add  hl,de
2D83: BE          cp   (hl)
2D84: CA A1 2D    jp   z,$2DA1
2D87: D2 8E 2D    jp   nc,$2D8E
2D8A: AF          xor  a
2D8B: C3 90 2D    jp   $2D90
2D8E: 3E 04       ld   a,$04
2D90: 11 0A 00    ld   de,$000A
2D93: 19          add  hl,de
2D94: 77          ld   (hl),a
2D95: E6 07       and  $07
2D97: 47          ld   b,a
2D98: 2B          dec  hl
2D99: 7E          ld   a,(hl)
2D9A: C6 04       add  a,$04
2D9C: E6 07       and  $07
2D9E: B8          cp   b
2D9F: 20 03       jr   nz,$2DA4
2DA1: 0E 00       ld   c,$00
2DA3: C9          ret
2DA4: CD A8 2D    call $2DA8
2DA7: C9          ret
2DA8: 2A 1A 86    ld   hl,($861A)
2DAB: 7E          ld   a,(hl)
2DAC: E6 07       and  $07
2DAE: 28 22       jr   z,$2DD2
2DB0: FE 02       cp   $02
2DB2: 28 35       jr   z,$2DE9
2DB4: FE 04       cp   $04
2DB6: 28 4B       jr   z,$2E03
2DB8: 2A 02 86    ld   hl,($8602)
2DBB: 22 12 86    ld   ($8612),hl
2DBE: 11 20 00    ld   de,$0020
2DC1: 19          add  hl,de
2DC2: 22 16 86    ld   ($8616),hl
2DC5: 2A 06 86    ld   hl,($8606)
2DC8: 22 14 86    ld   ($8614),hl
2DCB: 19          add  hl,de
2DCC: 22 18 86    ld   ($8618),hl
2DCF: C3 63 2E    jp   $2E63
2DD2: 2A 02 86    ld   hl,($8602)
2DD5: 22 12 86    ld   ($8612),hl
2DD8: 2B          dec  hl
2DD9: 22 16 86    ld   ($8616),hl
2DDC: 2A 04 86    ld   hl,($8604)
2DDF: 22 14 86    ld   ($8614),hl
2DE2: 2B          dec  hl
2DE3: 22 18 86    ld   ($8618),hl
2DE6: C3 21 2E    jp   $2E21
2DE9: 2A 04 86    ld   hl,($8604)
2DEC: 22 12 86    ld   ($8612),hl
2DEF: 11 E0 FF    ld   de,$FFE0
2DF2: 19          add  hl,de
2DF3: 22 16 86    ld   ($8616),hl
2DF6: 2A 08 86    ld   hl,($8608)
2DF9: 22 14 86    ld   ($8614),hl
2DFC: 19          add  hl,de
2DFD: 22 18 86    ld   ($8618),hl
2E00: C3 63 2E    jp   $2E63
2E03: 2A 06 86    ld   hl,($8606)
2E06: 22 12 86    ld   ($8612),hl
2E09: 23          inc  hl
2E0A: 22 16 86    ld   ($8616),hl
2E0D: 2A 08 86    ld   hl,($8608)
2E10: 22 14 86    ld   ($8614),hl
2E13: 23          inc  hl
2E14: 22 18 86    ld   ($8618),hl
2E17: 3A F0 87    ld   a,($87F0)
2E1A: CB 47       bit  0,a
2E1C: 28 03       jr   z,$2E21
2E1E: 0E 00       ld   c,$00
2E20: C9          ret
2E21: 2A 12 86    ld   hl,($8612)
2E24: CD 42 2E    call $2E42
2E27: 79          ld   a,c
2E28: FE 00       cp   $00
2E2A: C8          ret  z
2E2B: 2A 14 86    ld   hl,($8614)
2E2E: CD 42 2E    call $2E42
2E31: 79          ld   a,c
2E32: FE 00       cp   $00
2E34: C8          ret  z
2E35: 2A 16 86    ld   hl,($8616)
2E38: CD 42 2E    call $2E42
2E3B: 79          ld   a,c
2E3C: FE 00       cp   $00
2E3E: C8          ret  z
2E3F: 2A 18 86    ld   hl,($8618)
2E42: 7E          ld   a,(hl)
2E43: FE 02       cp   $02
2E45: 28 19       jr   z,$2E60
2E47: FE 03       cp   $03
2E49: 28 15       jr   z,$2E60
2E4B: FE 7E       cp   $7E
2E4D: 28 11       jr   z,$2E60
2E4F: FE 8E       cp   $8E
2E51: 28 0D       jr   z,$2E60
2E53: FE 8F       cp   $8F
2E55: 28 09       jr   z,$2E60
2E57: CB BF       res  7,a
2E59: FE 0C       cp   $0C
2E5B: 28 03       jr   z,$2E60
2E5D: 0E 00       ld   c,$00
2E5F: C9          ret
2E60: 0E 01       ld   c,$01
2E62: C9          ret
2E63: 2A 12 86    ld   hl,($8612)
2E66: CD 84 2E    call $2E84
2E69: 79          ld   a,c
2E6A: FE 00       cp   $00
2E6C: C8          ret  z
2E6D: 2A 14 86    ld   hl,($8614)
2E70: CD 84 2E    call $2E84
2E73: 79          ld   a,c
2E74: FE 00       cp   $00
2E76: C8          ret  z
2E77: 2A 16 86    ld   hl,($8616)
2E7A: CD 84 2E    call $2E84
2E7D: 79          ld   a,c
2E7E: FE 00       cp   $00
2E80: C8          ret  z
2E81: 2A 18 86    ld   hl,($8618)
2E84: 7E          ld   a,(hl)
2E85: FE 8D       cp   $8D
2E87: CA A3 2E    jp   z,$2EA3
2E8A: FE 7E       cp   $7E
2E8C: CA A3 2E    jp   z,$2EA3
2E8F: FE 08       cp   $08
2E91: CA A3 2E    jp   z,$2EA3
2E94: FE 09       cp   $09
2E96: CA A3 2E    jp   z,$2EA3
2E99: CB BF       res  7,a
2E9B: FE 0C       cp   $0C
2E9D: CA A3 2E    jp   z,$2EA3
2EA0: 0E 00       ld   c,$00
2EA2: C9          ret
2EA3: 0E 01       ld   c,$01
2EA5: C9          ret
2EA6: 7E          ld   a,(hl)
2EA7: FE 8C       cp   $8C
2EA9: CA D1 2E    jp   z,$2ED1
2EAC: FE 7E       cp   $7E
2EAE: CA D1 2E    jp   z,$2ED1
2EB1: FE 09       cp   $09
2EB3: CA D1 2E    jp   z,$2ED1
2EB6: FE 08       cp   $08
2EB8: CA D1 2E    jp   z,$2ED1
2EBB: FE 0C       cp   $0C
2EBD: CA D1 2E    jp   z,$2ED1
2EC0: FE 02       cp   $02
2EC2: CA D1 2E    jp   z,$2ED1
2EC5: FE 8D       cp   $8D
2EC7: CA D1 2E    jp   z,$2ED1
2ECA: FE 03       cp   $03
2ECC: CA D1 2E    jp   z,$2ED1
2ECF: AF          xor  a
2ED0: C9          ret
2ED1: 3E 01       ld   a,$01
2ED3: C9          ret
2ED4: E5          push hl
2ED5: 2A 1A 86    ld   hl,($861A)
2ED8: 2B          dec  hl
2ED9: 7E          ld   a,(hl)
2EDA: E6 07       and  $07
2EDC: FE 02       cp   $02
2EDE: CA EA 2E    jp   z,$2EEA
2EE1: FE 06       cp   $06
2EE3: CA F8 2E    jp   z,$2EF8
2EE6: 06 03       ld   b,$03
2EE8: E1          pop  hl
2EE9: C9          ret
2EEA: 2A 02 86    ld   hl,($8602)
2EED: 22 36 86    ld   ($8636),hl
2EF0: 2A 06 86    ld   hl,($8606)
2EF3: 22 38 86    ld   ($8638),hl
2EF6: 18 0C       jr   $2F04
2EF8: 2A 04 86    ld   hl,($8604)
2EFB: 22 36 86    ld   ($8636),hl
2EFE: 2A 08 86    ld   hl,($8608)
2F01: 22 38 86    ld   ($8638),hl
2F04: 06 03       ld   b,$03
2F06: 2A 1A 86    ld   hl,($861A)
2F09: 2B          dec  hl
2F0A: 7E          ld   a,(hl)
2F0B: E6 07       and  $07
2F0D: FE 02       cp   $02
2F0F: CA 1A 2F    jp   z,$2F1A
2F12: FE 06       cp   $06
2F14: CA 2E 2F    jp   z,$2F2E
2F17: AF          xor  a
2F18: E1          pop  hl
2F19: C9          ret
2F1A: 11 C0 FF    ld   de,$FFC0
2F1D: 2A 36 86    ld   hl,($8636)
2F20: 19          add  hl,de
2F21: 22 36 86    ld   ($8636),hl
2F24: 2A 38 86    ld   hl,($8638)
2F27: 19          add  hl,de
2F28: 22 38 86    ld   ($8638),hl
2F2B: C3 33 2F    jp   $2F33
2F2E: 11 40 00    ld   de,$0040
2F31: 18 EA       jr   $2F1D
2F33: 2A 36 86    ld   hl,($8636)
2F36: CD A6 2E    call $2EA6
2F39: CB 47       bit  0,a
2F3B: CA 4B 2F    jp   z,$2F4B
2F3E: 2A 38 86    ld   hl,($8638)
2F41: CD A6 2E    call $2EA6
2F44: CB 47       bit  0,a
2F46: CA 4B 2F    jp   z,$2F4B
2F49: 10 BB       djnz $2F06
2F4B: 2A F6 85    ld   hl,($85F6)
2F4E: 11 08 00    ld   de,$0008
2F51: 19          add  hl,de
2F52: 70          ld   (hl),b
2F53: E1          pop  hl
2F54: C9          ret
2F55: 3A A2 98    ld   a,($98A2)
2F58: 2A F6 85    ld   hl,($85F6)
2F5B: 11 04 00    ld   de,$0004
2F5E: 19          add  hl,de
2F5F: BE          cp   (hl)
2F60: D2 61 2D    jp   nc,$2D61
2F63: 3E 06       ld   a,$06
2F65: C3 63 2D    jp   $2D63
2F68: 3A A3 98    ld   a,($98A3)
2F6B: 2A F6 85    ld   hl,($85F6)
2F6E: 11 05 00    ld   de,$0005
2F71: 19          add  hl,de
2F72: BE          cp   (hl)
2F73: D2 8E 2D    jp   nc,$2D8E
2F76: AF          xor  a
2F77: C3 90 2D    jp   $2D90
2F7A: 2A F6 85    ld   hl,($85F6)
2F7D: 11 25 85    ld   de,$8525
2F80: A7          and  a
2F81: ED 52       sbc  hl,de
2F83: 7D          ld   a,l
2F84: 0F          rrca
2F85: 0F          rrca
2F86: 0F          rrca
2F87: 0F          rrca
2F88: E6 0F       and  $0F
2F8A: 5F          ld   e,a
2F8B: 16 00       ld   d,$00
2F8D: 21 4B 86    ld   hl,$864B
2F90: 19          add  hl,de
2F91: C9          ret
2F92: CD 7A 2F    call $2F7A
2F95: 36 03       ld   (hl),$03
2F97: C9          ret
2F98: CD 7A 2F    call $2F7A
2F9B: 34          inc  (hl)
2F9C: C9          ret
2F9D: 3E 50       ld   a,$50
2F9F: FD 77 00    ld   (iy+$00),a
2FA2: FD 77 FE    ld   (iy-$02),a
2FA5: FD 77 FC    ld   (iy-$04),a
2FA8: AF          xor  a
2FA9: DD 77 00    ld   (ix+$00),a
2FAC: DD 77 FE    ld   (ix-$02),a
2FAF: DD 77 FC    ld   (ix-$04),a
2FB2: C9          ret
2FB3: 2E 00       ld   l,$00
add_to_score_2fb5:
2FB5: 26 00       ld   h,$00
2FB7: 11 2B 30    ld   de,$302B
2FBA: 19          add  hl,de
2FBB: 11 11 84    ld   de,$8411
2FBE: 7E          ld   a,(hl)
2FBF: 12          ld   (de),a
2FC0: 23          inc  hl
2FC1: 13          inc  de
2FC2: 7E          ld   a,(hl)
2FC3: 12          ld   (de),a
2FC4: 23          inc  hl
2FC5: 13          inc  de
2FC6: 7E          ld   a,(hl)
2FC7: 12          ld   (de),a
2FC8: 3A 57 86    ld   a,($8657)
2FCB: CB 4F       bit  1,a
2FCD: C0          ret  nz
2FCE: 3A 81 9A    ld   a,($9A81)
2FD1: FE 00       cp   $00
2FD3: C0          ret  nz
2FD4: 11 11 84    ld   de,$8411
2FD7: 21 EF 89    ld   hl,$89EF
2FDA: A7          and  a
2FDB: 06 03       ld   b,$03
2FDD: 1A          ld   a,(de)
2FDE: 8E          adc  a,(hl)
2FDF: 27          daa
2FE0: 77          ld   (hl),a
2FE1: 23          inc  hl
2FE2: 13          inc  de
2FE3: 10 F8       djnz $2FDD
2FE5: 3E 00       ld   a,$00
2FE7: 8E          adc  a,(hl)
2FE8: 27          daa
2FE9: 77          ld   (hl),a
2FEA: 3A 00 84    ld   a,($8400)
2FED: CB 4F       bit  1,a
2FEF: 20 05       jr   nz,$2FF6		; branch if player 2
2FF1: 11 14 84    ld   de,player_1_score_8414
2FF4: 18 03       jr   $2FF9
2FF6: 11 17 84    ld   de,player_2_score_8417
2FF9: 21 11 84    ld   hl,$8411
2FFC: A7          and  a
2FFD: 06 03       ld   b,$03
2FFF: 1A          ld   a,(de)
3000: 8E          adc  a,(hl)
3001: 27          daa
3002: 12          ld   (de),a
3003: 13          inc  de
3004: 23          inc  hl
3005: 10 F8       djnz $2FFF
3007: 1B          dec  de
3008: EB          ex   de,hl
3009: 22 27 86    ld   ($8627),hl
300C: 11 29 89    ld   de,$8929
300F: 06 03       ld   b,$03
3011: 1A          ld   a,(de)
3012: BE          cp   (hl)
3013: 20 05       jr   nz,$301A
3015: 2B          dec  hl
3016: 1B          dec  de
3017: 10 F8       djnz $3011
3019: C9          ret
301A: D0          ret  nc
301B: 21 29 89    ld   hl,$8929
301E: ED 5B 27 86 ld   de,($8627)
3022: 06 03       ld   b,$03
3024: 1A          ld   a,(de)
3025: 77          ld   (hl),a
3026: 2B          dec  hl
3027: 1B          dec  de
3028: 10 FA       djnz $3024
302A: C9          ret


32F0: ED 73 85 89 ld   ($8985),sp		; save stack
32F4: 32 88 89    ld   ($8988),a
32F7: 3A A7 85    ld   a,($85A7)
32FA: 32 87 89    ld   ($8987),a
32FD: 11 82 89    ld   de,$8982
3300: 06 03       ld   b,$03
3302: 7E          ld   a,(hl)
3303: 23          inc  hl
3304: 12          ld   (de),a
3305: 1B          dec  de
3306: 10 FA       djnz $3302
3308: 3E 01       ld   a,$01
330A: 32 3D 9B    ld   ($9B3D),a
330D: 3A 3D 9B    ld   a,($9B3D)
3310: A7          and  a
3311: 20 FA       jr   nz,$330D
3313: 21 A0 89    ld   hl,$89A0
3316: 06 05       ld   b,$05
3318: 11 80 89    ld   de,$8980
331B: 0E 03       ld   c,$03
331D: 1A          ld   a,(de)
331E: 96          sub  (hl)
331F: 38 14       jr   c,$3335
3321: 20 07       jr   nz,$332A
3323: 23          inc  hl
3324: 13          inc  de
3325: 0D          dec  c
3326: 20 F5       jr   nz,$331D
3328: 18 0B       jr   $3335
332A: 23          inc  hl
332B: 0D          dec  c
332C: 20 FC       jr   nz,$332A
332E: 10 E8       djnz $3318
3330: CD 3B 35    call $353B
3333: 06 00       ld   b,$00
3335: 04          inc  b
3336: 78          ld   a,b
3337: 32 C5 89    ld   ($89C5),a
333A: FE 06       cp   $06
333C: 20 05       jr   nz,$3343
333E: ED 7B 85 89 ld   sp,($8985)		; restore stack
3342: C9          ret

3343: 3E 05       ld   a,$05
3345: 90          sub  b
3346: 28 1F       jr   z,$3367
3348: 4F          ld   c,a
3349: 06 00       ld   b,$00
334B: 21 C1 89    ld   hl,$89C1
334E: 11 C0 89    ld   de,$89C0
3351: 87          add  a,a
3352: 81          add  a,c
3353: ED B0       ldir
3355: 21 A3 89    ld   hl,$89A3
3358: 11 A0 89    ld   de,$89A0
335B: 4F          ld   c,a
335C: ED B0       ldir
335E: 4F          ld   c,a
335F: 21 B3 89    ld   hl,$89B3
3362: 11 B0 89    ld   de,$89B0
3365: ED B0       ldir
3367: 4F          ld   c,a
3368: 21 A0 89    ld   hl,$89A0
336B: 06 00       ld   b,$00
336D: 09          add  hl,bc
336E: EB          ex   de,hl
336F: 21 80 89    ld   hl,$8980
3372: 0E 03       ld   c,$03
3374: ED B0       ldir
3376: 21 B0 89    ld   hl,$89B0
3379: 4F          ld   c,a
337A: 09          add  hl,bc
337B: 06 03       ld   b,$03
337D: 36 37       ld   (hl),$37
337F: 23          inc  hl
3380: 10 FB       djnz $337D
3382: 3A C5 89    ld   a,($89C5)
3385: D6 05       sub  $05
3387: ED 44       neg
3389: 4F          ld   c,a
338A: 21 C0 89    ld   hl,$89C0
338D: 09          add  hl,bc
338E: 3A 88 89    ld   a,($8988)
3391: 77          ld   (hl),a
3392: 21 A8 85    ld   hl,$85A8
3395: 3A 00 84    ld   a,($8400)
3398: F6 F9       or   $F9
339A: 3C          inc  a
339B: 20 01       jr   nz,$339E
339D: 23          inc  hl
339E: 22 C7 89    ld   ($89C7),hl
33A1: CD 33 3E    call $3E33
33A4: 21 2D 37    ld   hl,$372D
33A7: CD F3 36    call $36F3
33AA: CD F3 36    call $36F3
33AD: CD F3 36    call $36F3
33B0: 21 80 89    ld   hl,$8980
33B3: 11 2F 83    ld   de,$832F
33B6: 01 00 03    ld   bc,$0300
33B9: CD C6 36    call $36C6
33BC: 06 05       ld   b,$05
33BE: CD E9 36    call $36E9
33C1: 10 FB       djnz $33BE
33C3: 3A 88 89    ld   a,($8988)
33C6: 0E 10       ld   c,$10
33C8: CD 61 36    call $3661
33CB: 21 2F 81    ld   hl,$812F
33CE: 22 C9 89    ld   ($89C9),hl
33D1: AF          xor  a
33D2: 32 C6 89    ld   ($89C6),a
33D5: 21 28 F0    ld   hl,$F028
33D8: 22 CD 89    ld   ($89CD),hl
33DB: CD E7 35    call $35E7
33DE: CD EE 34    call $34EE
33E1: 3E FF       ld   a,$FF
33E3: 32 94 9A    ld   ($9A94),a
33E6: 06 02       ld   b,$02
33E8: CD DD 34    call $34DD
33EB: 3A 23 84    ld   a,($8423)
33EE: 4F          ld   c,a
33EF: CD EE 34    call $34EE
33F2: 3A 23 84    ld   a,($8423)
33F5: B9          cp   c
33F6: 28 F7       jr   z,$33EF
33F8: E6 0F       and  $0F
33FA: CC 19 35    call z,$3519
33FD: 2A C7 89    ld   hl,($89C7)
3400: CB 66       bit  4,(hl)
3402: CC 82 34    call z,$3482
3405: 2A C7 89    ld   hl,($89C7)
3408: 7E          ld   a,(hl)
3409: E6 0E       and  $0E
340B: 21 84 89    ld   hl,$8984
340E: BE          cp   (hl)
340F: 77          ld   (hl),a
3410: 28 1A       jr   z,$342C
3412: FE 02       cp   $02
3414: 28 0F       jr   z,$3425
3416: FE 0C       cp   $0C
3418: 28 0B       jr   z,$3425
341A: FE 06       cp   $06
341C: 20 CD       jr   nz,$33EB
341E: 3E FD       ld   a,$FD
3420: 32 CB 89    ld   ($89CB),a
3423: 18 3A       jr   $345F
3425: 3E FD       ld   a,$FD
3427: 32 CC 89    ld   ($89CC),a
342A: 18 0C       jr   $3438
342C: FE 06       cp   $06
342E: 28 2F       jr   z,$345F
3430: FE 0C       cp   $0C
3432: 28 04       jr   z,$3438
3434: FE 02       cp   $02
3436: 20 B3       jr   nz,$33EB
3438: 21 CC 89    ld   hl,$89CC
343B: 34          inc  (hl)
343C: 20 AD       jr   nz,$33EB
343E: 36 F0       ld   (hl),$F0
3440: 3E 28       ld   a,$28
3442: 32 CD 89    ld   ($89CD),a
3445: 2A C9 89    ld   hl,($89C9)
3448: 34          inc  (hl)
3449: 7E          ld   a,(hl)
344A: E6 3F       and  $3F
344C: FE 34       cp   $34
344E: 38 05       jr   c,$3455
3450: FE 38       cp   $38
3452: 30 07       jr   nc,$345B
3454: 34          inc  (hl)
3455: CD E7 35    call $35E7
3458: C3 EB 33    jp   $33EB
345B: 36 1A       ld   (hl),$1A
345D: 18 F6       jr   $3455
345F: 21 CB 89    ld   hl,$89CB
3462: 34          inc  (hl)
3463: 20 F3       jr   nz,$3458
3465: 36 F0       ld   (hl),$F0
3467: 3E 28       ld   a,$28
3469: 32 CD 89    ld   ($89CD),a
346C: 2A C9 89    ld   hl,($89C9)
346F: 35          dec  (hl)
3470: 7E          ld   a,(hl)
3471: E6 3F       and  $3F
3473: FE 19       cp   $19
3475: 28 07       jr   z,$347E
3477: FE 34       cp   $34
3479: 38 DA       jr   c,$3455
347B: 35          dec  (hl)
347C: 18 D7       jr   $3455
347E: 36 37       ld   (hl),$37
3480: 18 D3       jr   $3455
3482: 2A C9 89    ld   hl,($89C9)
3485: CB BE       res  7,(hl)
3487: 4E          ld   c,(hl)
3488: EB          ex   de,hl
3489: CD E9 36    call $36E9
348C: ED 53 C9 89 ld   ($89C9),de
3490: 3E 28       ld   a,$28
3492: 32 CD 89    ld   ($89CD),a
3495: 3A C6 89    ld   a,($89C6)
3498: 5F          ld   e,a
3499: 3C          inc  a
349A: 32 C6 89    ld   ($89C6),a
349D: 47          ld   b,a
349E: 16 00       ld   d,$00
34A0: 3A C5 89    ld   a,($89C5)
34A3: 21 2F 35    ld   hl,$352F
34A6: CF          rst  $08
34A7: 7E          ld   a,(hl)
34A8: 23          inc  hl
34A9: 66          ld   h,(hl)
34AA: 6F          ld   l,a
34AB: 19          add  hl,de
34AC: 71          ld   (hl),c
34AD: 78          ld   a,b
34AE: FE 03       cp   $03
34B0: C2 E7 35    jp   nz,$35E7
34B3: ED 7B 85 89 ld   sp,($8985)
34B7: CD E7 35    call $35E7
34BA: CD FC 34    call $34FC
34BD: 3E 01       ld   a,$01
34BF: 32 94 9A    ld   ($9A94),a
34C2: 06 04       ld   b,$04
34C4: CD DD 34    call $34DD
34C7: 3A 94 9A    ld   a,($9A94)
34CA: A7          and  a
34CB: 20 FA       jr   nz,$34C7
34CD: 3E 02       ld   a,$02
34CF: 32 3D 9B    ld   ($9B3D),a
34D2: 3A 3D 9B    ld   a,($9B3D)
34D5: A7          and  a
34D6: 20 FA       jr   nz,$34D2
34D8: ED 7B 85 89 ld   sp,($8985)
34DC: C9          ret
34DD: 3A 23 84    ld   a,($8423)
34E0: E6 3F       and  $3F
34E2: 20 F9       jr   nz,$34DD
34E4: 3A 23 84    ld   a,($8423)
34E7: E6 3F       and  $3F
34E9: 28 F9       jr   z,$34E4
34EB: 10 F0       djnz $34DD
34ED: C9          ret
34EE: 3A A7 85    ld   a,($85A7)
34F1: 5F          ld   e,a
34F2: 3A 87 89    ld   a,($8987)
34F5: BB          cp   e
34F6: C8          ret  z
34F7: CD 82 34    call $3482
34FA: 18 FB       jr   $34F7
34FC: 3A A7 85    ld   a,($85A7)
34FF: 5F          ld   e,a
3500: 3A 87 89    ld   a,($8987)
3503: BB          cp   e
3504: C8          ret  z
3505: 3A 94 9A    ld   a,($9A94)
3508: A7          and  a
3509: 28 C2       jr   z,$34CD
350B: 3E 01       ld   a,$01
350D: 32 94 9A    ld   ($9A94),a
3510: 3A 94 9A    ld   a,($9A94)
3513: A7          and  a
3514: 28 FA       jr   z,$3510
3516: 18 B5       jr   $34CD
3518: C9          ret
3519: 2A C9 89    ld   hl,($89C9)
351C: 7E          ld   a,(hl)
351D: EE 80       xor  $80
351F: 77          ld   (hl),a
3520: 3A 23 84    ld   a,($8423)
3523: E6 1F       and  $1F
3525: C0          ret  nz
3526: 21 CD 89    ld   hl,$89CD
3529: 35          dec  (hl)
352A: 28 CB       jr   z,$34F7
352C: 23          inc  hl
352D: 35          dec  (hl)
352E: 28 C7       jr   z,$34F7
3530: C9          ret
3531: BC          cp   h
3532: 89          adc  a,c
3533: B9          cp   c
3534: 89          adc  a,c
3535: B6          or   (hl)
3536: 89          adc  a,c
3537: B3          or   e
3538: 89          adc  a,c
3539: B0          or   b
353A: 89          adc  a,c
353B: CD 33 3E    call $3E33
353E: 21 77 37    ld   hl,$3777
3541: CD F3 36    call $36F3
3544: CD F3 36    call $36F3
3547: CD F3 36    call $36F3
354A: CD F3 36    call $36F3
354D: 3E 01       ld   a,$01
354F: 32 82 9A    ld   ($9A82),a
3552: 3A 23 84    ld   a,($8423)
3555: E6 1F       and  $1F
3557: CC 75 35    call z,$3575
355A: E6 0F       and  $0F
355C: CC C9 35    call z,$35C9
355F: 3A 82 9A    ld   a,($9A82)
3562: A7          and  a
3563: 20 ED       jr   nz,$3552
3565: CD 75 35    call $3575
3568: 3A 23 84    ld   a,($8423)
356B: C6 3C       add  a,$3C
356D: 4F          ld   c,a
356E: 3A 23 84    ld   a,($8423)
3571: B9          cp   c
3572: 20 FA       jr   nz,$356E
3574: C9          ret
3575: 21 80 89    ld   hl,$8980
3578: 11 6D 83    ld   de,$836D
357B: 06 03       ld   b,$03
357D: AF          xor  a
357E: 32 83 89    ld   ($8983),a
3581: 7E          ld   a,(hl)
3582: 1F          rra
3583: 1F          rra
3584: 1F          rra
3585: 1F          rra
3586: CD 93 35    call $3593
3589: 7E          ld   a,(hl)
358A: CD 93 35    call $3593
358D: 23          inc  hl
358E: 10 F1       djnz $3581
3590: 3E 01       ld   a,$01
3592: C9          ret
3593: E6 0F       and  $0F
3595: 20 0E       jr   nz,$35A5
3597: 3A 83 89    ld   a,($8983)
359A: A7          and  a
359B: 3E 00       ld   a,$00
359D: 20 06       jr   nz,$35A5
359F: CD E9 36    call $36E9
35A2: C3 E9 36    jp   $36E9
35A5: E5          push hl
35A6: C5          push bc
35A7: 21 CA 37    ld   hl,$37CA
35AA: CF          rst  $08
35AB: 7E          ld   a,(hl)
35AC: 23          inc  hl
35AD: 66          ld   h,(hl)
35AE: 6F          ld   l,a
35AF: 01 FF 04    ld   bc,$04FF
35B2: D5          push de
35B3: ED A0       ldi
35B5: ED A0       ldi
35B7: ED A0       ldi
35B9: ED A0       ldi
35BB: D1          pop  de
35BC: CD E9 36    call $36E9
35BF: 10 F1       djnz $35B2
35C1: C1          pop  bc
35C2: E1          pop  hl
35C3: 3E 01       ld   a,$01
35C5: 32 83 89    ld   ($8983),a
35C8: C9          ret
35C9: 11 6D 83    ld   de,$836D
35CC: CD D5 35    call $35D5
35CF: CD D5 35    call $35D5
35D2: CD D5 35    call $35D5
35D5: D5          push de
35D6: 06 18       ld   b,$18
35D8: 3E 40       ld   a,$40
35DA: 12          ld   (de),a
35DB: CD E9 36    call $36E9
35DE: 10 F8       djnz $35D8
35E0: D1          pop  de
35E1: 13          inc  de
35E2: C9          ret
35E3: AF          xor  a
35E4: 32 C5 89    ld   ($89C5),a
35E7: 21 63 37    ld   hl,$3763
35EA: CD F3 36    call $36F3
35ED: 11 5D 83    ld   de,$835D
35F0: 06 05       ld   b,$05
35F2: CD F8 35    call $35F8
35F5: 10 FB       djnz $35F2
35F7: C9          ret
35F8: 0E 00       ld   c,$00
35FA: 3A C5 89    ld   a,($89C5)
35FD: B8          cp   b
35FE: 20 02       jr   nz,$3602
3600: 0E 40       ld   c,$40
3602: 78          ld   a,b
3603: 21 8D 36    ld   hl,$368D
3606: CF          rst  $08
3607: 7E          ld   a,(hl)
3608: 23          inc  hl
3609: 66          ld   h,(hl)
360A: 6F          ld   l,a
360B: D5          push de
360C: C5          push bc
360D: 06 03       ld   b,$03
360F: 7E          ld   a,(hl)
3610: B1          or   c
3611: 12          ld   (de),a
3612: 23          inc  hl
3613: CD E9 36    call $36E9
3616: 10 F7       djnz $360F
3618: CD E9 36    call $36E9
361B: CD E9 36    call $36E9
361E: CD 45 36    call $3645
3621: 06 04       ld   b,$04
3623: CD E9 36    call $36E9
3626: 10 FB       djnz $3623
3628: CD 64 36    call $3664
362B: CD E9 36    call $36E9
362E: CD E9 36    call $36E9
3631: 7E          ld   a,(hl)
3632: 23          inc  hl
3633: 66          ld   h,(hl)
3634: 6F          ld   l,a
3635: 06 03       ld   b,$03
3637: 7E          ld   a,(hl)
3638: B1          or   c
3639: 12          ld   (de),a
363A: CD E9 36    call $36E9
363D: 23          inc  hl
363E: 10 F7       djnz $3637
3640: C1          pop  bc
3641: D1          pop  de
3642: 1B          dec  de
3643: 1B          dec  de
3644: C9          ret
3645: 7E          ld   a,(hl)
3646: 23          inc  hl
3647: E5          push hl
3648: 66          ld   h,(hl)
3649: 6F          ld   l,a
364A: C5          push bc
364B: D5          push de
364C: 01 00 03    ld   bc,$0300
364F: CD C6 36    call $36C6
3652: D1          pop  de
3653: C1          pop  bc
3654: 06 06       ld   b,$06
3656: 1A          ld   a,(de)
3657: B1          or   c
3658: 12          ld   (de),a
3659: CD E9 36    call $36E9
365C: 10 F8       djnz $3656
365E: E1          pop  hl
365F: 23          inc  hl
3660: C9          ret
3661: E5          push hl
3662: 18 06       jr   $366A
3664: 7E          ld   a,(hl)
3665: 23          inc  hl
3666: E5          push hl
3667: 66          ld   h,(hl)
3668: 6F          ld   l,a
3669: 7E          ld   a,(hl)
366A: 06 00       ld   b,$00
366C: D6 0A       sub  $0A
366E: 38 03       jr   c,$3673
3670: 04          inc  b
3671: 18 F9       jr   $366C
3673: F5          push af
3674: 78          ld   a,b
3675: CD 81 36    call $3681
3678: F1          pop  af
3679: C6 0A       add  a,$0A
367B: CD 87 36    call $3687
367E: E1          pop  hl
367F: 23          inc  hl
3680: C9          ret
3681: E6 0F       and  $0F
3683: 20 02       jr   nz,$3687
3685: 3E 27       ld   a,$27
3687: C6 10       add  a,$10
3689: B1          or   c
368A: 12          ld   (de),a
368B: CD E9 36    call $36E9
368E: C9          ret
368F: 99          sbc  a,c
3690: 36 A2       ld   (hl),$A2
3692: 36 AB       ld   (hl),$AB
3694: 36 B4       ld   (hl),$B4
3696: 36 BD       ld   (hl),$BD
3698: 36 11       ld   (hl),$11
369A: 2C          inc  l
369B: 2D          dec  l
369C: AC          xor  h
369D: 89          adc  a,c
369E: C4 89 BC    call nz,$BC89
36A1: 89          adc  a,c
36A2: 12          ld   (de),a
36A3: 27          daa
36A4: 1D          dec  e
36A5: A9          xor  c
36A6: 89          adc  a,c
36A7: C3 89 B9    jp   $B989
36AA: 89          adc  a,c
36AB: 13          inc  de
36AC: 2B          dec  hl
36AD: 1D          dec  e
36AE: A6          and  (hl)
36AF: 89          adc  a,c
36B0: C2 89 B6    jp   nz,$B689
36B3: 89          adc  a,c
36B4: 14          inc  d
36B5: 2D          dec  l
36B6: 21 A3 89    ld   hl,$89A3
36B9: C1          pop  bc
36BA: 89          adc  a,c
36BB: B3          or   e
36BC: 89          adc  a,c
36BD: 15          dec  d
36BE: 2D          dec  l
36BF: 21 A0 89    ld   hl,$89A0
36C2: C0          ret  nz
36C3: 89          adc  a,c
36C4: B0          or   b
36C5: 89          adc  a,c
36C6: 7E          ld   a,(hl)
36C7: CD CE 36    call $36CE
36CA: 23          inc  hl
36CB: 10 F9       djnz $36C6
36CD: C9          ret
36CE: F5          push af
36CF: 1F          rra
36D0: 1F          rra
36D1: 1F          rra
36D2: 1F          rra
36D3: CD DC 36    call $36DC
36D6: F1          pop  af
36D7: 10 02       djnz $36DB
36D9: 0E FF       ld   c,$FF
36DB: 04          inc  b
36DC: E6 0F       and  $0F
36DE: 28 02       jr   z,$36E2
36E0: 0E FF       ld   c,$FF
36E2: F6 10       or   $10
36E4: A1          and  c
36E5: CC F0 36    call z,$36F0
36E8: 12          ld   (de),a
36E9: 7B          ld   a,e
36EA: D6 20       sub  $20
36EC: 5F          ld   e,a
36ED: D0          ret  nc
36EE: 15          dec  d
36EF: C9          ret
36F0: 3E 37       ld   a,$37
36F2: C9          ret
36F3: 4E          ld   c,(hl)
36F4: 23          inc  hl
36F5: 46          ld   b,(hl)
36F6: 23          inc  hl
36F7: 5E          ld   e,(hl)
36F8: 23          inc  hl
36F9: 56          ld   d,(hl)
36FA: 23          inc  hl
36FB: 7E          ld   a,(hl)
36FC: CD 0C 37    call $370C
36FF: FE FF       cp   $FF
3701: 28 05       jr   z,$3708
3703: 81          add  a,c
3704: 12          ld   (de),a
3705: CD E9 36    call $36E9
3708: 23          inc  hl
3709: 10 F0       djnz $36FB
370B: C9          ret
370C: D6 30       sub  $30
370E: FE 0A       cp   $0A
3710: D8          ret  c
3711: D6 07       sub  $07
3713: FE 23       cp   $23
3715: D8          ret  c
3716: C6 3E       add  a,$3E
3718: FE 27       cp   $27
371A: C8          ret  z
371B: C6 FC       add  a,$FC
371D: FE 24       cp   $24
371F: C8          ret  z
3720: C6 F4       add  a,$F4
3722: FE 25       cp   $25
3724: C8          ret  z
3725: C6 08       add  a,$08
3727: FE 26       cp   $26
3729: C8          ret  z
372A: 3E FF       ld   a,$FF
372C: C9          ret

387E: F3          di
387F: 3E 10       ld   a,$10
3881: 32 00 71    ld   ($7100),a
3884: AF          xor  a
3885: 32 23 68    ld   ($6823),a
3888: 32 02 A0    ld   ($A002),a
388B: 32 20 68    ld   ($6820),a
388E: 3D          dec  a
388F: 32 00 70    ld   ($7000),a
3892: 3E 04       ld   a,$04
3894: 32 40 B8    ld   ($B840),a
3897: 21 00 00    ld   hl,$0000
389A: 06 10       ld   b,$10
389C: D9          exx
389D: 21 00 80    ld   hl,$8000
38A0: 01 00 04    ld   bc,$0400
38A3: 54          ld   d,h
38A4: 5D          ld   e,l
38A5: D9          exx
38A6: 54          ld   d,h
38A7: 5D          ld   e,l
38A8: D9          exx
38A9: D9          exx
38AA: 7C          ld   a,h
38AB: AD          xor  l
38AC: 2F          cpl
38AD: 87          add  a,a
38AE: 87          add  a,a
38AF: ED 6A       adc  hl,hl
38B1: 7D          ld   a,l
38B2: D9          exx
38B3: 77          ld   (hl),a
38B4: 23          inc  hl
38B5: 32 30 68    ld   (watchdog_6830),a
38B8: 0D          dec  c
38B9: 20 EE       jr   nz,$38A9
38BB: 10 EC       djnz $38A9
38BD: 06 04       ld   b,$04
38BF: 62          ld   h,d
38C0: 6B          ld   l,e
38C1: D9          exx
38C2: EB          ex   de,hl
38C3: D9          exx
38C4: D9          exx
38C5: 7D          ld   a,l
38C6: AC          xor  h
38C7: 2F          cpl
38C8: 87          add  a,a
38C9: 87          add  a,a
38CA: ED 6A       adc  hl,hl
38CC: 7D          ld   a,l
38CD: D9          exx
38CE: AE          xor  (hl)
38CF: C2 78 3D    jp   nz,$3D78
38D2: 23          inc  hl
38D3: 32 30 68    ld   (watchdog_6830),a
38D6: 0D          dec  c
38D7: 20 EB       jr   nz,$38C4
38D9: 10 E9       djnz $38C4
38DB: EB          ex   de,hl
38DC: D9          exx
38DD: 10 BD       djnz $389C
38DF: D9          exx
38E0: 01 00 04    ld   bc,$0400
38E3: 36 00       ld   (hl),$00
38E5: 23          inc  hl
38E6: 0D          dec  c
38E7: 20 FA       jr   nz,$38E3
38E9: 10 F8       djnz $38E3
38EB: 31 00 84    ld   sp,$8400
38EE: 21 E0 89    ld   hl,$89E0
38F1: 11 00 80    ld   de,$8000
38F4: 01 20 00    ld   bc,$0020
38F7: ED B0       ldir
38F9: 21 00 84    ld   hl,$8400
38FC: CD E3 3D    call $3DE3
38FF: 21 00 88    ld   hl,$8800
3902: CD E3 3D    call $3DE3
3905: 21 00 90    ld   hl,$9000
3908: CD E3 3D    call $3DE3
390B: 21 00 98    ld   hl,$9800
390E: CD E3 3D    call $3DE3
3911: 21 00 80    ld   hl,$8000
3914: 11 E0 89    ld   de,$89E0
3917: 01 20 00    ld   bc,$0020
391A: ED B0       ldir
391C: 31 00 9A    ld   sp,$9A00
391F: 32 30 68    ld   (watchdog_6830),a
3922: 21 00 88    ld   hl,$8800
3925: 22 02 89    ld   ($8902),hl
3928: 22 00 89    ld   ($8900),hl
392B: CD 3B 3E    call $3E3B
392E: 21 95 3E    ld   hl,$3E95
3931: CD F3 36    call $36F3
3934: AF          xor  a
3935: 32 00 8A    ld   ($8A00),a
3938: 32 01 8A    ld   ($8A01),a
393B: 3C          inc  a
393C: 32 9A 87    ld   ($879A),a
393F: 32 22 68    ld   ($6822),a
3942: 32 25 68    ld   ($6825),a
3945: 32 26 68    ld   ($6826),a
3948: 32 27 68    ld   ($6827),a
394B: 32 23 68    ld   ($6823),a
394E: 11 FC 3F    ld   de,$3FFC
3951: 21 00 00    ld   hl,$0000
3954: 01 00 10    ld   bc,$1000
3957: AF          xor  a
3958: 86          add  a,(hl)
3959: 32 30 68    ld   (watchdog_6830),a
395C: 23          inc  hl
395D: 0D          dec  c
395E: 20 F8       jr   nz,$3958
3960: 10 F6       djnz $3958
3962: EB          ex   de,hl
3963: BE          cp   (hl)
3964: C2 65 3E    jp   nz,$3E65
3967: 06 10       ld   b,$10
3969: EB          ex   de,hl
396A: 13          inc  de
396B: 7C          ld   a,h
396C: FE 40       cp   $40
396E: 20 E7       jr   nz,$3957
3970: 32 30 68    ld   (watchdog_6830),a
3973: 3A 00 8A    ld   a,($8A00)
3976: A7          and  a
3977: 28 FA       jr   z,$3973
3979: 3C          inc  a
397A: C2 6A 3E    jp   nz,$3E6A
397D: 32 30 68    ld   (watchdog_6830),a
3980: 3A 01 8A    ld   a,($8A01)
3983: A7          and  a
3984: 28 FA       jr   z,$3980
3986: 3C          inc  a
3987: C2 6A 3E    jp   nz,$3E6A
398A: 21 9F 3E    ld   hl,$3E9F
398D: CD F3 36    call $36F3
3990: AF          xor  a
3991: 32 00 8A    ld   ($8A00),a
3994: 32 01 8A    ld   ($8A01),a
3997: 06 10       ld   b,$10
3999: 32 30 68    ld   (watchdog_6830),a
399C: 0D          dec  c
399D: 20 FA       jr   nz,$3999
399F: 10 F8       djnz $3999
39A1: 21 E5 3F    ld   hl,$3FE5
39A4: 11 00 70    ld   de,$7000
39A7: 01 03 00    ld   bc,$0003
39AA: D9          exx
39AB: 3E A1       ld   a,$A1
39AD: 32 00 71    ld   ($7100),a
39B0: 3A 00 71    ld   a,($7100)
39B3: FE 10       cp   $10
39B5: 20 F9       jr   nz,$39B0
39B7: 21 EC 3F    ld   hl,$3FEC
39BA: 11 18 8A    ld   de,$8A18
39BD: 01 09 00    ld   bc,$0009
39C0: ED B0       ldir
39C2: ED 56       im   1
39C4: AF          xor  a
39C5: 32 20 68    ld   ($6820),a
39C8: 3C          inc  a
39C9: 32 20 68    ld   ($6820),a
39CC: FB          ei
39CD: 3A 23 84    ld   a,($8423)
39D0: C6 04       add  a,$04
39D2: 4F          ld   c,a
39D3: 3A 23 84    ld   a,($8423)
39D6: B9          cp   c
39D7: 20 FA       jr   nz,$39D3
39D9: 3E 04       ld   a,$04
39DB: 32 3D 9B    ld   ($9B3D),a
39DE: 3A 3D 9B    ld   a,($9B3D)
39E1: A7          and  a
39E2: 20 FA       jr   nz,$39DE
39E4: 3A 23 84    ld   a,($8423)
39E7: 4F          ld   c,a
39E8: 3A 23 84    ld   a,($8423)
39EB: B9          cp   c
39EC: 28 FA       jr   z,$39E8
39EE: CD B8 3A    call $3AB8
39F1: CD 85 3A    call $3A85
39F4: CD F1 3A    call $3AF1
39F7: CD 4A 3B    call $3B4A
39FA: CD C0 3B    call $3BC0
39FD: CD DE 3B    call $3BDE
3A00: CD EC 3B    call $3BEC
3A03: CD FC 3B    call $3BFC
3A06: CD 47 3C    call $3C47
3A09: CD B3 3C    call $3CB3
3A0C: 3A A7 85    ld   a,($85A7)
3A0F: 87          add  a,a
3A10: 30 D2       jr   nc,$39E4
3A12: CD 85 3E    call $3E85
3A15: 3A 23 84    ld   a,($8423)
3A18: C6 64       add  a,$64
3A1A: 4F          ld   c,a
3A1B: 3A 23 84    ld   a,($8423)
3A1E: B9          cp   c
3A1F: 20 FA       jr   nz,$3A1B
3A21: 3A A7 85    ld   a,($85A7)
3A24: 87          add  a,a
3A25: 30 FA       jr   nc,$3A21
3A27: 3E 01       ld   a,$01
3A29: 32 3D 9B    ld   ($9B3D),a
3A2C: 3A 3D 9B    ld   a,($9B3D)
3A2F: A7          and  a
3A30: 20 FA       jr   nz,$3A2C
3A32: F3          di
3A33: 32 30 68    ld   (watchdog_6830),a
3A36: 3A 00 71    ld   a,($7100)
3A39: FE 10       cp   $10
3A3B: 20 F6       jr   nz,$3A33
3A3D: 01 00 08    ld   bc,$0800
3A40: 32 30 68    ld   (watchdog_6830),a
3A43: 0D          dec  c
3A44: 20 FA       jr   nz,$3A40
3A46: 10 F8       djnz $3A40
3A48: 21 18 8A    ld   hl,$8A18
3A4B: 11 00 70    ld   de,$7000
3A4E: 01 09 00    ld   bc,$0009
3A51: D9          exx
3A52: AF          xor  a
3A53: 32 00 70    ld   ($7000),a
3A56: 3E C1       ld   a,$C1
3A58: 32 00 71    ld   ($7100),a
3A5B: 3A 00 71    ld   a,($7100)
3A5E: FE 10       cp   $10
3A60: 20 F9       jr   nz,$3A5B
3A62: 21 00 70    ld   hl,$7000
3A65: 11 10 8A    ld   de,$8A10
3A68: 01 03 00    ld   bc,$0003
3A6B: D9          exx
3A6C: 3E B1       ld   a,$B1
3A6E: 32 00 71    ld   ($7100),a
3A71: 3A 00 71    ld   a,($7100)
3A74: FE 10       cp   $10
3A76: 20 F9       jr   nz,$3A71
3A78: 3A 10 8A    ld   a,($8A10)
3A7B: A7          and  a
3A7C: 20 CA       jr   nz,$3A48
3A7E: FE A0       cp   $A0
3A80: 20 00       jr   nz,$3A82
3A82: C3 1C 01    jp   $011C
3A85: 21 CE 87    ld   hl,$87CE
3A88: 11 8A 89    ld   de,$898A
3A8B: 7E          ld   a,(hl)
3A8C: 17          rla
3A8D: E6 0E       and  $0E
3A8F: 12          ld   (de),a
3A90: 13          inc  de
3A91: 7E          ld   a,(hl)
3A92: 1F          rra
3A93: 1F          rra
3A94: E6 0E       and  $0E
3A96: 12          ld   (de),a
3A97: 7E          ld   a,(hl)
3A98: 13          inc  de
3A99: 07          rlca
3A9A: 07          rlca
3A9B: 3C          inc  a
3A9C: E6 03       and  $03
3A9E: 12          ld   (de),a
3A9F: 23          inc  hl
3AA0: 13          inc  de
3AA1: 4E          ld   c,(hl)
3AA2: CB 19       rr   c
3AA4: 8F          adc  a,a
3AA5: CB 19       rr   c
3AA7: 8F          adc  a,a
3AA8: E6 03       and  $03
3AAA: 12          ld   (de),a
3AAB: 7E          ld   a,(hl)
3AAC: 13          inc  de
3AAD: E6 04       and  $04
3AAF: 12          ld   (de),a
3AB0: 7E          ld   a,(hl)
3AB1: 07          rlca
3AB2: 07          rlca
3AB3: E6 03       and  $03
3AB5: 13          inc  de
3AB6: 12          ld   (de),a
3AB7: C9          ret
3AB8: 21 8A 3F    ld   hl,$3F8A
3ABB: 3A CF 89    ld   a,($89CF)
3ABE: A7          and  a
3ABF: C4 F3 36    call nz,$36F3
3AC2: 21 D9 89    ld   hl,$89D9
3AC5: 11 D8 89    ld   de,$89D8
3AC8: 01 07 00    ld   bc,$0007
3ACB: ED B0       ldir
3ACD: 3A A8 85    ld   a,($85A8)
3AD0: 06 02       ld   b,$02
3AD2: 5A          ld   e,d
3AD3: 2B          dec  hl
3AD4: 77          ld   (hl),a
3AD5: 2B          dec  hl
3AD6: B6          or   (hl)
3AD7: 2B          dec  hl
3AD8: 2F          cpl
3AD9: A6          and  (hl)
3ADA: 2B          dec  hl
3ADB: A6          and  (hl)
3ADC: 77          ld   (hl),a
3ADD: 57          ld   d,a
3ADE: 3A A7 85    ld   a,($85A7)
3AE1: 10 EF       djnz $3AD2
3AE3: EB          ex   de,hl
3AE4: 29          add  hl,hl
3AE5: 06 0F       ld   b,$0F
3AE7: 29          add  hl,hl
3AE8: 38 02       jr   c,$3AEC
3AEA: 10 FB       djnz $3AE7
3AEC: 78          ld   a,b
3AED: 32 88 89    ld   ($8988),a
3AF0: C9          ret
3AF1: 3A 8F 89    ld   a,($898F)
3AF4: 21 9C 3F    ld   hl,$3F9C
3AF7: CF          rst  $08
3AF8: E5          push hl
3AF9: 21 BF 3E    ld   hl,$3EBF
3AFC: CD F3 36    call $36F3
3AFF: CD F3 36    call $36F3
3B02: CD F3 36    call $36F3
3B05: CD F3 36    call $36F3
3B08: D1          pop  de
3B09: 21 48 83    ld   hl,$8348
3B0C: 01 1A 8A    ld   bc,$8A1A
3B0F: CD 20 3B    call $3B20
3B12: 3A 8A 89    ld   a,($898A)
3B15: 21 A4 3F    ld   hl,$3FA4
3B18: D7          rst  $10
3B19: EB          ex   de,hl
3B1A: 21 4A 83    ld   hl,$834A
3B1D: 01 1C 8A    ld   bc,$8A1C
3B20: 1A          ld   a,(de)
3B21: 77          ld   (hl),a
3B22: 02          ld   (bc),a
3B23: 03          inc  bc
3B24: C5          push bc
3B25: D6 11       sub  $11
3B27: 3E 2C       ld   a,$2C
3B29: 20 02       jr   nz,$3B2D
3B2B: 3E 37       ld   a,$37
3B2D: 01 40 FF    ld   bc,$FF40
3B30: 09          add  hl,bc
3B31: 77          ld   (hl),a
3B32: 3E 37       ld   a,$37
3B34: 01 E0 FF    ld   bc,$FFE0
3B37: 09          add  hl,bc
3B38: 77          ld   (hl),a
3B39: 13          inc  de
3B3A: 1A          ld   a,(de)
3B3B: 09          add  hl,bc
3B3C: 77          ld   (hl),a
3B3D: C1          pop  bc
3B3E: 02          ld   (bc),a
3B3F: D6 11       sub  $11
3B41: 3E 2C       ld   a,$2C
3B43: 20 02       jr   nz,$3B47
3B45: 3E 37       ld   a,$37
3B47: 25          dec  h
3B48: 77          ld   (hl),a
3B49: C9          ret
3B4A: 3A 8B 89    ld   a,($898B)
3B4D: A7          and  a
3B4E: 20 0F       jr   nz,$3B5F
3B50: 21 FF FF    ld   hl,$FFFF
3B53: 22 D0 89    ld   ($89D0),hl
3B56: 21 6F 3F    ld   hl,$3F6F
3B59: CD F3 36    call $36F3
3B5C: C3 AC 3B    jp   $3BAC
3B5F: 21 B2 3F    ld   hl,$3FB2
3B62: 4F          ld   c,a
3B63: 3A 8C 89    ld   a,($898C)
3B66: A7          and  a
3B67: 20 03       jr   nz,$3B6C
3B69: 21 C0 3F    ld   hl,$3FC0
3B6C: 06 00       ld   b,$00
3B6E: 09          add  hl,bc
3B6F: E5          push hl
3B70: 21 E7 3E    ld   hl,$3EE7
3B73: CD F3 36    call $36F3
3B76: CD F3 36    call $36F3
3B79: E1          pop  hl
3B7A: 7E          ld   a,(hl)
3B7B: 32 92 81    ld   ($8192),a
3B7E: 32 D0 89    ld   ($89D0),a
3B81: 23          inc  hl
3B82: 7E          ld   a,(hl)
3B83: 32 D1 89    ld   ($89D1),a
3B86: FE FF       cp   $FF
3B88: 28 22       jr   z,$3BAC
3B8A: F5          push af
3B8B: E6 1F       and  $1F
3B8D: 32 94 81    ld   ($8194),a
3B90: 21 04 3F    ld   hl,$3F04
3B93: CD F3 36    call $36F3
3B96: CD F3 36    call $36F3
3B99: F1          pop  af
3B9A: CB 7F       bit  7,a
3B9C: 28 14       jr   z,$3BB2
3B9E: E6 1F       and  $1F
3BA0: 32 96 81    ld   ($8196),a
3BA3: 21 21 3F    ld   hl,$3F21
3BA6: CD F3 36    call $36F3
3BA9: C3 F3 36    jp   $36F3
3BAC: 21 54 83    ld   hl,$8354
3BAF: CD B5 3B    call $3BB5
3BB2: 21 56 83    ld   hl,$8356
3BB5: 11 E0 FF    ld   de,$FFE0
3BB8: 06 18       ld   b,$18
3BBA: 36 37       ld   (hl),$37
3BBC: 19          add  hl,de
3BBD: 10 FB       djnz $3BBA
3BBF: C9          ret
3BC0: 3A 8C 89    ld   a,($898C)
3BC3: A7          and  a
3BC4: 20 02       jr   nz,$3BC8
3BC6: 3E 05       ld   a,$05
3BC8: C6 10       add  a,$10
3BCA: 32 6C 82    ld   ($826C),a
3BCD: D6 11       sub  $11
3BCF: 3E 37       ld   a,$37
3BD1: 20 02       jr   nz,$3BD5
3BD3: 3E 37       ld   a,$37
3BD5: 32 4C 82    ld   ($824C),a
3BD8: 21 3E 3F    ld   hl,$3F3E
3BDB: C3 F3 36    jp   $36F3
3BDE: 3A 8D 89    ld   a,($898D)
3BE1: C6 1A       add  a,$1A
3BE3: 32 AE 82    ld   ($82AE),a
3BE6: 21 48 3F    ld   hl,$3F48
3BE9: C3 F3 36    jp   $36F3
3BEC: 3A 8E 89    ld   a,($898E)
3BEF: 21 50 3F    ld   hl,$3F50
3BF2: A7          and  a
3BF3: CA F3 36    jp   z,$36F3
3BF6: 21 5B 3F    ld   hl,$3F5B
3BF9: C3 F3 36    jp   $36F3
3BFC: 3A 89 89    ld   a,($8989)
3BFF: 0E 00       ld   c,$00
3C01: FE 0A       cp   $0A
3C03: 38 05       jr   c,$3C0A
3C05: D6 0A       sub  $0A
3C07: 0C          inc  c
3C08: 18 F7       jr   $3C01
3C0A: C6 10       add  a,$10
3C0C: 32 70 82    ld   ($8270),a
3C0F: 79          ld   a,c
3C10: C6 10       add  a,$10
3C12: 32 90 82    ld   ($8290),a
3C15: 21 01 84    ld   hl,$8401
3C18: CB EE       set  5,(hl)
3C1A: 3A 88 89    ld   a,($8988)
3C1D: A7          and  a
3C1E: C4 27 3C    call nz,$3C27
3C21: 21 66 3F    ld   hl,$3F66
3C24: C3 F3 36    jp   $36F3
3C27: 3A 89 89    ld   a,($8989)
3C2A: 3C          inc  a
3C2B: FE 15       cp   $15
3C2D: 38 01       jr   c,$3C30
3C2F: AF          xor  a
3C30: 32 89 89    ld   ($8989),a
3C33: 21 80 9A    ld   hl,$9A80
3C36: 06 2C       ld   b,$2C
3C38: 36 00       ld   (hl),$00
3C3A: 23          inc  hl
3C3B: 10 FB       djnz $3C38
3C3D: 21 80 9A    ld   hl,$9A80
3C40: 4F          ld   c,a
3C41: 06 00       ld   b,$00
3C43: 09          add  hl,bc
3C44: 36 01       ld   (hl),$01
3C46: C9          ret
3C47: 2A 91 89    ld   hl,($8991)
3C4A: 7C          ld   a,h
3C4B: B5          or   l
3C4C: 28 05       jr   z,$3C53
3C4E: 2B          dec  hl
3C4F: 22 91 89    ld   ($8991),hl
3C52: C9          ret
3C53: 3A 88 89    ld   a,($8988)
3C56: FE 0F       cp   $0F
3C58: 28 0C       jr   z,$3C66
3C5A: 21 5A 83    ld   hl,$835A
3C5D: C3 B5 3B    jp   $3BB5
3C60: 3E 03       ld   a,$03
3C62: 32 3D 9B    ld   ($9B3D),a
3C65: C9          ret
3C66: 3A A7 85    ld   a,($85A7)
3C69: E6 01       and  $01
3C6B: 28 F3       jr   z,$3C60
3C6D: 21 B0 04    ld   hl,$04B0
3C70: 22 91 89    ld   ($8991),hl
3C73: 21 E0 89    ld   hl,$89E0
3C76: 11 5A 83    ld   de,$835A
3C79: 01 02 01    ld   bc,$0102
3C7C: CD 8B 3C    call $3C8B
3C7F: 06 03       ld   b,$03
3C81: CD 8B 3C    call $3C8B
3C84: 06 02       ld   b,$02
3C86: CD 8B 3C    call $3C8B
3C89: 06 01       ld   b,$01
3C8B: 7E          ld   a,(hl)
3C8C: CD A0 3C    call $3CA0
3C8F: 23          inc  hl
3C90: CD 97 3C    call $3C97
3C93: 23          inc  hl
3C94: 10 FA       djnz $3C90
3C96: C9          ret
3C97: 7E          ld   a,(hl)
3C98: 1F          rra
3C99: 1F          rra
3C9A: 1F          rra
3C9B: 1F          rra
3C9C: CD A0 3C    call $3CA0
3C9F: 7E          ld   a,(hl)
3CA0: E6 0F       and  $0F
3CA2: 2F          cpl
3CA3: C6 1A       add  a,$1A
3CA5: 12          ld   (de),a
3CA6: CD E9 36    call $36E9
3CA9: 0D          dec  c
3CAA: C0          ret  nz
3CAB: 0E 04       ld   c,$04
3CAD: 3E 35       ld   a,$35
3CAF: 12          ld   (de),a
3CB0: C3 E9 36    jp   $36E9
3CB3: 3A A7 85    ld   a,($85A7)
3CB6: E6 03       and  $03
3CB8: 28 02       jr   z,$3CBC
3CBA: 3E 01       ld   a,$01
3CBC: 3C          inc  a
3CBD: 32 07 A0    ld   ($A007),a
3CC0: 3A A7 85    ld   a,($85A7)
3CC3: E6 01       and  $01
3CC5: 28 05       jr   z,$3CCC
3CC7: AF          xor  a
3CC8: 32 90 89    ld   ($8990),a
3CCB: C9          ret
3CCC: 3A 88 89    ld   a,($8988)
3CCF: 3D          dec  a
3CD0: FE 04       cp   $04
3CD2: D0          ret  nc
3CD3: 3C          inc  a
3CD4: 4F          ld   c,a
3CD5: 3A 90 89    ld   a,($8990)
3CD8: 5F          ld   e,a
3CD9: 3C          inc  a
3CDA: 32 90 89    ld   ($8990),a
3CDD: 16 00       ld   d,$00
3CDF: 21 D0 3F    ld   hl,$3FD0
3CE2: 19          add  hl,de
3CE3: 7E          ld   a,(hl)
3CE4: 3C          inc  a
3CE5: 28 07       jr   z,$3CEE
3CE7: B9          cp   c
3CE8: C8          ret  z
3CE9: AF          xor  a
3CEA: 32 90 89    ld   ($8990),a
3CED: C9          ret
3CEE: CD 3B 3E    call $3E3B
3CF1: 11 24 3D    ld   de,$3D24
3CF4: 21 42 80    ld   hl,$8042
3CF7: 06 1C       ld   b,$1C
3CF9: CD 07 3D    call $3D07
3CFC: 10 FB       djnz $3CF9
3CFE: 3A A7 85    ld   a,($85A7)
3D01: 87          add  a,a
3D02: 30 FA       jr   nc,$3CFE
3D04: C3 12 3A    jp   $3A12
3D07: CD 15 3D    call $3D15
3D0A: CD 15 3D    call $3D15
3D0D: CD 15 3D    call $3D15
3D10: 3E 05       ld   a,$05
3D12: C3 10 00    jp   $0010
3D15: 1A          ld   a,(de)
3D16: 0E 08       ld   c,$08
3D18: 87          add  a,a
3D19: 30 02       jr   nc,$3D1D
3D1B: 36 18       ld   (hl),$18
3D1D: 23          inc  hl
3D1E: 0D          dec  c
3D1F: 20 F7       jr   nz,$3D18
3D21: 13          inc  de
3D22: 23          inc  hl
3D23: C9          ret

3D78: E6 0F       and  $0F
3D7A: 1E 21       ld   e,$21
3D7C: 28 02       jr   z,$3D80
3D7E: 1E 25       ld   e,$25
3D80: 7C          ld   a,h
3D81: 1F          rra
3D82: 1F          rra
3D83: E6 07       and  $07
3D85: FE 03       cp   $03
3D87: 38 06       jr   c,$3D8F
3D89: 3D          dec  a
3D8A: FE 03       cp   $03
3D8C: 28 01       jr   z,$3D8F
3D8E: 3D          dec  a
3D8F: 21 00 80    ld   hl,$8000
3D92: 01 00 04    ld   bc,$0400
3D95: 36 37       ld   (hl),$37
3D97: 32 30 68    ld   (watchdog_6830),a
3D9A: 23          inc  hl
3D9B: 0D          dec  c
3D9C: 20 F7       jr   nz,$3D95
3D9E: 10 F5       djnz $3D95
3DA0: 21 80 8B    ld   hl,$8B80
3DA3: 01 80 00    ld   bc,$0080
3DA6: 36 00       ld   (hl),$00
3DA8: 23          inc  hl
3DA9: 10 FB       djnz $3DA6
3DAB: 21 80 93    ld   hl,$9380
3DAE: 01 80 00    ld   bc,$0080
3DB1: 36 00       ld   (hl),$00
3DB3: 23          inc  hl
3DB4: 10 FB       djnz $3DB1
3DB6: 21 80 9B    ld   hl,$9B80
3DB9: 01 80 00    ld   bc,$0080
3DBC: 36 00       ld   (hl),$00
3DBE: 23          inc  hl
3DBF: 10 FB       djnz $3DBC
3DC1: C6 10       add  a,$10
3DC3: 32 C2 82    ld   ($82C2),a
3DC6: 7B          ld   a,e
3DC7: 32 A2 82    ld   ($82A2),a
3DCA: 3E 2B       ld   a,$2B
3DCC: 32 42 83    ld   ($8342),a
3DCF: 3E 1A       ld   a,$1A
3DD1: 32 22 83    ld   ($8322),a
3DD4: 3E 26       ld   a,$26
3DD6: 32 02 83    ld   ($8302),a
3DD9: 3E 01       ld   a,$01
3DDB: 32 03 A0    ld   ($A003),a
3DDE: 32 30 68    ld   (watchdog_6830),a
3DE1: 18 FE       jr   $3DE1
3DE3: D9          exx
3DE4: 06 10       ld   b,$10
3DE6: D9          exx
3DE7: 01 00 04    ld   bc,$0400
3DEA: 54          ld   d,h
3DEB: 5D          ld   e,l
3DEC: D9          exx
3DED: 54          ld   d,h
3DEE: 5D          ld   e,l
3DEF: D9          exx
3DF0: D9          exx
3DF1: 7C          ld   a,h
3DF2: AD          xor  l
3DF3: 2F          cpl
3DF4: 87          add  a,a
3DF5: 87          add  a,a
3DF6: ED 6A       adc  hl,hl
3DF8: 7D          ld   a,l
3DF9: D9          exx
3DFA: 77          ld   (hl),a
3DFB: 23          inc  hl
3DFC: 32 30 68    ld   (watchdog_6830),a
3DFF: 0D          dec  c
3E00: 20 EE       jr   nz,$3DF0
3E02: 10 EC       djnz $3DF0
3E04: 06 04       ld   b,$04
3E06: 62          ld   h,d
3E07: 6B          ld   l,e
3E08: D9          exx
3E09: EB          ex   de,hl
3E0A: D9          exx
3E0B: D9          exx
3E0C: 7D          ld   a,l
3E0D: AC          xor  h
3E0E: 2F          cpl
3E0F: 87          add  a,a
3E10: 87          add  a,a
3E11: ED 6A       adc  hl,hl
3E13: 7D          ld   a,l
3E14: D9          exx
3E15: AE          xor  (hl)
3E16: C2 78 3D    jp   nz,$3D78
3E19: 23          inc  hl
3E1A: 32 30 68    ld   (watchdog_6830),a
3E1D: 0D          dec  c
3E1E: 20 EB       jr   nz,$3E0B
3E20: 10 E9       djnz $3E0B
3E22: EB          ex   de,hl
3E23: D9          exx
3E24: 10 C0       djnz $3DE6
3E26: D9          exx
3E27: 01 00 04    ld   bc,$0400
3E2A: 36 00       ld   (hl),$00
3E2C: 23          inc  hl
3E2D: 0D          dec  c
3E2E: 20 FA       jr   nz,$3E2A
3E30: 10 F8       djnz $3E2A
3E32: C9          ret
3E33: 21 40 80    ld   hl,$8040
3E36: 01 C0 04    ld   bc,$04C0
3E39: 18 06       jr   $3E41
3E3B: 21 00 80    ld   hl,$8000
3E3E: 01 00 04    ld   bc,$0400
3E41: 36 37       ld   (hl),$37
3E43: 23          inc  hl
3E44: 0D          dec  c
3E45: 20 FA       jr   nz,$3E41
3E47: 10 F8       djnz $3E41
3E49: 3E 01       ld   a,$01
3E4B: 32 03 A0    ld   ($A003),a
3E4E: 21 80 8B    ld   hl,$8B80
3E51: CD 5D 3E    call $3E5D
3E54: 21 80 93    ld   hl,$9380
3E57: CD 5D 3E    call $3E5D
3E5A: 21 80 9B    ld   hl,$9B80
3E5D: 06 80       ld   b,$80
3E5F: AF          xor  a
3E60: 77          ld   (hl),a
3E61: 23          inc  hl
3E62: 10 FC       djnz $3E60
3E64: C9          ret
3E65: 7A          ld   a,d
3E66: 1F          rra
3E67: 1F          rra
3E68: 1F          rra
3E69: 1F          rra
3E6A: E6 0F       and  $0F
3E6C: F6 10       or   $10
3E6E: 32 C4 82    ld   ($82C4),a
3E71: 3E 2B       ld   a,$2B
3E73: 32 44 83    ld   ($8344),a
3E76: 3E 28       ld   a,$28
3E78: 32 24 83    ld   ($8324),a
3E7B: 3E 26       ld   a,$26
3E7D: 32 04 83    ld   ($8304),a
3E80: 32 30 68    ld   (watchdog_6830),a
3E83: 18 FB       jr   $3E80
3E85: CD 3B 3E    call $3E3B
3E88: 21 00 A0    ld   hl,$A000
3E8B: 36 01       ld   (hl),$01
3E8D: 06 03       ld   b,$03
3E8F: 23          inc  hl
3E90: 36 00       ld   (hl),$00
3E92: 10 FB       djnz $3E8F
3E94: C9          ret
