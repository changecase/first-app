set :application, "first-app.changecase.net"
set :repository, "git@github.com:changecase/first-app.git"
set :domain, 'changecase.net'                                # dreamhost servername where account is located

set :user, 'changecase'                                           # dreamhost account's username
set :project, "#{application}"                                    # application as its called in the repository
set :scm, :git
set :applicationdir, "/home/#{user}/#{application}"               # the standard dreamhost setup

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :app, domain                                                 # This may be the same as your `Web` server
role :web, domain                                                 # Your HTTP server, Apache/etc
role :db,  domain, :primary => true                               # This is where Rails migrations will run

set :deploy_to, applicationdir 

set :deploy_via, :remote_cache                         # deploy config (also the deploy_to above)
set :git_enable_submodules, 1                          # if you have vendored rails
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true

set :keep_releases, 5

default_run_options[:pty] = true                       # forgo errors when deploying from windows
ssh_options[:keys] = %w(/home/changecase/.ssh/id_rsa.pb)  # if you are using ssh_keys... and I am!
set :chmod755, "app config db lib public vendor script script/* public/disp*"
set :use_sudo, false

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end
