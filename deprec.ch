= deprec: |-
  Deprec is a collection of automated deployment,recipes written in ruby, for setting up production ready rails servers.
  
  Known to support: Ubuntu 6.06
  
  ALL commands are performed on the CLIENT.
  
== ##To Install (performed once):
  sudo gem install deprec -y                  # installs what you need
  echo "require 'deprec/recipes'" >> ~/.caprc # include deprec recipes
  cap show_tasks                              # should now include deprec tasks
  
  $ cap show_tasks		# now you have deprec tasks included
  
== ##To prepare your app:
  $ cd /path/to/railsapp
  $ deprec --apply-to . --name projectname --domain www.projectname.com
== # edit config/deploy.rb to put in details for:
  #  :name       - a short name for your application 
  #  :domain     - the domain name it will be served from
  #  :repository - your rails applications scm repository
  # edit config/deploy.rb to put in details of your subversion repository
  
== ##To update the server (run from client):
  $ cap install_rails_stack
  $ cap setup
  
  ##To update rails app on hosts
  $ cap deploy			
  #or
  $ cap deploy_with_migrations
  
  # then
  $ restart_apache
  
  # testing cheat editing - mike
  Derived from: http://deprec.rubyforge.org/
  More help: http://topfunky.com/clients/peepcode/free-episodes
