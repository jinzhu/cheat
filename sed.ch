= sed: |-
== TEXT CONVERSION AND SUBSTITUTION:
  
   # IN UNIX ENVIRONMENT: convert DOS newlines (CR/LF) to Unix format
   sed 's/.$//'               # assumes that all lines end with CR/LF
   sed 's/^M$//'              # in bash/tcsh, press Ctrl-V then Ctrl-M
   sed 's/\x0D$//'            # gsed 3.02.80, but top script is easier
  
   # IN UNIX ENVIRONMENT: convert Unix newlines (LF) to DOS format
   sed "s/$/`echo -e \\\r`/"            # command line under ksh
   sed 's/$'"/`echo \\\r`/"             # command line under bash
   sed "s/$/`echo \\\r`/"               # command line under zsh
   sed 's/$/\r/'                        # gsed 3.02.80
  
   # IN DOS ENVIRONMENT: convert Unix newlines (LF) to DOS format
   sed "s/$//"                          # method 1
   sed -n p                             # method 2
  
   # IN DOS ENVIRONMENT: convert DOS newlines (CR/LF) to Unix format
   # Can only be done with UnxUtils sed, version 4.0.7 or higher.
   # Cannot be done with other DOS versions of sed. Use "tr" instead.
   sed "s/\r//" infile >outfile         # UnxUtils sed v4.0.7 or higher
   tr -d \r <infile >outfile            # GNU tr version 1.22 or higher
  
   # delete leading whitespace (spaces, tabs) from front of each line
   # aligns all text flush left
   sed 's/^[ \t]*//'                    # see note on '\t' at end of file
  
   # delete trailing whitespace (spaces, tabs) from end of each line
   sed 's/[ \t]*$//'                    # see note on '\t' at end of file
  
   # delete BOTH leading and trailing whitespace from each line
   sed 's/^[ \t]*//;s/[ \t]*$//'
  
   # insert 5 blank spaces at beginning of each line (make page offset)
   sed 's/^/     /'
  
   # align all text flush right on a 79-column width
   sed -e :a -e 's/^.\{1,78\}$/ &/;ta'  # set at 78 plus 1 space
  
   # center all text in the middle of 79-column width. In method 1,
   # spaces at the beginning of the line are significant, and trailing
   # spaces are appended at the end of the line. In method 2, spaces at
   # the beginning of the line are discarded in centering the line, and
   # no trailing spaces appear at the end of lines.
   sed  -e :a -e 's/^.\{1,77\}$/ & /;ta'                     # method 1
   sed  -e :a -e 's/^.\{1,77\}$/ &/;ta' -e 's/\( *\)\1/\1/'  # method 2
  
   # substitute (find and replace) "foo" with "bar" on each line
   sed 's/foo/bar/'             # replaces only 1st instance in a line
   sed 's/foo/bar/4'            # replaces only 4th instance in a line
   sed 's/foo/bar/g'            # replaces ALL instances in a line
   sed 's/\(.*\)foo\(.*foo\)/\1bar\2/' # replace the next-to-last case
   sed 's/\(.*\)foo/\1bar/'            # replace only the last case
  
   # substitute "foo" with "bar" ONLY for lines which contain "baz"
   sed '/baz/s/foo/bar/g'
  
   # substitute "foo" with "bar" EXCEPT for lines which contain "baz"
   sed '/baz/!s/foo/bar/g'
  
   # change "scarlet" or "ruby" or "puce" to "red"
   sed 's/scarlet/red/g;s/ruby/red/g;s/puce/red/g'   # most seds
   gsed 's/scarlet\|ruby\|puce/red/g'                # GNU sed only
  
   # reverse order of lines (emulates "tac")
   # bug/feature in HHsed v1.5 causes blank lines to be deleted
   sed '1!G;h;$!d'               # method 1
   sed -n '1!G;h;$p'             # method 2
  
   # reverse each character on the line (emulates "rev")
   sed '/\n/!G;s/\(.\)\(.*)/&\2\1/;//D;s/.//'
  
   # join pairs of lines side-by-side (like "paste")
   sed '$!N;s/\n/ /'
  
   # if a line ends with a backslash, append the next line to it
   sed -e :a -e '/\\$/N; s/\\\n//; ta'
  
   # if a line begins with an equal sign, append it to the previous line
   # and replace the "=" with a single space
   sed -e :a -e '$!N;s/\n=/ /;ta' -e 'P;D'
  
   # add commas to numeric strings, changing "1234567" to "1,234,567"
   gsed ':a;s/\B[0-9]\{3\}\>/,&/;ta'                     # GNU sed
   sed -e :a -e 's/\(.*[0-9]\)\([0-9]\{3\}\)/\1,\2/;ta'  # other seds
  
   # add commas to numbers with decimal points and minus signs (GNU sed)
   gsed ':a;s/\(^\|[^0-9.]\)\([0-9]\+\)\([0-9]\{3\}\)/\1\2,\3/g;ta'
  
   # add a blank line every 5 lines (after lines 5, 10, 15, 20, etc.)
   gsed '0~5G'                  # GNU sed only
   sed 'n;n;n;n;G;'             # other seds
