
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "asciidoctor/indir_ext/version"

Gem::Specification.new do |spec|
  spec.name          = "asciidoctor-indir_ext"
  spec.version       = Asciidoctor::IndirExt::VERSION
  spec.authors       = ["johannesjh"]
  spec.email         = ["johannesjh@users.noreply.github.com"]

  spec.summary       = "An Asciidoctor extension that adds a variable `indir`, which always points to the directory of the currently included asciidoc file"
  spec.description   = %q(This Asciidoctor extension exposes a variable `indir`, which holds the path to the directory where the current asciidoc file is located.
    The value of this variable changes to always reflect the location of the current, included subdocument.
    (Note, this is in contrast to the `docfile` variable, which remains the same throughout an entire document).)
  spec.homepage      = "https://github.com/johannesjh/asciidoctor-indir_ext"
  spec.license       = "MIT"

  spec.metadata = {
    'bug_tracker_uri' => 'https://github.com/johannesjh/asciidoctor-indir_ext/issues',
    'source_code_uri' => 'https://github.com/johannesjh/asciidoctor-indir_ext'
  }

  # Specify which files should be added to the gem when it is released.
  spec.files         = Dir['lib/**/*', '*.gemspec', 'LICENSE*', 'README*']
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'asciidoctor', '~> 1.5.6'
  spec.add_runtime_dependency 'concurrent-ruby', '~> 1.1.3'

  spec.add_development_dependency 'asciidoctor-pdf', '~> 1.5.0.alpha.16' # to build a pdf of the example folder
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
