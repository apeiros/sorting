# encoding: utf-8



require 'sorting/ascending'
require 'sorting/bigger'
require 'sorting/descending'
require 'sorting/helpers'
require 'sorting/smaller'
require 'sorting/version'



# Sorting
# Helpful functionality for sorting and comparing.
module Sorting
  include Helpers
  module_function *Sorting::Helpers.public_instance_methods
end
