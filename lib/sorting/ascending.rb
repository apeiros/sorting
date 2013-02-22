# encoding: utf-8



module Sorting

  # This class is used to implement 'asc' (ascending) sorting.
  # You should not need to use this class directly.
  # You can `require 'sorting/convenience'` and then use Kernel#asc,
  # or you can `require 'sorting'` and then use Sorting#asc (which
  # is a module_function, and hence available as Sorting::asc)
  #
  # @see Sorting::Helpers
  #   Sorting::Helpers is a module which provides you with a convenient .asc
  #   forwarding method
  #
  # @see Sorting#asc
  #   Sorting#asc is the common way to create a Sorting::Ascending instance
  #
  # @see Sorting::Descending
  #   Sorting::Descending is the opposite of Sorting::Ascending
  #
  class Ascending

    # Valid values for the treat_nils parameter of Sorting::Ascending#initialize
    NilsValues = [:nils_first, :nils_last, nil]

    include Comparable

    # How nils values are treated
    #
    # @see NilsValues The list with all possible values
    attr_reader :treat_nils

    # @overload initialize(value, treat_nils=nil)
    #
    #   Create an ascending sorted value
    #
    #   @param [Comparable, #<=>] value
    #     The value to compare.
    #     Any object which implements <=> (or nil if you set treat_nils).
    #
    #   @param [nil, Symbol] treat_nils
    #     One of nil, :nils_first, :nils_last. With nil, a normal exception
    #     will be raised when compared with nil. With :nils_first, a nil will
    #     always be considered smaller and hence be sorted to the beginning,
    #     with :nils_last, a nil will always be considered bigger and hence be
    #     sorted to the end.
    #
    #
    # @overload initialize(treat_nils=nil, &value)
    #
    #   Create an ascending sorted value, where the value is lazily computed.
    #   This is useful for values which are expensive to compute.
    #
    #   @param [nil, Symbol] treat_nils
    #     One of nil, :nils_first, :nils_last. With nil, a normal exception
    #     will be raised when compared with nil. With :nils_first, a nil will
    #     always be considered smaller and hence be sorted to the beginning,
    #     with :nils_last, a nil will always be considered bigger and hence be
    #     sorted to the end.
    #
    #   @yieldreturn [Comparable, #<=>]
    #     The value to compare.
    #     Any object which implements <=> (or nil if you set treat_nils).
    #
    def initialize(*args, &lazy)
      @memoized   = lazy ? false : true
      @value      = lazy || args.first
      @treat_nils = args[lazy ? 0 : 1]

      unless NilsValues.include?(@treat_nils)
        raise ArgumentError, "Invalid value for nils, expected :nils_first or :nils_last, got #{@treat_nils.inspect}"
      end
      if lazy
        raise ArgumentError, "wrong number of arguments (#{args.size} for 0..1" unless args.size.between?(0, 1)
      else
        raise ArgumentError, "wrong number of arguments (#{args.size} for 1..2" unless args.size.between?(1, 2)
      end
    end

    # Whether nils are always considered smaller.
    def nils_first?
      @nils == :nils_first
    end

    # Whether nils are always considered bigger.
    def nils_last?
      @nils == :nils_last
    end

    # @return [Comparable, #<=>, nil]
    #   The comparable value. If the Ascending object was constructed with a
    #   lazy block, the block will be executed the first time this method is
    #   called.
    #
    def value
      if @memoized
        @value
      else
        @memoized = true
        @value    = @value.call
      end
    end

    # @return [-1, 0, 1, nil]
    #   Comparison. Returns -1, 0, or +1 depending on whether `other` is less
    #   than, equal to, or greater than `self`.
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
          my_value <=> other_value
        end
      end
    end
  end
end
