
class API
    
    def get_quote
        uri = URI('https://quote-garden.herokuapp.com/api/v3/quotes?limit=20')
        quotes = Net::HTTP.get(uri)
        quote_hash = JSON.parse(quotes) 
        quote_array = quote_hash["data"] 
        self.create_quote_objects(quote_array)
    end
 
    def create_quote_objects(quote_array)
        quote_array.each do |quote_hash|   
            Quote.new(quote_hash)  
        end
    end
end                                            