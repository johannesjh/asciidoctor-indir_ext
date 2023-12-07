# Asciidoctor::IndirExt



## Status and Maintenance

This is unmaintained software. Don't use it. Feel free to fork. I am not actively working on this anymore.

This asciidoctor extension has served its purpose of demonstrating the need and providing a temporary solution, but I currently don't use it anymore, and I have not updated it for a while. As of December 2023, it is not compatible with current versions of Asciidoctor anymore, compare [pull request 4](https://github.com/johannesjh/asciidoctor-indir_ext/pull/4) in this repository.

In my opinion, the ability to include subdocuments (and to use relative paths for including images etc in these subdocuments) should be implemented at the level of Asciidoctor (the compiler) and Asciidoc (the language). Corresponding tickets exist, see e.g., [issue 650](https://github.com/asciidoctor/asciidoctor/issues/650). Unfortunately, the feature has not landed for years. I have grewn increasingly frustrated about it. A compiler extension (such as this repo here) can only be seen as a temporary workaround. As a proper solution, an official language or compiler feature is needed so that everybody can rely on it in the long term. From a user perspective, this is needed to be able to use the feature without having to install extensions. From a developer perspective, this is needed in order to create a thriving ecosystem where multiple compilers (not just asciidoctor) and multiple extensions (besides asciidoctor-indir_ext) can benefit from the feature using offically documented, standardized syntax.


## About

An Asciidoctor extension that adds a variable `indir`, which always points to the directory of the currently included asciidoc file.

This extension solves the problem that standard asciidoctor allows [no relative paths in subdocuments](https://github.com/asciidoctor/asciidoctor/issues/650), see  [asciidoctor issue #650](https://github.com/asciidoctor/asciidoctor/issues/650).


## Installation

If using bundler, add this line to your application's Gemfile:

```ruby
gem 'asciidoctor-indir_ext'
```

And then execute:

    $ bundle install


If you do not wish to use bundler, install as:

    $ gem install asciidoctor-indir_ext


## Usage

1. In the beginning of a subdocument, add this line:
`ifndef::indir[:indir: .]`

2. Include images like this:
`image::{indir}/images/example.svg[]`

3. When compiling a master document (that includes other subdocuments), require this extension.

For example:

```bash
bundle exec asciidoctor -r asciidoctor-indir_ext master.adoc
```


...or without bundler:

```bash
asciidoctor -r asciidoctor-indir_ext master.adoc
```

As a result, the extension provides an `indir` variable, which always points at the directory of the included asciidoc file. This allows image paths like `{indir}/images/example.svg` to be resolved relative to the included subdocument.



## Development

It is possible to start a docker container using `docker-compose run --rm dev bash`.
This allows to run the following commands inside the docker container
and thus avoids messing with the local system setup.

* Run `bundle install` to install dependencies
* To list all available rake tasks, run `bundle exec rake -T`
* To build a gem package on your local machine, run `bundle exec rake build`
* To install this gem onto your local machine, run `bundle exec rake install`
* To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org)


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/johannesjh/asciidoctor-indir_ext.



## Credits

This extension is based on another asciidoctor extension called [jirutka/asciidoctor-include-ext](https://github.com/jirutka/asciidoctor-include-ext), which provides a cleaner implementation of asciidoctor's include processing, and thus makes it easier to overwrite according behavior through an extension.

Special thanks goes to [@mojavelinux](https://github.com/mojavelinux) for pointing out this solution in [asciidoctor issue #650](https://github.com/asciidoctor/asciidoctor/issues/650) and for providing valuable feedback.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
