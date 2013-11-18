# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'log_raider/version'

Gem::Specification.new do |spec|
  spec.name          = "log_raider"
  spec.version       = LogRaider::VERSION
  spec.authors       = ["Bill Abney", "Duc Phan"]
  spec.email         = ["bill@billfloat.com", "duc@billfloat.com"]
  spec.description   = %q{send error logs to Newrelic even if the error does not reach toplevel}
  spec.summary       = %q{send error logs to Newrelic even if the error does not reach toplevel}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  spec.add_runtime_dependency "rails"
  spec.add_runtime_dependency "newrelic_rpm"
end
