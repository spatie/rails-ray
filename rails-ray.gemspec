require_relative "lib/rails/ray/version"

Gem::Specification.new do |spec|
  spec.name        = "rails-ray"
  spec.version     = Rails::Ray::VERSION
  spec.authors     = ["Chris Oliver"]
  spec.email       = ["excid3@gmail.com"]
  spec.homepage    = "https://github.com"
  spec.summary     = "Summary of Rails::Ray."
  spec.description = "Description of Rails::Ray."
  spec.license     = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com"
  spec.metadata["changelog_uri"] = "https://github.com"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.1.3"
  spec.add_dependency "ruby-ray"
end
