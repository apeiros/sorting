# encoding: utf-8



module Sorting

  # The following two objects can be used as default values in sorting.
  # Example:
  #   person.age || Sorting::Bigger
  Bigger = Object.new
  Bigger.extend Comparable
  def Bigger.inspect; "#<Bigger>"; end
  def Bigger.<=>(other); equal?(other) ? 0 : 1; end
  def Bigger.coerce(other); [Smaller, self]; end
  def Bigger.to_datetime; self; end # Rails' ActiveSupport patches DateTime incorrectly (doesn't use coerce) - this is a workaround
  def Bigger.to_str; self; end
end
