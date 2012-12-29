require 'uri'

module Lmgtfy

  class Runner

    attr_reader :query

    def initialize
      @query = URI.encode_www_form([ ["q", ARGV.join(" ")] ])
    end

    def generate_lmgtfy_url
      "http://lmgtfy.com/?#{@query}"
    end

  end

end
