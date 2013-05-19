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
      begin
        get_shortened_url_from_is_gd
      rescue Exception => ex
        ex.message
      end
    end

    private

    def get_shortened_url_from_is_gd
      base_url          = "http://is.gd/create.php?format=json&url="
      is_gd_request_url = URI.parse(base_url + generate_lmgtfy_url)
      JSON.parse(Net::HTTP.get_response(is_gd_request_url).body).fetch("shorturl")
    end

  end

end
