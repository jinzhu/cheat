= xmonad: |-
  mod-shift-return      launch xterm
  mod-p 	              launch dmenu
  mod-space 	      cycle through available layout algorithms
  mod-c 	              kill a client window
  mod-j 	              move focus to the next window on the screen (also mod-tab)
  mod-k 	              move focus to the previous window
  mod-return 	      swap current window, with window in master pane
  mod-shift-j 	      swap current window with its next neighbour
  mod-shift-k 	      swap current window with its previous neighbour
  mod-h 	              shrink the size of the master pane
  mod-l 	              grow the size of the master pane
  mod-comma 	      move clients into the master pane
  mod-period 	      move clients out of the master pane
  mod-q 	              dynamically reload xmonad, with a new configuration
  mod-shift-q 	      quit xmonad
  mod-1 .. 9 	      move to workspace ("virtual desktop"/"window group") number 'n'
  mod-shift- 1 .. 9     move current client to workspace number 'n'
  mod- w,e,r            move to Xinerama screens 1, 2 or 3.
