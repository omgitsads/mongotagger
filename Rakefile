require 'rubygems'
require 'rake'
require 'rake/testtask'
require 'rcov/rcovtask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "mongotagger"
    s.summary = "Mongotagger, a tagging plugin for Mongomapper"
    s.description = "Mongotagger, a tagging plugin for Mongomapper"
    s.email = "adam@adamholt.co.uk"
    s.homepage = "http://github.com/omgitsads/mongotagger"
    s.authors = ["Adam Holt"]
    
    s.add_dependency("mongo_mapper", "0.6.10")
    
    s.add_development_dependency("shoulda","2.10.2")
  end
  Jeweler::RubyforgeTasks.new do |rubyforge|
    rubyforge.doc_task = "yardoc"
  end

rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.ruby_opts << '-rubygems'
  t.verbose = true
end

begin
  require 'yard'
  YARD::Rake::YardocTask.new(:yardoc)
rescue LoadError
  task :yardoc do
    abort "YARD is not available. In order to run yard, you must: sudo gem install yard"
  end
end


Rcov::RcovTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end


task :default => :rcov