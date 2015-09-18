module SummaryTools
  class Describer

    attr_reader :data

    private

    def initialize(_data)
      @data = _data
    end # def initialize

    def compute_kurtosis
      fo = @data.inject(0) { |accum, x| accum + ((x - @data.mean) ** 4)}
      fo.quo((@data.size) * @data.sd ** 4) - 3
    end # compute_kurtosis

    def compute_skewness
      th = @data.inject(0){|a,x| a + ((x - @data.mean) ** 3)}
      th.quo((@data.size) * @data.sd ** 3)
    end # compute_skewness

    def find_quartile(quartile)
      sorted = @data.sort
      return sorted.last if quartile == 4
      # Source: http://mathworld.wolfram.com/Quartile.html
      quartile_position = 0.25 * (quartile*sorted.length + 4 - quartile)
      quartile_int = quartile_position.to_i
      lower = sorted[quartile_int - 1]
      upper = sorted[quartile_int]
      lower + (upper - lower) * (quartile_position - quartile_int)
    end # def find_quartile

    def compute_iqr
      return find_quartile(3) - find_quartile(1)
    end # def compute_iqr

    def compute_mad
      absdev = []
      data.each {|n|
        absdev.push((n - @data.median).abs)
      }
      return absdev.median
    end # def compute_mad

    def describe
      stats = {}
      stats[:mean]       = @data.mean
      stats[:sd]         = @data.sd
      stats[:min]        = @data.min
      stats[:max]        = @data.max
      stats[:median]     = @data.median
      stats[:mad]        = compute_mad
      stats[:iqr]        = compute_iqr
      stats[:cv]         = stats[:sd] / stats[:mean].abs
      stats[:skewness]   = compute_skewness
      stats[:kurtosis]   = compute_kurtosis
      return stats
    end # def describe

    public(:initialize, :describe)
  end # class Describer
end # module SummaryTools
