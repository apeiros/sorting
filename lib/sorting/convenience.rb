# encoding: utf-8

# The sorting/convenience.rb file adds Kernel#asc and Kernel#desc for
# convenience. The methods are defined as module functions (see
# Module#module_function), and hence also available as Kernel.asc and
# Kernel.desc



require 'sorting'



# The 'sorting/convenience' file patches the Kernel module and adds global
# `asc()` and `desc()` methods, which work like {Sorting::Helpers.asc} and
# {Sorting::Helpers.desc}
#
# @note
#   you have to require 'sorting/convenience' to load this
#
module Kernel
  Sorting::Helpers.append_to(self) # can't use include, see Sorting::Helpers.append_to

  # @!method asc(*args, &lazy)
  #   @!scope class
  #   @see Sorting::Helpers.asc
  #
  #   @note
  #     This method is a module function, and as such also available as a
  #     private instance method.

  # @!method desc(*args, &lazy)
  #   @!scope class
  #   @see Sorting::Helpers.desc
  #
  #   @note
  #     This method is a module function, and as such also available as a
  #     private instance method.
end
