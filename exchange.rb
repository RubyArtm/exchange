# frozen_string_literal: true

require 'rexml/document'
require 'uri'
require 'net/http'
require 'date'
require_relative 'rates'

begin
  uri = URI.parse('https://www.ecb.europa.eu/stats/eurofxref/eurofxref-daily.xml')
  response = Net::HTTP.get_response(uri)

  unless response.is_a?(Net::HTTPSuccess)
    puts "HTTP Error: #{response.code} #{response.message}"
    exit 1
  end

  doc = REXML::Document.new(response.body)
  needed_currency = %w[USD JPY CZK]

  doc.elements.each('gesmes:Envelope/Cube/Cube') do |date_cube|
    time = Date.parse(date_cube.attributes['time'])

    date_cube.elements.each('Cube') do |currency_cube|
      currency = currency_cube.attributes['currency']

      next unless needed_currency.include?(currency)

      rate = currency_cube.attributes['rate'].to_f
      rate_obj = Rates.new(currency: currency, rate: rate, time: time)
      puts rate_obj
    end
  end
rescue URI::InvalidURIError => e
  puts "Invalid URI: #{e.message}"
rescue Net::HTTPError => e
  puts "HTTP request failed: #{e.message}"
rescue REXML::ParseException => e
  puts "XML parsing error: #{e.message}"
rescue StandardError => e
  puts "Unexpected error: #{e.message}"
end
