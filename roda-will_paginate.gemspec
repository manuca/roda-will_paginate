# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'roda/will_paginate'

Gem::Specification.new do |spec|
  spec.name          = "roda-will_paginate"
  spec.version       = Roda::WillPaginate::VERSION
  spec.authors       = ["Manuel Barros Reyes"]
  spec.email         = ["manuca@gmail.com"]
  spec.summary       = %q{Plugin to integrate Will Paginate with the Roda framework}
  spec.description   = spec.summary
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "will_paginate", "~> 3.0"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
