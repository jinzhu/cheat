= curl: |-
== Command line internet/network loader tool and ajax test tool.  Read the contents of a URL, dump the results to the stdout.  Basic USE:
  
  curl [options] [URL...]
  
  To see if a site is alive, just get the headers: curl --head www.yahoo.com
  
  A live response returns status, cookies, content length, etc.
  
  To send custom headers (anything you want!) use: curl --header "User-Agent: something-special" google.com
  
  To return the entire page: curl www.google.com
  
  The view the man page:  curl --manual | less
  
  To retrieve data with POST: curl -d "name=dpw" www.google.com
  
  Related programs: wget
