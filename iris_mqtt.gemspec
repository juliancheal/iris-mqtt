# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'iris_mqtt/version'

Gem::Specification.new do |spec|
  spec.name          = "iris_mqtt"
  spec.version       = Iris::MQTT::VERSION
  spec.authors       = ["Julian Cheal"]
  spec.email         = ["julian.cheal@gmail.com"]
  spec.summary       = "Iris is a Ruby MQTT implementation"
  spec.description   = ""
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest", "~> 5.5.0"
  spec.add_runtime_dependency "celluloid-io", "~> 0.16.1"
end
