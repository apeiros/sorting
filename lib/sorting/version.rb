# encoding: utf-8

begin
  require 'rubygems/version' # newer rubygems use this
rescue LoadError
  require 'gem/version' # older rubygems use this
end

module Sorting

  # The version of the sorting gem.
  Version = Gem::Version.new("0.0.2")
end
