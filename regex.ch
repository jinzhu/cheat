= regex: |-
  /normal regex/iomx[neus]
  %r|alternate form|
  
== options:
  
  /i         case insensitive
  /o         only interpolate #{} blocks once
  /m         multiline mode - '.' will match newline
  /x         extended mode - whitespace is ignored
  /[neus]    encoding: none, EUC, UTF-8, SJIS, respectively
  
== regex characters:
  
  .          any character except newline
  [ ]        any single character of set
  [^ ]       any single character NOT of set
  *          0 or more previous regular expression
  *?         0 or more previous regular expression(non greedy)
  +          1 or more previous regular expression
  +?         1 or more previous regular expression(non greedy)
  ?          0 or 1 previous regular expression
  |          alternation
  ( )        grouping regular expressions
  ^          beginning of a line or string
  $          end of a line or string
  {m,n}      at least m but most n previous regular expression
  {m,n}?     at least m but most n previous regular expression(non greedy)
  \A         beginning of a string
  \b         backspace(0x08)(inside[]only)
  \B         non-word boundary
  \b         word boundary(outside[]only)
  \d         digit, same as[0-9]
  \D         non-digit
  \S         non-whitespace character
  \s         whitespace character[ \tr\f]
  \W         non-word character
  \w         word character[0-9A-Za-z_]
  \z         end of a string
  \Z         end of a string, or before newline at the end
  (?# )      comment
  (?: )      grouping without backreferences
  (?= )      zero-width positive look-ahead assertion
  (?! )      zero-width negative look-ahead assertion
  (?ix-ix)   turns on/off i/x options, localized in group if any.
  (?ix-ix: ) turns on/off i/x options, localized in non-capturing group.
  
  thanks to http://www.zenspider.com/Languages/Ruby/QuickRef.html#11
