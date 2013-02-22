# encoding: utf-8



require 'sorting/ascending'
require 'sorting/descending'



module Sorting
  module Helpers
    def asc(*args, &lazy)
      Sorting::Ascending.new(*args, &lazy)
    end

    def desc(*args, &lazy)
      Sorting::Descending.new(*args, &lazy)
    end
  end
end
