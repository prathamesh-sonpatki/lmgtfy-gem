module Lmgtfy
  class Runner

    attr_reader :query

    def initialize
      @query = ARGV[0]
    end

  end
end
