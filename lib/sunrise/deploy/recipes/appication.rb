require 'sunrise/deploy/strategy/simple'

module Capistrano
  Configuration.instance(true).load do

    # Taken from the capistrano code.
    def _cset(name, *args, &block)
      unless exists?(name)
        set(name, *args, &block)
      end
    end

    set :strategy, Sunrise::Deploy::Strategy::Simple.new(self)
    set :rake, "bundle exec rake"

    # Must be set for the password prompt from git to work
    set :ssh_options, { :forward_agent => true }
    set :default_run_options, { :pty => true}

    _cset :rails_env, "production"
    _cset :rvm_ruby_string, '1.9.3'

    _cset :scm, :git
    _cset :scm_passphrase, Proc.new { Capistrano::CLI.password_prompt("GIT Password for #{scm_user}:") }
    _cset :scm_verbose, true
    _cset :branch, "master"

    _cset :asset_precompile, true
    _cset :asset_env, "RAILS_GROUPS=assets"
    _cset :assets_prefix, "assets"
    _cset :assets_role, [:web]

    namespace :app do
      desc "Update code, bundle install, migrate, assets precompile and restart server"
      task :deploy do
        update
        bundle.install
        db.migrate
        assets.precompile if asset_precompile
        restart
      end

      desc "Update code on remote hosts"
      task :update, :except => { :no_release => true } do
        on_rollback { strategy.rollback! }
        strategy.deploy!
      end

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

  end
end