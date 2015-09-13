module SummaryTools
  class Describer

    private

    def check_type(array)
      array.each do |e|
        raise TypeError, "Nonnumeric contents detected", if e.kind_of?(Numeric)
      end
    end

    def perform(array)
      check_type(array)
      
      stats[:mean] = array.inject(:+).to_f / array.length
    end # def perform

    public(:perform)
  end # class Describer
end # module SummaryTools
