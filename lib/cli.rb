
#get inputs and it will show strings or disply 
class CLI
    def run
        user_name
        greeting
        API.new.get_quote #data from api
        selects_by_name
    
    end

    def user_name
        puts "Enter your name: \n "
        name = gets.chomp
        puts ""
        puts ("Hello " + name + "!")
    end
    
    def greeting
        puts " \n "
        puts "welcome to Quotes \n "
    end

    def display
        Quote.all.collect do |quote|
            quote.quoteAuthor
        end.sort

    end


    def selects_by_name
        prompt = TTY::Prompt.new  #gem
        input = prompt.select("choose an Author \n ", display, per_page: 40)  #what the user selected  author store in the local variable input
       quote = Quote.find_by_name(input)
       display_quote(quote)
       input2 = nil
       while input2 != "Exit"
            input2 = prompt.select("Choose diferent Author \n ", %w(display Exit))
            case input2
            when "display"
                display
            when "Exit"
                exit
            end
           
                
       end

    end

    def display_quote(input)
        puts "~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ \n "
        puts "By #{input.quoteAuthor} : #{input.quoteText} \n "
        puts "~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ "
    end

    def exit
        puts "Thank you for reading Quotes, Goodbye!"
        # puts "Thank you #{name} for reading Quotes, Goodbye!"
    end
end
