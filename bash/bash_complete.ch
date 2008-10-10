= bash_complete: |-
  A bash snippet to have auto-complete for
  the 'cheat' gem.
  
== Use by typing :
    $ cheat str<tab>
== and get:
    strftime       string         string_unpack
  
  -------- bash script --------
  function complete_cheat {
    COMPREPLY=()
    if [ $COMP_CWORD = 1 ]; then
      sheets=`cheat sheets | grep '^  '`
      COMPREPLY=(`compgen -W "$sheets" -- $2`)
    fi
  }
  complete -F complete_cheat cheat
