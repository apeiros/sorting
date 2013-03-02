#!/usr/bin/env ruby
# encoding: utf-8

# run with `ruby test/runner.rb` (or just `./test/runner.rb`)
# if you only want to run a single test-file: `ruby test/runner.rb testfile.rb`

if ENV['COVERAGE'] # IMPORTANT! It seems simplecov must be required before anything else, not just the code-under-test
  require 'simplecov'
  SimpleCov.start do
    add_filter "/test/"
    add_filter "/examples/"
  end
end

PROJECT_DIR = File.expand_path('../../', __FILE__)
TEST_DIR    = File.join(PROJECT_DIR, 'test')

$LOAD_PATH << File.expand_path('lib', PROJECT_DIR)
$LOAD_PATH << File.expand_path('lib', TEST_DIR)

require 'test/unit'
require 'sorting_test/helper'

units = ARGV.empty? ? Dir["#{TEST_DIR}/unit/**/*.rb"] : ARGV

units.each do |unit|
  load unit
end
