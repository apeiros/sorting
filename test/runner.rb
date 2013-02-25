# run with `ruby test/runner.rb`
# if you only want to run a single test-file: `ruby test/runner.rb testfile.rb`

if ENV['COVERAGE'] # IMPORTANT! It seems simplecov must be required before anything else, not just the code-under-test
  require 'simplecov'
  SimpleCov.start do
    add_filter "/test/"
    add_filter "/examples/"
  end
end

$LOAD_PATH << File.expand_path('../../lib', __FILE__)
$LOAD_PATH << File.expand_path('../../test/lib', __FILE__)

require 'test/unit'
require 'sorting_test/helper'

units = ARGV.empty? ? Dir["#{TEST_DIR}/unit/**/*.rb"] : ARGV

units.each do |unit|
  load unit
end
