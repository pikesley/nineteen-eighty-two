# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nineteen/eighty/two/version'

Gem::Specification.new do |spec|
  spec.name          = 'nineteen-eighty-two'
  spec.version       = Nineteen::Eighty::Two::VERSION
  spec.authors       = ['pikesley']
  spec.email         = ['github@orgraphone.org']

  spec.summary       = %q{© 1982 Sinclair Research Ltd.}
  spec.description   = %q{© 1982 Sinclair Research Ltd.}
  spec.homepage      = 'http://pikesley.org'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'erubis'
  
  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'coveralls', '~> 0.8'
end
