# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pay2go/version'

Gem::Specification.new do |spec|
  spec.name          = "ez_pay2go"
  spec.version       = Pay2go::VERSION
  spec.authors       = ["Carol Hsu"]
  spec.email         = ["sheseee@gmail.com"]

  spec.summary       = %q{Basic API client for pay2go}
  spec.description   = %q{Get interact with pay2go API}
  spec.homepage      = "https://github.com/CarolHsu/pay2go"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
