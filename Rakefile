require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "freighthopper"
    gem.summary = %Q{Some extensions for riding the rails}
    gem.description = %Q{More core ext}
    gem.email = "github@jacobrothstein.com"
    gem.homepage = "http://github.com/jbr/freighthopper"
    gem.authors = ["Jacob Rothstein"]
    gem.files = Dir['lib/**/*.rb']
    gem.require_paths = %w(lib)
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end

task :default => :test
