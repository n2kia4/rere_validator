# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rere_validator/version'

Gem::Specification.new do |spec|
  spec.name          = "rere_validator"
  spec.version       = RereValidator::VERSION
  spec.authors       = ["Natsuki Tanaka"]
  spec.email         = ["natsukia3@gmail.com"]

  spec.summary       = %q{Provides regex and reserved words to username.}
  spec.description   = %q{Provides regex and reserved words to username.}
  spec.homepage      = "https://github.com/natsukia3/rere_validator"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'activemodel'

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
