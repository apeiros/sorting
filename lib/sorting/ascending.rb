# encoding: utf-8



module Sorting

  # This class is used to implement 'desc' sorting.
  # It simply inverts the comparison.
  class Ascending
    NilsValues = [:nils_first, :nils_last, nil]

    include Comparable

    def initialize(*args, &lazy)
      @memoized = lazy ? false : true
      @value    = lazy || args.shift
      @nils     = args.first

      unless NilsValues.include?(@nils)
        raise ArgumentError, "Invalid value for nils, expected :nils_first or :nils_last, got #{@nils.inspect}"
      end
    end

    def value
      if @memoized
        @value
      else
        @memoized = true
        @value    = @value.call
      end
    end

    def <=>(other)
      my_value = value

      if @nils && my_value.nil?
        @nils == :nils_first ? -1 : 1
      else
        other_value = other.value

        if @nils && other_value.nil?
          @nils == :nils_first ? 1 : -1
        else
          my_value <=> other_value
        end
      end
    end
  end
end
