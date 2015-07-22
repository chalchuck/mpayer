lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mpayer/version'

Gem::Specification.new do |spec|
  spec.name          = "mpayer"
  spec.version       = Mpayer::VERSION
  spec.authors       = ["Charles Chuck"]
  spec.email         = ["chalcchuck@gmail.com"]
  spec.summary       = %q{A ruby library for Mpayer}
  spec.description   = %q{A ruby library for Mpayer.}
  spec.homepage      = "https://github.com/chalchuck/mpayer"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'json', '~>1.0'
  spec.add_runtime_dependency 'typhoeus', '~> 0.6', '>= 0.7.2'

  spec.add_development_dependency "bundler", "~> 1.0"
  spec.add_development_dependency "rake", '~> 10.0'
  spec.add_development_dependency 'pry', '~> 0.5', '>= 0.9.0'
  spec.add_development_dependency 'minitest', '~> 4.7.0'
  spec.add_development_dependency 'minitest-reporters', '~> 0.7'
  spec.add_development_dependency 'shoulda-context', '~> 1.0', '>= 1.2.1'
end
