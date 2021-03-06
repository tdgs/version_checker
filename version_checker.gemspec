# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "version_checker/version"

Gem::Specification.new do |s|
  s.name        = "version_checker"
  s.version     = VersionChecker::VERSION
  s.authors     = ["Georgios Avramidis"]
  s.email       = ["avramidg@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "version_checker"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "libnotify"

  s.add_dependency "rubyzip"
  #
end
