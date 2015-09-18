unless Enumerable.method_defined? :mean
  module Enumerable
    # Calculates the mean of a numeric collection.
    #
    # @param default [Object] an optional default return value if there are
    #   no elements. It is nil by default.
    # @return The mean of the elements or the default value if there are no
    #   elements.
    #
    # @example
    #   [1, 2, 3, 4, 5].mean #=> 3
    #   [].mean #=> nil
    #   [].mean(0) #=> 0
    def mean(default = nil)
      coll_size = to_a.size
      coll_size > 0 ? reduce(&:+) / coll_size.to_f : default
    end # def mean
  end # module Enumerable
end
