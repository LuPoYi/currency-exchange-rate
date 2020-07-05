
class Ftx < ExchangeRate
  def self.get_rates(support_currencies = nil)
    support_currencies = get_support_currencies unless support_currencies
    ans = {}

    begin
      info = RestClient.get "https://ftx.com/api/futures"
      info = JSON.parse(info)
      
      support_currencies.each do |quote, bases|
        bases.each do |base|
          pair = info["result"].select{|i| i["name"] == "#{base.upcase}-#{quote.upcase}"}
          ans["#{base}/#{quote}"] = pair.first["last"]
        end
      end
  
    rescue Exception => e
      puts "error : get_bitoex_rate #{e}"
    end

    return ans
  end

  def self.get_support_currencies
    return {"PERP" => ["BTC", ]}
  end
end



