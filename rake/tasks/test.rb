# encoding: utf-8

namespace :test do
  desc "Run all unit tests"
  task :run do
    ARGV.clear # FIXME: HAX!
    load 'test/runner.rb'
  end
end

desc "Runs test:run - which runs all unit tests"
task :test => 'test:run'
