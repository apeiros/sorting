# encoding: utf-8



require 'sorting/ascending'
require 'sorting/descending'



module Sorting

  # This module provides convenience methods to create Sorting::Ascending and
  # Sorting::Descending instances.
  module Helpers
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
