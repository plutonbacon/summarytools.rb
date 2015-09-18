unless Enumerable.method_defined? :sd
  module Enumerable
    def variance
      sum = inject(0) { |accum, i| accum + (i - mean) ** 2}
      sum/(length - 1).to_f
    end # def variance

    def sd
      Math.sqrt(variance)
    end # def sd
  end # module Enumerable
end
