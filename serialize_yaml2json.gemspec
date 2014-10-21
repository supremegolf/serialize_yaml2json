# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'serialize_yaml2json/version'

Gem::Specification.new do |spec|
  spec.name          = "serialize_yaml2json"
  spec.version       = SerializeYAML2JSON::VERSION
  spec.authors       = ["Philip Hallstrom"]
  spec.email         = ["philip@supremegolf.com.com"]
  spec.summary       = %q{ActiveRecord::Coder to transition serialized attributes from YAML to JSON.}
  spec.description   = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'activerecord', '~> 4.1'
  spec.add_dependency 'activesupport', '~> 4.1'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'sqlite3'
end
