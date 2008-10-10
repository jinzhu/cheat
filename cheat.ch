= cheat: |
  Hi, welcome to cheat (http://cheat.errtheblog.com).
  Thanks for trying it out.  
  
  Here are a few commands to get you started.
  
== Installation:
  $ gem install cheat
  
== Recently added cheat sheets:
  $ cheat recent
  
== All cheat sheets:
  $ cheat sheets
  
== The `strftime' cheat sheet:
  $ cheat strftime
  
== View a cheat sheet in TextMate:
  $ cheat strftime | mate
  
== Less or more, for scrolly terminal:
  $ cheat strftime | less
  $ cheat strftime | more
  
  Print a cheat sheet
  $ cheat strftime | lpr
  
  To edit a cheat sheet, use the --edit switch.
  $ cheat markaby --edit
  
  To add a cheat sheet, use the --add switch.
  $ cheat readme --add
  
== To use a different editor (such as TextMate) for --edit and --add, set the VISUAL (or EDITOR) environment variable:
  $ export VISUAL='mate -w'
  
  To see versions of a sheet, use the --versions switch.
  $ cheat rspec --versions
  
  To see a diff to the current version, use the --diff switch.
  $ cheat rspec --diff 5
  
  To see a diff between two versions, use the start:end format.
  $ cheat rspec --diff 5:7
  
  Sheets are cached locally in ~/.cheat.  To clear your cache, pass --new to cheat.  You won't get updates unless you do this.
  $ cheat --new
  $ cheat strftime --new
  
  And to get all cached locally, you could do
  $ cheat sheets | grep '^  ' | xargs -n 1 cheat
  
  That's it!

