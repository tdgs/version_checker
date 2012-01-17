$LOAD_PATH.unshift(File.dirname(__FILE__))
require "version_checker/version"
require 'version_checker/engines/github'
require 'https_request'


module VersionChecker

  class Checker
    attr_accessor :engine


    def self.engine_factory(engine)
    end

    def initialize(atts)
      self.engine = self.class.engine_factory(attrs[:engine])
    end

  end
end
