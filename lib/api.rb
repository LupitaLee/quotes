
class API
    
    def get_quote
        uri = URI('https://quote-garden.herokuapp.com/api/v3/quotes?limit=20')
        quotes = Net::HTTP.get(uri) #string of data
        quote_hash = JSON.parse(quotes) #parses into an array of hashes 
        quote_array = quote_hash["data"] #returns an array of quotes 
        self.create_quote_objects(quote_array)
    end
 
    def create_quote_objects(quote_array)
        quote_array.each do |quote_hash|   #iterate over each item of the array 
            Quote.new(quote_hash)  # makes new obect with their data 
        end
        # binding.pry
    end
end                                            