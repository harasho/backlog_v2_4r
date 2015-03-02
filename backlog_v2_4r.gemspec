# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'backlog_v2_4r/version'

Gem::Specification.new do |spec|
  spec.name          = "backlog_v2_4r"
  spec.version       = BacklogV24r::VERSION
  spec.authors       = ["Yusuke KON @kon_yu"]
  spec.email         = ["yusukedrive@gmail.com"]

  spec.summary       = %q{Get Backlog(powerd by nulab) data}
  spec.description   = %q{Backlog is an d issue traking service. Backlog has web Api. it can use api_key, This gem can get Backlog's data with that api.}
  spec.homepage      = "https://github.com/konyu/backlog_v2_4r.rb"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
