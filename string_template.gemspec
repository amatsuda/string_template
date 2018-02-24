lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "string_template"
  spec.version       = '0.2.0'
  spec.authors       = ["Akira Matsuda"]
  spec.email         = ["ronnie@dio.jp"]

  spec.summary       = "A template engine for Rails, focusing on speed, using Ruby's String interpolation syntax"
  spec.description   = %]string_template is a Rails plugin that adds an Action View handler for .string template that accepts Ruby's String literal that uses #{} notation for interpolating dynamic variables]
  spec.homepage      = 'https://github.com/amatsuda/string_template'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'rails'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'benchmark_driver', '>= 0.9.0'
end
