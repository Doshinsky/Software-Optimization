require "open-uri"
require "nokogiri"

class Wiki_Parser
  def initialize()
    url = 'https://en.wikipedia.org/wiki/Ontario'
    html = open(url)
    @doc = Nokogiri::HTML(html)
  end

  def parser()
    population = @doc.css('tr[class="mergedrow"]')[13].css('td').text
    puts "Total population of Ontario is: " + population
  end
end

input = Wiki_Parser.new
input.parser
