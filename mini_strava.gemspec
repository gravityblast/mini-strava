# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mini_strava/version'

Gem::Specification.new do |spec|
  spec.name          = "mini_strava"
  spec.version       = MiniStrava::VERSION
  spec.authors       = ["Andrea Franz"]
  spec.email         = ["andrea@gravityblast.com"]
  spec.summary       = %q{A simple client for the strava API}
  spec.description   = %q{A simple client for the strava API}
  spec.homepage      = "https://github.com/pilu/mini-strava"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'ripl'

  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end
