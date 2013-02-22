# encoding: utf-8

# The sorting/convenience.rb file adds Kernel#asc and Kernel#desc for
# convenience. The methods are defined as module functions (see
# Module#module_function), and hence also available as Kernel.asc and
# Kernel.desc



require 'sorting'



# @private
module Kernel
  class_eval(&Sorting::Helpers::MethodDefinitions)
  module_function *Sorting::Helpers.private_instance_methods(false)
end
