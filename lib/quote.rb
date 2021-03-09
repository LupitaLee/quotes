
class Quote
    @@all =[]
    def initialize(quote_hash)    
        quote_hash.each do |key, value| 
        self.class.attr_accessor(key)   
        self.send("#{key}=", value)     
        end
        @@all << self
    end 

    def self.all
        @@all
    end 

    def self.find_by_name(author)
        self.all.find {|quote| quote.quoteAuthor == author} 
    end

end

