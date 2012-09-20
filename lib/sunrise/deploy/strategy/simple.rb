require 'capistrano/recipes/deploy/strategy/remote'

module Sunrise
  module Deploy
    module Strategy
      class Simple < ::Capistrano::Deploy::Strategy::Remote

        def rollback!
          # TODO:
        end

        protected

          def command
            @command ||= source.sync(revision, deploy_to)
          end
      end
    end
  end
end