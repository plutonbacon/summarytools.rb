# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'summarytools/version'

Gem::Specification.new do |spec|
  spec.name          = "summarytools"
  spec.version       = SummaryTools::VERSION
  spec.authors       = ['Michael Pellon']
  spec.email         = ['m@pellon.io']
  spec.summary       = 'A pure Ruby port of Dominic Comtois excellent R package.'
  spec.homepage      = 'https://github.com/mpellon/summarytools.rb'
  spec.license       = 'MIT'

  spec.required_ruby_version = '>= 2.0.0'

  spec.files = Dir["lib/**/*"] + %w(README.md LICENSE)

  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  # Development only
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rspec', '~> 3.1.0'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'yard', '~> 0.8.7.6'
end
