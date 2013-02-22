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
# @example Care about nil values in your data
#     require 'sorting/convenience'
#     people.sort_by { |person|
#       [asc(person.first_name, :nils_first), asc(person.first_name, :nils_last)]
#     }
#
# @example Only care about nil values in your data
#     [5,3,nil,9].sort_by { |x| x || Sorting::Bigger } # Sorting::Smaller is available too
#
# @example Care about expensive comparison values which may not always be needed
#     # assume item.expensive_value takes a lot of time to compute, but since it's the second value,
#     # it might only be needed in a small number of cases.
#     require 'sorting/convenience'
#     items.sort_by { |item|
#       [asc(item.cheap_value), asc(:nils_last) { item.expensive_value }]
#     }
#
module Sorting
  class_eval(&Sorting::Helpers::MethodDefinitions)
  module_function *Sorting::Helpers.private_instance_methods(false)
end
