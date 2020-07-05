
class BitoEX < ExchangeRate
  def self.get_rates(support_currencies = nil)
    support_currencies = get_support_currencies unless support_currencies
    ans = {}
    now = Time.now.to_i

    begin
      info = RestClient.get "https://www.bitoex.com/api/v0/rate/#{now}"
      info = JSON.parse(info)
      
      support_currencies["TWD"].each do |base|
        buy_price = info[base][0].gsub(',', '')
        sell_price = info[base][1].gsub(',', '')
        ans["#{base}/TWD"] = "%.2f" % ((BigDecimal(buy_price) + BigDecimal(sell_price)) / 2).truncate(2)
      end
  
    rescue Exception => e
      puts "error : get_bitoex_rate #{e}"
    end

    return ans
  end

  def self.get_support_currencies
    {"TWD" => ['BTC', 'ETH', 'USDT']}
  end
end