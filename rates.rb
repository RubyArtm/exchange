# frozen_string_literal: true

# Rates class stores and formats currency exchange rate data
# from the European Central Bank
class Rates
  attr_reader :currency, :rate, :time

  def initialize(currency:, rate:, time:)
    @currency = currency
    @rate = rate
    @time = time
  end

  def to_s
    result = []
    result << "Date: #{@time}" if @time
    result << "Currency: #{@currency}" if @currency
    result << "1 Euro is equal to: #{@rate} #{@currency}" if @rate
    result << "\n"
    result.join("\n")
  end
end
