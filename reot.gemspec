# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "reot/version"

Gem::Specification.new do |s|
  s.name        = "reot"
  s.version     = Reot::VERSION
  s.authors     = ["Josef Šimánek"]
  s.email       = ["retro@ballgag.cz"]
  s.homepage    = ""
  s.summary     = %q{ttf2eot ruby wrapper}
  s.description = %q{Simple ttf2eot convertor}
  s.extensions  = ["ext/reot/extconf.rb"]

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rake-compiler"
end
