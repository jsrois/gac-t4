# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gac/version'

Gem::Specification.new do |spec|
  spec.name          = "gac"
  spec.authors       = ["Javier Sánchez Rois"]
  spec.email         = ["javier.sanchez.rois@gmail.com"]
  spec.summary       = %q{Exercises from Automatic Code Generation, 2015-16}
  spec.description   = %q{test code generator}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
end
