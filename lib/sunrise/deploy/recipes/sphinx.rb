module Capistrano
  Configuration.instance(true).load do
    namespace :sphinx do
      desc "Generates Configuration file for TS"
      task :config, :roles => :app do
        run "cd #{deploy_to} && #{rake_bin} RAILS_ENV=#{rails_env} ts:config"
      end

      desc "Starts TS"
      task :start, :roles => :app do
        run "cd #{deploy_to} && #{rake_bin} RAILS_ENV=#{rails_env} ts:start"
      end

      desc "Stops TS"
      task :stop, :roles => :app do
        run "cd #{deploy_to} && #{rake_bin} RAILS_ENV=#{rails_env} ts:stop"
      end

      desc "Rebuild TS"
      task :rebuild, :roles => :app do
        run "cd #{deploy_to} && #{rake_bin} RAILS_ENV=#{rails_env} ts:rebuild"
      end

      desc "Indexes TS"
      task :index, :roles => :app do
        run "cd #{deploy_to} && #{rake_bin} RAILS_ENV=#{rails_env} ts:in"
      end
    end
  end
end