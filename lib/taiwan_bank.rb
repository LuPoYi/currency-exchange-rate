class TaiwanBank < ExchangeRate
  def self.get_rates(support_curencies = nil)
    support_curencies = get_support_curencies unless support_curencies

    ans = {}
    url = "http://rate.bot.com.tw/xrt?Lang=zh-TW"
    doc = Nokogiri::HTML(open(URI.encode(url)))

    rate_set = doc.search('table.table.table-striped.table-bordered.table-condensed.table-hover tbody tr')
    rate_set.each do |doms|
      currency = nil
      currency_info = doms.search('td.currency div.print_hide')[0].content # USD

      support_curencies["TWD"].each do |base|
        if currency_info.include? base
          currency = base
          break
        end
      end
      
      if currency
        spot_selling = doms.search('td.rate-content-sight')[1].content
        spot_buying = doms.search('td.rate-content-sight')[0].content
        ans["#{currency}/TWD"] = "%.4f" % ((BigDecimal(spot_selling) + BigDecimal(spot_buying)) / 2).truncate(4)
      end
    end
    
    return ans
  end

  def self.get_support_curencies
    {"TWD" => ['USD', 'JPY', 'EUR', 'AUD', 'GBP']}
  end
end