require 'rexml/document'
require 'uri'
require 'net/http'
require 'date'
require_relative 'rate'

uri = URI.parse('https://www.cbr.ru/scripts/XML_daily.asp?date_req=' + Date.today.strftime('%d/%m/%Y'))

response = Net::HTTP.get_response(uri)
doc = REXML::Document.new(response.body)

needed_codes = ['840', '978', '949']

doc.elements.each('ValCurs/Valute') do |valute|
  if needed_codes.include?(valute.elements['NumCode'].text)
    puts Rate.valute_rate(valute)
  end

end