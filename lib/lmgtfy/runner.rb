module Lmgtfy

  class Runner

    attr_reader :query

    def initialize
      @query = ARGV[0]
    end

    def generate_lmgtfy_url
      "http://lmgtfy.com/?q=#{@query}"
    end

  end

end
