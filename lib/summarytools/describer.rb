module SummaryTools
  class Describer

    attr_reader :array

    private

    def initialize(_array)
      check_type(_array)
      @array = _array
    end # def initialize

    def check_type(array)
      array.each { |e|
        raise TypeError, "Nonnumeric contents detected" if !e.kind_of?(Numeric)
      }
    end # def check_type

    def compute_skewness(mean)
      th=@array.inject(0){|a,x| a+((x-mean)**3)}
      th.quo((@array.size)*compute_stddev**3)
    end # compute_skewness

    def find_quartile(quartile)
      sorted = @array.sort
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
      median = compute_median(@array)
      @array.each {|n|
        absdev.push((n-median).abs)
      }
      return compute_median(absdev)
    end # def compute_mad

    def sdaccum
      n, sum, sum2 = 0, 0.0, 0.0
      lambda do |num|
        n += 1
        sum += num
        sum2 += num**2
        Math.sqrt((sum2/n)-(sum/n)**2)
      end
    end # def sdaccum

    def compute_median(array)
      mid = array.length / 2
      sorted = array.sort
      array.length.odd? ? sorted[mid] : 0.5 * (sorted[mid] + sorted[mid-1])
    end # def compute_median

    def compute_stddev
      sd  = sdaccum
      tmp = []
      @array.each {|n| tmp.push(sd.call(n))}
      return tmp.last
    end # def compute_stddev

    def describe
      stats = {}
      stats[:mean]       = @array.inject(:+).to_f / @array.length
      stats[:stddev]     = compute_stddev
      stats[:min]        = @array.min
      stats[:max]        = @array.max
      stats[:median]     = compute_median(@array)
      stats[:mad]        = compute_mad
      stats[:iqr]        = compute_iqr
      stats[:cv]         = stats[:stddev] / stats[:mean].abs
      stats[:skewness]   = compute_skewness(stats[:mean])
      return stats
    end # def describe

    public(:initialize, :describe)
  end # class Describer
end # module SummaryTools
