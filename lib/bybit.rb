
class Bybit < ExchangeRate
  def self.get_rates(support_currencies = nil)
    support_currencies = get_support_currencies unless support_currencies
    ans = {}

    begin
      info = RestClient.get "https://api.bybit.com/v2/public/tickers"
      info = JSON.parse(info)
      
      support_currencies.each do |quote, bases|
        bases.each do |base|
          pair = info["result"].select{|i| i["symbol"] == "#{base.upcase}#{quote.upcase}"}
          ans["#{base}/#{quote}"] = pair.first["last_price"]
        end
      end
  
    rescue Exception => e
      puts "error : get_bitoex_rate #{e}"
    end

    return ans
  end

  def self.get_support_currencies
    return {"USDT" => ["BTC"], "USD" => ["BTC"]}
  end
end



