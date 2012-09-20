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
            #@command ||= source.sync(revision, deploy_to)

            git     = source.command
            remote  = source.origin

            execute = []
            execute << "cd #{configuration[:deploy_to]}"

            if remote != 'origin'
              execute << "#{git} config remote.#{remote}.url #{configuration[:repository]}"
              execute << "#{git} config remote.#{remote}.fetch +refs/heads/*:refs/remotes/#{remote}/*"
            end

            execute << "#{git} checkout #{configuration[:branch]}"
            execute << "#{git} pull #{remote} #{configuration[:branch]}"

            execute.join(" && ")
          end

          # Returns the command which will write the identifier of the
          # revision being deployed to the REVISION file on each host.
          def mark
            "(echo #{Time.now} > #{configuration[:deploy_to]}/REVISION)"
          end
      end
    end
  end
end