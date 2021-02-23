
class QuoteFinder::API
    
    def get_quote
        uri = URI('https://quote-garden.herokuapp.com/api/v3/quotes?limit=40')
        quotes = Net::HTTP.get(uri) 
        # binding.pry
    end

    def parse_json
    JSON.parse(quotes)
    end
end
