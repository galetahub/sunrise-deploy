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

server "SERVER_IP", :app, :web, :db, :primary => true

namespace :app do
  task :start do
    run "#{try_sudo} sv start #{application}"
  end

  task :stop do
    run "#{try_sudo} sv stop #{application}"
  end

  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} sv restart #{application}"
  end
end
