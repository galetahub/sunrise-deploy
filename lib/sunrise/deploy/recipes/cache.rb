module Capistrano
  Configuration.instance(true).load do
    set :cache_paths, ["tmp/cache", "public/cache"]

    namespace :cache do
      desc "Clear all cache in project by 'cache_paths': (tmp/cache, public/cache)"
      task :clear do
        Array.wrap(cache_paths).each do |folder|
          path = File.join(deploy_to, folder, "*")
          run "#{try_sudo} rm -rf #{path}"
        end
      end
    end
  end
end