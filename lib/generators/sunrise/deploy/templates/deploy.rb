require 'sunrise/deploy'

set :application, "APP_NAME"
set :deploy_to, "/var/www/#{application}"
set :use_sudo, true
set :user, "SERVER_USER"

set :rvm_ruby_string, 'RUBY_VERSION'

set :scm, :git
set :scm_user, "devfodojo"
set :scm_password, "GIT_PASSWORD"
set :repository, "#{scm_user}@somehost:~/projects/project.git"
set :remote, "#{scm_user}"
set :branch, "master"

set :asset_precompile, true

set :cache_clear, true
set :cache_paths, ["tmp/cache", "public/cache"]

server "SERVER_IP", :app, :web, :db, :primary => true
