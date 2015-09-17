require 'summarytools/version'
require 'summarytools/core_extensions/enumerable'
require 'summarytools/describer'

module SummaryTools
  class << self

    # Generates common central tendency statistics and measures of
    # dispersion for numerical data.
    #
    # @return [Hash]
    def descr(array)
      d = Describer.new(array)
      d.describe
    end # def descr

  end # class Self
end # module SummaryTools
