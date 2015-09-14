module SummaryTools
  class Describer

    private

    def check_type(array)
      array.each { |e|
        raise TypeError, "Nonnumeric contents detected" if !e.kind_of?(Numeric)
      }
    end # def check_type

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

    def perform(array)
      check_type(array)

      stats = {}
      stats[:mean] = array.inject(:+).to_f / array.length

      sd = sdaccum
      tmp = []
      array.each {|n| tmp.push(sd.call(n))}
      stats[:stddev] = tmp.last

      stats[:min] = array.min
      stats[:max] = array.max
      stats[:median] = compute_median(array)
      return stats
    end # def perform

    public(:perform)
  end # class Describer
end # module SummaryTools
