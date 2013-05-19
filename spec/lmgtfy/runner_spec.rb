require 'spec_helper'
require 'lmgtfy/runner'

describe Lmgtfy::Runner do

  before do
    @query  = URI.encode_www_form([['q', ARGV.join(' ')]])
    @runner = Lmgtfy::Runner.new
  end

  it "accepts search query from the user" do
    expect(@runner.query).to eq @query
  end

  it "generates correct long url" do
    expect(@runner.generate_lmgtfy_url).to eq "http://lmgtfy.com/?#{@query}"
  end

  it "generates short url" do
    # except(@runner.generate_short_url).to_eq "http://lmgtfy.com/?#{@query}"
  end
end
