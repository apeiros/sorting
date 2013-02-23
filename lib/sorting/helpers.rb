# encoding: utf-8



require 'sorting/ascending'
require 'sorting/descending'



module Sorting

  # This module provides convenience methods to create Sorting::Ascending and
  # Sorting::Descending instances.
  #
  # Important: see {Sorting::Helpers.append_to} for how to properly use this
  # module with other modules
  #
  # @note
  #   require 'sorting' loads this module
  #
  module Helpers

    # The proc with the method definitions of asc and desc.
    # See {Sorting::Helpers.append_to} for an explanation.
    MethodDefinitions = proc {

      # Convenience method to create a Sorting::Ascending instance.
      # Works exactly the same as {Sorting::Ascending#initialize}
      def asc(*args, &lazy)
        Sorting::Ascending.new(*args, &lazy)
      end
      module_function :asc

      # Convenience method to create a Sorting::Descending instance.
      # Works exactly the same as {Sorting::Descending#initialize Ascending#initialize}
      def desc(*args, &lazy)
        Sorting::Descending.new(*args, &lazy)
      end
      module_function :desc
    }

    # Adds the Sorting::Helpers methods 'asc' and 'desc' to the given module.
    # This method class_eval because modules included into modules don't
    # properly share methods
    #
    # @param [Module] mod
    #   The class or module on which to append the Sorting::Helpers methods
    #
    # @note
    #   The methods are stored in the {Sorting::Helpers::MethodDefinitions}
    #   proc. That proc is class_eval'ed in in the module given by the `mod`
    #   parameter.
    #   It is done that way to avoid an issue with methods of modules which are
    #   included in another module not being properly shared
    #
    def self.append_to(mod)
      mod.class_eval(&MethodDefinitions)
    end

    append_to(self)

    # @!method asc(*args, &lazy)
    #   @!scope class
    #   Convenience method to create a Sorting::Ascending instance.
    #   Works exactly the same as {Sorting::Ascending#initialize}.
    #
    #   @note
    #     This method is a module function, and as such also available as a
    #     private instance method.

    # @!method desc(*args, &lazy)
    #   @!scope class
    #   Convenience method to create a Sorting::Descending instance.
    #   Works exactly the same as {Sorting::Ascending#initialize
    #   Descending#initialize}.
    #
    #   @note
    #     This method is a module function, and as such also available as a
    #     private instance method.
  end
end
