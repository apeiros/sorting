# encoding: utf-8



module Sorting

  # The following two objects can be used as default values in sorting.
  # Example:
  #   person.age || Sorting::Smaller
  Smaller = Object.new
  Smaller.extend Comparable
  def Smaller.inspect; "#<Smaller>"; end
  def Smaller.<=>(other); equal?(other) ? 0 : -1; end
  def Smaller.coerce(other); [Bigger, self]; end
  def Smaller.to_datetime; self; end # Rails' ActiveSupport patches DateTime incorrectly (doesn't use coerce) - this is a workaround
  def Smaller.to_str; self; end
end
