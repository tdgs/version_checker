require 'net/http'
require 'json'

module VersionChecker
  class GithubEngine

    attr_accessor :user
    attr_accessor :repo

    GITHUB_HOST = 'https://api.github.com'

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
      self.user,self.repo = user,repo
    end

    def tags
      @tags ||= fetch_tags
    end

    def latest_version
      tags.keys.sort.last
    end

    def latest_url(type = :zip)
      version_url(latest_version, type)
    end

    def version_url(version, type)
      t = case type
          when :zip then 'zipball_url'
          when :tar then 'tarball_url'
          else return nil
          end

      tags[version][t]
    end

    private

    def make_request(url)
      uri = URI(GITHUB_HOST + url)
      JSON.parse(VersionChecker::https_request(uri))
    end

    def fetch_tags
      tags = make_request "/repos/#{user}/#{repo}/tags"

      tags.inject({}) do |h, t|
        h.merge({t['name'] => t})
      end
    end

  end
end
