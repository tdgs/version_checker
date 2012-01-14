require 'version_checker/engine'
require 'net/http'

module VersionChecker
  class GithubEngine

    attr_accessor :user
    attr_accessor :repo

    def initialize(*args)
      case args.count
      when 1
        if args[0].is_a? String
          (user,repo) = args[0].split "/"
        else
          user = args[0][:user]
          repo = args[0][:repo]
        end
      when 2
        user,repo = args
      end
    end

    def repo_hash
      r = Net::HTTP.get('
    end
  end
end
