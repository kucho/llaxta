lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "llaxta/version"

Gem::Specification.new do |spec|
  spec.name = "llaxta"
  spec.required_ruby_version = ">= 2.2.0"
  spec.homepage = "https://github.com/kucho/llaxta"
  spec.version = Llaxta::VERSION
  spec.platform = Gem::Platform::RUBY
  spec.summary = ""
  spec.description = ""
  spec.authors = ["Victor Rodriguez", "Sebastian Palma"]
  spec.email = "victor.rodriguez.guriz@gmail.com"
  spec.license = "MIT"

  spec.files = `git ls-files`.split($/)
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.metadata = {
    "source_code_uri" => "https://github.com/kucho/llaxta",
    "changelog_uri" => "https://github.com/kucho/llaxta/blob/master/CHANGELOG.md"
  }

  spec.add_development_dependency("bundler", "~> 2.2")
  spec.add_development_dependency("standard", "~> 1.0")
  spec.add_development_dependency("rspec", "~> 3.10")
  spec.add_development_dependency("pry", "~> 0.14.1")
end
