$:.push File.expand_path("../lib", __FILE__)
require 'huxley/version'

Gem::Specification.new do |s|
  s.name        = 'huxley'
  s.version     = Huxley::VERSION
  s.platform    = Gem::Platform::RUBY
  s.date        = '2014-04-23'
  s.summary     = 'A simple and semantic grid framework for SASS'
  s.authors     = ["Devon Tivona"]
  s.email       = 'devon@tivona.me'
  s.files       = ["lib/huxley.rb"]
  s.homepage    = 'http://huxley.tivona.me'
  s.license     = "MIT"
  
  s.files         = `git ls-files`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency('sass', '>= 3.2')
  s.add_dependency('bourbon', '>= 2.1')
  s.add_dependency('thor')
end