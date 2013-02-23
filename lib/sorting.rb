# encoding: utf-8



require 'sorting/ascending'
require 'sorting/bigger'
require 'sorting/descending'
require 'sorting/helpers'
require 'sorting/smaller'
require 'sorting/version'



# Sorting
# Helpful functionality for sorting and comparing.
#
# Requiring 'sorting' loads all functionality this gem provides, except for the
# patches on Kernel. For those you must `require 'sorting/convenience'`.
#
# @example Convenient
#     require 'sorting/convenience'
#     people.sort_by { |person| [asc(person.first_name), asc(person.last_name), desc(person.age)] }
#
# @example Or without patching Kernel
#     require 'sorting'
#     people.sort_by { |person|
#       [Sorting.asc(person.first_name), Sorting.asc(person.last_name), Sorting.desc(person.age)]
#     }
#
# @example Care about expensive comparison values which may not always be needed
#     # assume item.expensive_value takes a lot of time to compute, but since it's the second value,
#     # it might only be needed in a small number of cases.
#     require 'sorting/convenience'
#     items.sort_by { |item|
#       [asc(item.cheap_value), asc(:nils_last) { item.expensive_value }]
#     }
#
# @example Care about nil values in your data
#     require 'sorting/convenience'
#     people.sort_by { |person|
#       [asc(person.first_name, :nils_first), asc(person.first_name, :nils_last)]
#     }
#
# @example Only care about nil values in your data
#     [5,3,nil,9].sort_by { |x| x || Sorting::Bigger } # Sorting::Smaller is available too
#
module Sorting
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
