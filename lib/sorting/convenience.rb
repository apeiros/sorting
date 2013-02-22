# encoding: utf-8



require 'sorting'



module Kernel
  include Sorting::Helpers
  module_function *Sorting::Helpers.public_instance_methods
end
