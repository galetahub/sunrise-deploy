module Capistrano
  Configuration.instance(true).load do

    namespace :assets do
      desc <<-DESC
        Run the asset precompilation rake task. You can specify the full path \
        to the rake executable by setting the rake variable. You can also \
        specify additional environment variables to pass to rake via the \
        asset_env variable. The defaults are:

          set :rake,      "rake"
          set :rails_env, "production"
          set :asset_env, "RAILS_GROUPS=assets"
      DESC
      task :precompile, :roles => assets_role, :except => { :no_release => true } do
        run "cd #{deploy_to} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile"
      end

      desc <<-DESC
        Run the asset clean rake task. Use with caution, this will delete \
        all of your compiled assets. You can specify the full path \
        to the rake executable by setting the rake variable. You can also \
        specify additional environment variables to pass to rake via the \
        asset_env variable. The defaults are:

          set :rake,      "rake"
          set :rails_env, "production"
          set :asset_env, "RAILS_GROUPS=assets"
      DESC
      task :clean, :roles => assets_role, :except => { :no_release => true } do
        run "cd #{deploy_to} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:clean"
      end
    end
  end
end