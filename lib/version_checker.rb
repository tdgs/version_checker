$LOAD_PATH.unshift(File.dirname(__FILE__))
require "version_checker/version"
require 'version_checker/engines/github'
require 'version_checker/net'


module VersionChecker

  class Checker
    attr_accessor :engine
    attr_accessor :current_version

    ENGINES = {
      :github => GithubEngine
    }


    def self.engine(engine)
      ENGINES[engine]
    end

    def initialize(engine, current_version, *args)
      self.current_version = current_version
      self.engine = self.class.engine(engine).new(*args)
    end

    def latest_version
      engine.latest_version
    end
    
    def latest?
      current_version == latest_version
    end

    def latest_url
      engine.latest_url
    end

    def download_zip(filename)

    end

    

  end

end
