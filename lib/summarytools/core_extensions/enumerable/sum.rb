unless Enumerable.method_defined? :sum
  module Enumerable
    # Sums up elements of a collection by invoking their `+` method.
    #
    # @param default [Object] an optional default return value if there are
    #   no elements. It is nil by default.
    # @return The sum of the elements or the default value if there are no 
    #   elements.
    #
    # @example
    #   [1, 2, 3, 4, 5].sum #=> 15
    #   ["a", "b", "c"].sum #=> "abc"
    #   [].sum #=> nil
    #   [].sum(0) #=> 0
    def sum(identify = nil)
      reduce(&:+) || default
    end # def sum
  end # module Enumerable
end
