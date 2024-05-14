CURRENT-WINDOW:HEIGHT = 30.
CURRENT-WINDOW:WIDTH = 200.

/* how much of the TYPE I Storage Area is used up by allocated blocks (HWM)? 
What is the true size of the Database? 
?How fast is my database growing? iow: What is the real occupation? */

define variable v-prcnt_full as decimal format ">>9.99" label "% Full" no-undo.
define variable v-empty_blocks as decimal format ">>,>>>,>>9" label "Empty" no-undo.
define variable v-hiwater as decimal format ">>,>>>,>>9" label "Hiwater" no-undo.
define variable v-mb_used as decimal format ">>>,>>9.99" label "MB Used" no-undo.
define variable v-mb_avail as decimal format ">>>,>>9.99" label "MB Avail" no-undo.
define variable v-mb_tused as decimal format ">>>,>>9.99" label "Total MB used" initial 0.0 no-undo.
define variable v-mb_tavail as decimal format ">>>,>>9.99" label "Total MB avail" initial 0.0 no-undo.

/* output to sa.xml. */

FOR EACH _Area NO-LOCK:
 FIND _Areastatus WHERE _Areastatus-Areanum = _Area._Area-number NO-LOCK.

 v-hiwater = _AreaStatus-Hiwater.
 if v-hiwater = ? then v-hiwater = 0.0.

 v-empty_blocks = _AreaStatus-Totblocks - v-hiwater - _AreaStatus-Extents.

 v-prcnt_full = (1.0 - (v-empty_blocks / _AreaStatus-Totblocks)) * 100.0.
 
 v-mb_avail = v-empty_blocks / 1048576 * _Area-BlockSize.
 v-mb_tavail = v-mb_tavail + v-mb_avail.
     
 v-mb_used = v-hiwater / 1048576 * _Area-BlockSize.
 v-mb_tused = v-mb_tused + v-mb_used.

 DISPLAY
   _Area-name LABEL 'Name' format "x(21)"
     _Area-blocksize LABEL 'DBBlockSize'
  _AreaStatus-Extents LABEL '#Extents' format ">>9" 
  _AreaStatus-Lastextent LABEL "HWM extent" 
  v-hiwater
  v-empty_blocks
  _AreaStatus-Totblocks - _AreaStatus-Extents LABEL 'T.Blocks' FORMAT ">>,>>>,>>9"
  v-prcnt_full SKIP
  v-mb_used
  v-mb_avail WITH WIDTH 200.

END.

display v-mb_tused
    v-mb_tavail.
