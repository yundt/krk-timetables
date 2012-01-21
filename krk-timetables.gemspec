# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "krk-timetables/version"

Gem::Specification.new do |s|
  s.name        = "krk-timetables"
  s.version     = KrkTimetables::VERSION
  s.authors     = ["Marek Nowak"]
  s.email       = ["mareknowakk@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{A gem parsing Cracow MPK timetables.}
  s.description = %q{This is a gem parsing Cracow MPK timetables from the mpk.krakow.pl website and returning them in a form of nice Ruby objects.}

  s.rubyforge_project = "krk-timetables"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec", "~> 2.7"
  s.add_development_dependency "autotest"
  s.add_development_dependency "simplecov"
  s.add_runtime_dependency "nokogiri"
end
