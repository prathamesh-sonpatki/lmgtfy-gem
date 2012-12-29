require 'spec_helper'
require 'lmgtfy/runner'

describe Lmgtfy::Runner do

  before do
    @query = URI.encode_www_form([['q', ARGV.join(' ')]])
  end

  it "accepts search query from the user" do
    runner = Lmgtfy::Runner.new
    runner.query.should eq @query
  end

  it "generates correct url" do
    runner = Lmgtfy::Runner.new
    runner.generate_lmgtfy_url.should eq "http://lmgtfy.com/?#{@query}"
  end

end
