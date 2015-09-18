unless Enumerable.method_defined? :median
  module Enumerable
    def median(default = nil)
      sorted = sort
      (sorted[(length - 1) / 2] + sorted[length / 2]) / 2.0
    end # def median
  end # module Enumerable
end
