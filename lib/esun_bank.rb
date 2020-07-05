class EsunBank < ExchangeRate
  def self.get_rates(support_curencies = nil)
    support_curencies = get_support_curencies unless support_curencies

    ans = {}
    url = "https://www.esunbank.com.tw/bank/personal/deposit/rate/forex/foreign-exchange-rates"
    doc = Nokogiri::HTML(open(URI.encode(url)))

    rate_set = doc.search('#inteTable1  tr:not(.titleRow)')
    rate_set.each do |a|
      currency = nil
      currency_info = a.search('td.itemTtitle a')[0].content # USD
      support_curencies["TWD"].each do |base|
        if currency_info.include? base
          currency = base
          break
        end
      end
      
      if currency
        spot_selling = a.search('td.odd')[0].content
        spot_buying = a.search('td.even')[0].content
        ans["#{currency}/TWD"] = "%.4f" % ((BigDecimal(spot_selling) + BigDecimal(spot_buying)) / 2).truncate(4)
      end
    end
    
    return ans
  end

  def self.get_support_curencies
    {"TWD" => ['USD', 'JPY', 'EUR', 'AUD', 'GBP']}
  end
end