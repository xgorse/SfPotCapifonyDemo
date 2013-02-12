set :stages,        %w(rec prod)
set :default_stage, "rec"
set :stage_dir,     "app/config/deploy"
require 'capistrano/ext/multistage'

set :application, "SfPotCapifonyDemo"
set :domain,      "sfpot.vm1"
set :deploy_to,   "/home/vagrant/SfPotCapifonyDemo"
set :app_path,    "app"

set :repository,  "git://github.com/xgorse/SfPotCapifonyDemo.git"
set :scm,         :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `subversion`, `mercurial`, `perforce`, or `none`

set :model_manager, "doctrine"
# Or: `propel`

role :web,        domain                         # Your HTTP server, Apache/etc
role :app,        domain                         # This may be the same as your `Web` server
role :db,         domain, :primary => true       # This is where Symfony2 migrations will run

set  :keep_releases,  3

# Symfony shared Config
set :shared_files,      ["app/config/parameters.yml"]
set :shared_children,   [app_path + "/logs", web_path + "/uploads", "vendor"]


#Composer settings
set :use_composer, true
set :copy_vendors, false

#Permission 
set :use_sudo,      false


# Be more verbose by uncommenting the following line
#logger.level = Logger::MAX_LEVEL