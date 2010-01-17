# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{mongo_tagger}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Adam Holt"]
  s.date = %q{2010-01-17}
  s.description = %q{MongoTagger, a tagging plugin for MongoMapper}
  s.email = %q{adam@adamholt.co.uk}
  s.extra_rdoc_files = [
    "README.mdown"
  ]
  s.files = [
    ".gitignore",
     "README.mdown",
     "Rakefile",
     "VERSION",
     "lib/mongo_tagger.rb",
     "lib/mongo_tagger/tag.rb",
     "mongotagger.gemspec",
     "test/mongo_tagger_test.rb",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/omgitsads/mongotagger}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{MongoTagger, a tagging plugin for MongoMapper}
  s.test_files = [
    "test/mongo_tagger_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mongo_mapper>, ["= 0.6.10"])
      s.add_development_dependency(%q<shoulda>, ["= 2.10.2"])
    else
      s.add_dependency(%q<mongo_mapper>, ["= 0.6.10"])
      s.add_dependency(%q<shoulda>, ["= 2.10.2"])
    end
  else
    s.add_dependency(%q<mongo_mapper>, ["= 0.6.10"])
    s.add_dependency(%q<shoulda>, ["= 2.10.2"])
  end
end
