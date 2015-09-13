module SummaryTools
  class Describer

    private

    def check_type(array)
      array.each { |e|
        raise TypeError, "Nonnumeric contents detected" if !e.kind_of?(Numeric)
      }
    end # def check_type

    def compute_median(array)
      mid = array.length / 2
      sorted = array.sort
      array.length.odd? ? sorted[mid] : 0.5 * (sorted[mid] + sorted[mid-1])
    end # def compute_median

    def perform(array)
      check_type(array)

      stats = {}
      stats[:min] = array.min
      stats[:max] = array.max
      stats[:mean] = array.inject(:+).to_f / array.length
      stats[:median] = compute_median(array)
      return stats
    end # def perform

    public(:perform)
  end # class Describer
end # module SummaryTools
