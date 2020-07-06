
class Kucoin < ExchangeRate
  def self.get_rates(support_currencies = nil)
    support_currencies = get_support_currencies unless support_currencies
    ans = {}

    begin
      info = RestClient.get "https://api.kucoin.com/api/v1/market/allTickers"
      info = JSON.parse(info)
      
      support_currencies.each do |quote, bases|
        bases.each do |base|
          pair = info["data"]["ticker"].select{|i| i["symbol"] == "#{base.upcase}-#{quote.upcase}"}
          ans["#{base}/#{quote}"] = pair.first["last"].to_s
        end
      end
  
    rescue Exception => e
      puts "error : get_bitoex_rate #{e}"
    end

    return ans
  end

  def self.get_support_currencies
    return {"BTC" => ["NRG"], "USDT" => ["BTC"]}
  end
end



