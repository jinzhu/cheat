= capistrano: "http://www.dizzy.co.uk/cheatsheets
  This work is licensed under the Creative Commons
  Attribution-NonCommercial-NoDerivs 2.0 License. To
  view a copy of this license, visit
  http://creativecommons.org/licenses/by-nc-nd/2.0/uk
n\
  ########## Shell Commands ##########\t
== Installation:
  $ gem install capistrano

== Add your application to Capistrano (capify):
  $ capify .

  # NOTE: Rake access to capistrano is deprecated in Capistrano 1.3.
  #       Use the 'cap' command instead.

== Execute the setup task:
  $ cap deploy:setup

== Deploy your application:
  $ cap deploy

== Similar to deploy, but it runs the migrate task on the new release before updating the symlink:
  $ rake remote:deploy_with_migrations

== Rollback a release from production:
  $ rake rollback

== Execute the disable_web task:
  $ rake remote_exec ACTION=disable_web \\
  UNTIL=\"tomorrow morning\" \\
  REASON=\"vital upgrade\"

== Using the invoke task:
  $ rake remote_exec ACTION=invoke \\
  COMMAND=\"svn up /u/apps/flipper/current/app/views\" \\
  ROLES=app
n\
  ########## Standard Tasks ##########
== cleans up the releases directory, leaving the five most recent releases:
  $ cap cleanup 

  used when deploying an application for the first time. Starts the application\xE2\x80\x99s 
== spinner (via the spinner task) and then does a normal deploy:
  $ cap cold_deploy 

  updates all the code on your server (via update_code and symlink
  tasks), then restarts the FastCGI listeners on the application servers (via
== the restart task):
  $ cap deploy

  prints the difference between what was last deployed, and what is
== currently in your repository:
  $ cap diff_from_last_deploy

== puts up a static maintenance page that is displayed to visitors:
  $ cap disable_web

== removes the maintenance page:
  $ cap enable_web

== allows you to send commands directly:
  $ cap invoke

  changes to the directory of your current release (as indicated by the
== current symlink), and runs rake RAILS_ENV=production migrate:
  $ cap migrate

  restarts all FastCGI listeners for your application by calling the reaper
  command without arguments. Only executed on :app servers
  $ cap restart

  rolls your application back to the previously deployed version
  determines the previous release , updates the current symlink to point
  to that, and then deletes the latest release
  $ cap rollback

== Creates and chmods the directory tree properly:
  $ cap setup

  inspect the existing tasks and display them to standard out in
== alphabetical order, along with their descriptions:
  $ cap show_tasks

== starts the spinner process for your application:
  $ cap spinner

  updates the current symlink to the latest deployed version of the code
  $ cap symlink

  Checks out your source code, deletes the log and public/system
  directories in your new release, symlinks log to
== #{shared_path}/log, symlinks public/system to #{shared_path}/system:
  $ cap update_code
n\
  ########## config/deploy.rb ##########
  *Defining Tasks
  task :hello_world do\n  run \"echo Hello, $HOSTNAME\"
  end

  task :hello_world, :roles => [:db, :app] do\n  puts \"calling hello_world...\"\n  hello_world
  end

  *Transactions
  task :cold_deploy do\n  transaction do\n    task_one_here\n    task_two_here\n  end\n  task_three_not_in_transaction
  end

  *Capturing output with run
  run \"sudo ls -la\" do |channel, stream, data|\n  if data =~ /^Password:/\n    logger.info \"#{channel[:host]} asked for password\"\n    channel.send_data \"mypass\"\n  end
  end

  buffer = render(:template => 
  <<EXAMPLE_TEMPLATE)\n  This template will be rendered replacing variables\n  <%= like_this_variable =>\n  with their values.
  EXAMPLE_TEMPLATE

  put buffer, \"path/to/save/file.txt\", :mode => 0755

  * multi-stage
  set :stages, %w(staging production testing) # [optional] defaults to [development, test, staging?, production].
  set :default_stage, \"testing\" # [optional] if omitted, cap aborts if you don't specify in args
  require 'capistrano/ext/multistage'

  Stage-specific code in config/deploy/staging.rb and config/deploy/production.rb. 
  see: http://weblog.jamisbuck.org/2007/7/23/capistrano-multistage

  *deploy.rb variables and their defaults

  The name of your application. 
  :application\t(required)\t

  The location of your code\xE2\x80\x99s scm repository
  :repository\t(required)\t

  The address of the server to use as a gateway. 
  :gateway\tnil\t\t

  The name of the user to use when logging into the remote host(s).
  :user\t\tcurrent_user\t

  The password to use for logging into the remote host(s).
  :password\tpassword\t

  The root of the directory tree on the remote host(s) that the 
  application should be deployed to
  :deploy_to\t\xE2\x80\x9C/u/apps/#{application}\xE2\x80\x9D

  The directory under deploy_to that should contain each deployed revision.
  :version_dir\treleases\t

  The name to use (relative to deploy_to) for the symlink that points at 
  the current release
  :current_dir\tcurrent\t\t

  The name of the directory under deploy_to that will contain directories and files to be shared between all releases.
  :shared_dir\tshared\t

  This specifies the revision you want to check out on the remote machines.
  :revision\t(latest)\t

  The source control module to use. 
  Current supported are :subversion, :cvs, :darcs
  :scm\t\tsubversion\t

  The location on the remote host of the source control executable.
  :svn,:cvs,:darcs

  The subversion operation to use when checking out code on the remote host. 
  Can be set to \xE2\x80\x9Cexport\xE2\x80\x9D
  :checkout\t\"co\"\t\t
  \t\t\t\t
  Hash of additional options passed to the SSH connection routine.
== This lets you set (among other things) a non-standard port to connect on:
  (ssh_options[:port] = 2345)
  :ssh_options\tHash.new\t
  \t\t\t\t
  Whether or not tasks that can use sudo, ought to use sudo. In a shared environment, this is typically not desirable (or possible), and 
  in that case you should set this variable to false
  :use_sudo\ttrue\t\t

  Sets the path to sudo.
  :sudo\t\t\t\t

== variables are set via:
  set :application, \"flipper\"
n\
  ########## Interactive Shell ##########\n      (requires capistrano-1.2.0)
  Shell is essentially a SSH interface to your
  servers, so you can run standard commands such 
  as 'ls' or 'cp' as well as Capistrano-specific ones.

  Start the interactive Capistrano shell
  $ cap -v shell

  Execute Capistrano tasks
  cap> !deploy
  cap> !update_code symlink
  cap> !setup deploy
  cap> on app2.foo.com !setup
  cap> with app,db !setup deploy"
