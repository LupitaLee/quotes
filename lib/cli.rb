
#get inputs and it will show strings or disply 
class CLI
    def run
        greeting
        # selects_by_author
        API.new.get_quote #data from api
        # choose_a_quote
        selects_by_name
       
    end
    
    def greeting
        puts " \n "
        puts "welcome to Quotes \n "
    end

    # def choose_a_quote
    #     puts "- choose by Author -" 
    #     Quote.all.collect do |quote, index|
    #         # binding.pry
    #         puts "#{quote.quoteAuthor}"
    #     end
        
    # end

    def display
        Quote.all.collect do |quote|
            quote.quoteAuthor
        end

    end


    def selects_by_name
        prompt = TTY::Prompt.new  #gem
        input = prompt.select("choose an Author \n ", display, per_page: 40)  #what the user selected  author store in the local variable input
       quote = Quote.find_by_name(input)
    #    binding.pry
       display_quote(quote)
    end

    def display_quote(input)
        puts "~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ \n "
        puts "By #{input.quoteAuthor} : #{input.quoteText} \n "
        puts "~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ "
    end
end
