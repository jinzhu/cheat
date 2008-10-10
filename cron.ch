= cron: |-
== To edit the crontab of the current user:
  $ crontab -e
  
== To display the crontab of the current user:
  $ crontab -l 
  
== To remove the crontab of the current user:
  $ crontab -r
  
== Basic file format:
  
  *     *   *   *    *  command to be executed
  -     -    -    -    -
  |     |     |     |     |
  |     |     |     |     +----- day of week (0 - 6) (Sunday=0)
  |     |     |     +------- month (1 - 12)
  |     |     +--------- day of month (1 - 31)
  |     +----------- hour (0 - 23)
  +------------- min (0 - 59)
