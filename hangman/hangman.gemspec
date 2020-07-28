require_relative 'lib/hangman/version'


Gem::Specification.new do |spec|
  spec.name          = "hangman"
  spec.version       = Hangman::VERSION
  spec.authors       = ["Moses Akor"]
  spec.email         = ["gabrielmosesakor@gmail.com"]

  spec.summary       = %q{"Hangman game"}
  spec.homepage      = "https://github.com/mosesakor/tic_tac_toe"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  #spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  #spec.metadata["homepage_uri"] = spec.homepage
  #spec.metadata["source_code_uri"] = "https://github.com/mosesakor/tic_tac_toe/blob/master/tic_tac_toe.rb"
  #spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_development_dependency "rspec"
end
