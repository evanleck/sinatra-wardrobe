# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sinatra-wardrobe/version"

Gem::Specification.new do |s|
  s.name        = "sinatra-wardrobe"
  s.version     = Sinatra::Wardrobe::VERSION
  s.authors     = ["Evan Lecklider"]
  s.email       = ["evan.lecklider@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{A quick and dirty static file router.}
  s.description = %q{A quick and dirty static file router.}

  s.rubyforge_project = "sinatra-wardrobe"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "sinatra"
end
