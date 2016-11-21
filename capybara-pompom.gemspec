# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capybara/pompom/version'

Gem::Specification.new do |spec|
  spec.name          = "capybara-pompom"
  spec.version       = Capybara::PomPom::VERSION
  spec.authors       = ["Baylor Rae'"]
  spec.email         = ["baylor@fastmail.com"]

  spec.summary       = %q{A Capybara inspired DSL for page object models.}
  spec.description   = %q{A Capybara inspired DSL for page object models.}
  spec.homepage      = "https://github.com/baylorrae/capybara-pompom"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "capybara", "~> 2.5"
  spec.add_dependency "activesupport", "~> 4.2"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_development_dependency "rspec", "~> 3.3"
  spec.add_development_dependency "cucumber", "~> 2.0"
  spec.add_development_dependency "selenium-webdriver", "~> 2.46"
end
