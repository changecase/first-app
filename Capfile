load 'deploy'
# Uncomment if you are using Rails' asset pipeline
    # load 'deploy/assets'
load 'config/deploy' # remove this line to skip loading any of the default tasks

# everything below this was added according to https://github.com/capistrano/capistrano/wiki/2.x-From-The-Beginning
# modified by dreamhost setup

set :user, 'changecase'                                # dreamhost account's username
set :project, '#{application}'                         # application as its called in the repository
set :scm, :git
set :applicationdir, '/home/#{user}/#{application}'    # the standard dreamhost setup

set :deploy_to, applicationdir 

# everything below this was added according to http://wiki.dreamhost.com/Capistrano

set :deploy_via, :remote_cache                         # deploy config (also the deploy_to above)
set :git_enable_submodules, 1                          # if you have vendored rails
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true

default_run_options[:pty] = true                       # forgo errors when deploying from windows
ssh_options[:keys] = %w(/home/changecase/.ssh/id_rsa)  # if you are using ssh_keys... and I am!
set :chmod755, "app config db lib public vendor script script/* public/disp*"
set :use_sudo, false
