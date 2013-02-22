# encoding: utf-8



require 'sorting/ascending'
require 'sorting/descending'



module Sorting

  # This module provides convenience methods to create Sorting::Ascending and
  # Sorting::Descending instances.
  module Helpers

    # The proc with the method definitions of asc and desc.
    # They are in a proc so the proc can be class_eval'ed in Sorting and Kernel
    # to avoid an issue with methods of modules which are included in another
    # module not being properly shared
    #
    MethodDefinitions = proc {

      # Convenience method to create a Sorting::Ascending instance.
      # Works exactly the same as {Sorting::Ascending#initialize}
      def asc(*args, &lazy)
        Sorting::Ascending.new(*args, &lazy)
      end
      private :asc

      # Convenience method to create a Sorting::Descending instance.
      # Works exactly the same as {Sorting::Ascending#initialize Descending#initialize}
      def desc(*args, &lazy)
        Sorting::Descending.new(*args, &lazy)
      end
      private :desc
    }

    class_eval(&MethodDefinitions)
  end
end
