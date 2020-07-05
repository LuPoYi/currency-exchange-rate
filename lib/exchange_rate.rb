class ExchangeRate
  def self.get_rate(support_currencies)
    return {} # {"USD/TWD": 29.8, "JPN/TWD": 0.28}
  end

  def self.get_support_currencies
    # {quote => [base, base...]}
    # {"TWD" => ["USD", "JPN"]}
    return {}
  end
end