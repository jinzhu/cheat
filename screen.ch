= screen: |-
  =TO START SCREEN=
  $ screen
  $ screen -ls: to list running sessions
  
  From: http://www.amitu.com/blog/2004/12/screen-howto.html
== To connect to an already open session running in background, use "screen" with following options:
     * -D -R  Attach here and now. In detail this means: If a session is running, then reattach. If necessary detach and logout remotely first. If it was not running create it and notify the user. This is the author's favorite.
     * -r     Reattach to existing
     * -d -r  Reattach a session and if necessary detach it first.
     * -d -R  Reattach a session and if necessary detach or even create it first.
     * -d -RR Reattach a session and if necessary detach or create it. Use the first session if more than one session is available.
     * -D -r  Reattach a session. If necessary detach and logout remotely first.
     * -D -RR Attach here and now. Whatever that means, just do it.
  
  ----
  =SCREEN COMMANDS (run within screen):=
  All commands called from the "meta key": C-a (ctrl+a).  Note: Case-sensitive.
  Note: For 'old' ctrl-a, use C-a-a
  
  C-a h, C-a ?: Help
  C-a c: Create new window/terminal
  C-a k: Kill window session
  C-a d: Detaches from the window
  C-a DD: Detaches from the window AND the ssh shell if you are in one.
  
== To select a window:
  C-a " (quote): List windows: (select one and press enter)
  C-a <digit> (the number of the screen)
  C-a n,  C-a p: Next/Previous screen
  
== Split screens:
  C-a S: Split (then use C-tab, C-<num>)
  C-a tab: Move between splits
  C-a Q: Un-Split
  
== After creating a new window it is useful to name it:
    C-a A and enter a name.
  
== To create a named window directly:
    C-a :, and type screen <command>.
  
== Copy mode so you can scroll up and down.:
    C-a ESC
  
== Monitoring:
  C-a M: Toggles alert on activity
  C-a _ (underscore): Toggles monitor for silence
  C-a " (quote): Jump to alerting window
  
  ----
  ==Sample ~/.screenrc==
  hardstatus alwayslastline
  ##what is displayed
  hardstatus string '%{= kG}[ %{G}%H %{g}][%= %{=kw}%?%-Lw%?%{r}(%{W}%n*%f%t%?(%u)%?%{r})%{w}%?%+Lw%?%?%= %{g}]'
  ## Default screens
  ## screen -t NameOfScreen ScreenNumber ShellCommand
  #screen -t shell1	0
  #screen -t shell2	1
  #screen -t server	2	ssh me@myserver
  
  ## change meta-key (ctrl-a)
  # escape ^gg
  ----
  =MULTI USER=
  See also: kibitz (http://www.redhatmagazine.com/2007/09/27/a-guide-to-gnu-screen/#comment-25029)
  
  From: http://www.linux.com/article.pl?sid=06/08/14/1945249
  
  Teacher: setuid root on /usr/bin/screen  (NOTE! security risk, running as root?)
  $ chmod u+s /usr/bin/screen
  
  Teacher: To reset screen permissions after session: setuid owner
  $ chmod u-s /usr/bin/screen
  
  Teacher: $ screen -S SessionName.
  
  Teacher: Ctrl-a :multiuser on
  
  Teacher: Ctrl-a :acladd student_login_id
  
  Student: $ ssh student@teacherComputer
  
  Student: screen -x username/session.
  
  ----
  =Serial Console Access:=
== OS X:
  
  screen /dev/tty.usb* <connection speed>
  
== Linux:
  
  screen /dev/ttyS[0-9] <connection speed>
  
  Typical values for connection speed are 9600 or 115200
  
  ----
  =Helpful sites:=
  
  General: http://www.rackaid.com/resources/tips/linux-screen.cfm
  
  Tutorial: 
  
  http://www.rackaid.com/resources/linux-tutorials/general-tutorials/linux-screen.cfm
  Multi-user: http://www.linux.com/article.pl?sid=06/08/14/1945249
  
  ----
