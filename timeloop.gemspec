# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'timeloop/version'

Gem::Specification.new do |spec|
  spec.name          = "timeloop"
  spec.version       = Timeloop::VERSION
  spec.authors       = ['Maciej Paruszewski']
  spec.email         = ['maciek.paruszewski@gmail.com']
  spec.summary       = %q{Timeloop is a simple Ruby gem that provides loop with time interval.}
  spec.homepage      = 'https://github.com/pinoss/timeloop'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', "~> 1.6"
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
