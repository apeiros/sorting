# run with `ruby test/runner.rb`
# if you only want to run a single test-file: `ruby test/runner.rb testfile.rb`

$LOAD_PATH << File.expand_path('../../lib', __FILE__)
$LOAD_PATH << File.expand_path('../../test/lib', __FILE__)

require 'test/unit'
require 'sorting_test/helper'

if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start
end

units = ARGV.empty? ? Dir["#{TEST_DIR}/unit/**/*.rb"] : ARGV

units.each do |unit|
  load unit
end
