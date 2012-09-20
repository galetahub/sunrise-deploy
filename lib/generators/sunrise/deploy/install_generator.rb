require 'rails/generators'

module Sunrise
  module Deploy
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))
      desc "Generates capistrano default config"

      def create_capfile
        copy_file('Capfile', 'Capfile')
      end

      def create_deploy
        copy_file('deploy.rb', 'config/deploy.rb')
      end
    end
  end
end
