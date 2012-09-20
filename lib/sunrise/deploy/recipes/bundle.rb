module Capistrano
  Configuration.instance(true).load do

    namespace :bundle do
      task :install do
        run "cd #{deploy_to} && bundle install --deployment --quiet --without development test"
      end
    end
  end
end