lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "country/version"

Gem::Specification.new do |spec|
  spec.name = "country"
  spec.required_ruby_version = ">= 2.4.0"
  spec.homepage = "https://github.com/kucho/contry"
  spec.version = Country::VERSION
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
    "source_code_uri" => "https://github.com/kucho/country",
    "changelog_uri" => "https://github.com/kucho/country/blob/master/CHANGELOG.md"
  }

  spec.add_development_dependency("bundler", "~> 2.2")
  spec.add_development_dependency("standard", "~> 1.0")
  spec.add_development_dependency("rspec", "~> 3.10")
end