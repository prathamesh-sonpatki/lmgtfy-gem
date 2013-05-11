require 'json'
require 'net/http'
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

    def generate_short_url
      base_url = "http://is.gd/create.php?format=json&url="
      string = "http://lmgtfy.com/?#{@query}"
      begin
        response = Net::HTTP.get_response(URI.parse(base_url + string))
        JSON.parse(response.body)["shorturl"]
      rescue
        "No internet connection"
      end
    end

  end

end
