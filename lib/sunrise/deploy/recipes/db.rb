module Capistrano
  Configuration.instance(true).load do

    namespace :db do
      desc <<-DESC
        Run the migrate rake task. By default, it runs this in most recently \
        deployed version of the app. However, you can specify a different release \
        via the migrate_target variable, which must be one of :latest (for the \
        default behavior), or :current (for the release indicated by the \
        `current' symlink). Strings will work for those values instead of symbols, \
        too. You can also specify additional environment variables to pass to rake \
        via the migrate_env variable. Finally, you can specify the full path to the \
        rake executable by setting the rake variable. The defaults are:

          set :rake,           "rake"
          set :rails_env,      "production"
          set :migrate_env,    ""
      DESC
      task :migrate, :roles => :db, :only => { :primary => true } do
        rake = fetch(:rake, "rake")
        rails_env = fetch(:rails_env, "production")
        migrate_env = fetch(:migrate_env, "")

        run "cd #{deploy_to} && #{rake} RAILS_ENV=#{rails_env} #{migrate_env} db:migrate"
      end
    end
  end
end