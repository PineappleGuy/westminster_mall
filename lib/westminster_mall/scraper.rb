class Scraper
  
  def self.scrape_stores
    doc = Nokogiri::HTML(open("https://westminstermall.com/stores"))
  
    #get all the stores and for each store make a store object with a name and url 
    
    doc.css("#postResults .post").each do |node|
      store = Store.new
      store.url = node.css("a").first.attr("href")
      store.name = node.css("a div.post__body h2").text.strip
    end
    #binding.pry
  end
  
  def self.scrape_store(input)
    #this is where we add description, store hours...
    #use nokogiri to open "https://westminstermall.com#{store.url}"
    store = Store.all[input - 1]
      if store.hours = nil 
        doc = Nokogiri::HTML(open("https://westminstermall.com#{store.url}"))
        store.hours = doc.css("div.entry__body span")[0].text
        store.phone_number = doc.css("")
        binding.pry
      end
    end
  end
  
end