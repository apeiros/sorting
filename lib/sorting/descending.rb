# encoding: utf-8



require 'sorting/ascending'



module Sorting

  # This class is used to implement 'desc' (descending) sorting.
  # You should not need to use this class directly.
  # You can `require 'sorting/convenience'` and then use Kernel#desc,
  # or you can `require 'sorting'` and then use Sorting#desc (which
  # is a module_function, and hence available as Sorting::desc)
  #
  # @see Sorting::Helpers
  #   Sorting::Helpers is a module which provides you with a convenient .desc
  #   forwarding method
  #
  # @see Sorting.desc
  #   Sorting.desc is the common way to create a Sorting::Descending instance,
  #   or if you required 'sorting/convenience', then plain asc via Kernel#desc
  #
  # @see Sorting::Ascending
  #   Sorting::Ascending is the opposite of Sorting::Descending
  #
  # @note
  #   require 'sorting' loads this class
  #
  class Descending < Ascending

    # @return [-1, 0, 1, nil]
    #   Works reversed to how <=> works normally, i.e. it returns -1 when normal
    #   <=> would return 1, and vice versa.
    #   Comparison. Returns -1, 0, or +1 depending on whether `other` is greater
    #   than, equal to, or less than `self`.
    #   Comparison with nil is special cased when #treat_nils is set.
    #   If #treat_nils is :nils_first, it will always return 1, if it is
    #   :nils_last, it will always return -1.
    #   Returns nil when the value could not be compared to with `other`.
    #
    def <=>(other)
      my_value = value

      if @treat_nils && my_value.nil?
        @treat_nils == :nils_first ? -1 : 1
      else
        other_value = other.value

        if @treat_nils && other_value.nil?
          @treat_nils == :nils_first ? 1 : -1
        else
          other_value <=> my_value
        end
      end
    end
  end
end
