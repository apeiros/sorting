# encoding: utf-8



require 'sorting/ascending'



module Sorting

  # This class is used to implement 'desc' sorting.
  # It simply inverts the comparison.
  class Descending < Ascending
    def <=>(other)
      my_value = value

      if @nils && my_value.nil?
        @nils == :nils_first ? -1 : 1
      else
        other_value = other.value

        if @nils && other_value.nil?
          @nils == :nils_first ? 1 : -1
        else
          other_value <=> my_value
        end
      end
    end
  end
end
