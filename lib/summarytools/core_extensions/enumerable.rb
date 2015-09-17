module Enumerable
  # Calculates a sum from the elements.
  #
  # The default sum of an empty list is zero.
  def sum(identity = 0, &block)
    if block_given?
      map(&block).sum(identity)
    else
      inject { |sum, element| sum + element } || identity
    end
  end # def sum

  def mean
    self.sum/self.length.to_f
  end # def mean

  def sample_variance
    m = self.mean
    sum = self.inject(0){|accum, i| accum + (i-m)**2}
    sum/(self.length - 1).to_f
  end # def sample_variance

  def sd
    return Math.sqrt(self.sample_variance)
  end # def sd

end # module Enumerable
