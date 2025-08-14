class Rate
  def initialize(charCode:, name:, vunitRate:)
    @charCode = charCode
    @name = name
    @vunitRate = vunitRate
  end

  def self.valute_rate(valute_element)
    new(
      charCode: valute_element.elements["CharCode"].text,
      name: valute_element.elements["Name"].text,
      vunitRate: valute_element.elements["VunitRate"].text
    )
  end

  def to_s
    result = []
    result << "Валюта: #{@name}" if @name
    result << "1 #{@charCode} равен:" if @charCode
    result << "#{@vunitRate} руб." if @vunitRate
    result << "\n"
    result.join("\n")
  end
end
