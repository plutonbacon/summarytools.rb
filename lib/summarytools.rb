require 'summarytools/version'
require 'summarytools/describer'

module SummaryTools
  class << self

    def descr(array)
      d = Describer.new
      d.perform(array)
    end # def descr

  end # class Self
end # module SummaryTools
