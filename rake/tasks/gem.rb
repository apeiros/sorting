# encoding: utf-8

#require 'rake/apeiron/gemtasks'

namespace :gem do
  task :prepare do
    lib_dir = File.expand_path('lib') # Rake ensures that the working directory is the project root
    $LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include? lib_dir

    require 'sorting/version'
    require 'rubygems/specification'
    require 'rubygems/gem_runner'
  end

  desc 'Verify whether the gem can be built'
  task :verify => :prepare do
    gemspec = Gem::Specification.load(Dir.glob('*.gemspec').first)
    unless gemspec.version == Sorting::Version
      abort "Gemspec version differs from Sorting::Version - gemspec: #{gemspec.version}, Sorting::Version: #{Sorting::Version}"
    end
    if ENV["VERSION"] && Sorting::Version != Gem::Version.new(ENV["VERSION"])
      abort "Specified version differs from Sorting::Version - specified: #{Gem::Version.new(ENV["VERSION"])}, Sorting::Version: #{Sorting::Version}"
    end
  end

  desc 'Build the .gem file from the .gemspec'
  task :build => [:prepare, :verify] do
    Gem::GemRunner.new.run ['build', Dir.glob('*.gemspec').first]
  end

  desc 'Build and install the .gem file from the .gemspec'
  task :install => [:prepare, :build] do
    Gem::GemRunner.new.run ['install', '-l', Dir.glob('*.gem').first]
  end

  desc 'Build the .gem file from the .gemspec and push it to rubygems.org'
  task :push => [:prepare, :build] do
    abort "Set the VERSION env variable to push" unless ENV["VERSION"]
    gem_file = Dir.glob('*.gem').first
    a        = rand(0..9)
    b        = rand(1..9)
    puts "Pushing #{gem_file}"
    puts "What's the result of #{a}+#{b}?"
    print "> "
    $stdout.flush
    abort "Wrong answer" unless $stdin.gets.to_i == a+b

    #Gem::GemRunner.new.run ['push', Dir.glob('*.gem').first]
  end
end

task :gem => 'gem:build'
