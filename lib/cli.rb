
#get inputs and it will show strings or disply 
class CLI
    def run
        pic_one
        user_name
        greeting
        sleep(1)
        API.new.get_quote #data from api
        selects_by_name
    
    end

    def user_name
        puts ""
        puts "What is your name? \n ".colorize(:magenta)
        @name = gets.chomp.colorize(:blue)   #chomp gets rid of any line or space cx inputs 
        puts ""
        puts ("Hello #{@name}!").colorize(:blue)
        sleep(1)
    end
    
    def greeting
        puts " \n "
        puts "Welcome to Quotes \n ".colorize(:light_green)
    end

    def authors
        Quote.all.collect do |quote|
            quote.quoteAuthor
        end.sort.uniq

    end


    def selects_by_name
       
        prompt = TTY::Prompt.new(active_color: :magenta) #gem

        input = prompt.select("Choose an Author \n ", authors, per_page: 40)  #what the user selected  author store in the local variable input
       quote = Quote.find_by_name(input) # using my find by name method 
       display_quote(quote)
       input2 = nil
       input2 = prompt.select("Do you want to choose a different Author? \n ", %w(Authors Exit))
       if input2 != "Exit"
        selects_by_name    #recursion -called inside itself
       else
        exit
        end
    end

    def display_quote(input)
        puts "~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ \n "
        puts " \" #{input.quoteText} \" - #{input.quoteAuthor} \n ".colorize(:light_green)
        puts "~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~  ~ ~ ~ ~ ~ ~ ~ ~ ~ \n "
        puts "How much do you like this Quote?  \n".colorize(:light_magenta)
        prompt = TTY::Prompt.new(active_color: :magenta)
        volume = prompt.slider("Like", max: 10, default: 7, help: "(Move arrows left and right to set value)", show_help: :always)
        
    end

    def exit
        puts ""
        puts ""
        # puts "Thank you for reading Quotes, Goodbye! \n ".colorize(:light_yellow)
        puts "Thank you #{@name} for reading Quotes, Goodbye! \n "
    end
    def pic_one
        puts"
    ,,,                      ,,,
             {{{}}    ,,,             {{{}}    ,,,
          ,,, ~Y~    {{{}},,,      ,,, ~Y~    {{{}},,,
         {{}}} |/,,,  ~Y~{{}}}    {{}}} |/,,,  ~Y~{{}}}
          ~Y~ \|{{}}}/\|/ ~Y~  ,,, ~Y~ \|{{}}}/\|/ ~Y~  ,,,
          \|/ \|/~Y~  \|,,,|/ {{}}}\|/ \|/~Y~  \|,,,|/ {{}}}
          \|/ \|/\|/  \{{{}}/  ~Y~ \|/ \|/\|/  \{{{}}/  ~Y~
          \|/\\|/\|/ \\|~Y~//  \|/ \|/\\|/\|/ \\|~Y~//  \|/
          \|//\|/\|/,\\|/|/|// \|/ \|//\|/\|/,\\|/|/|// \|/
         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
        
         
      end
end

