

class CLI
    def run
        pic_one
        user_name
        greeting
        selects_by_name
    
    end

    def user_name
        puts ""
        puts "What is your name? \n "
        @name = gets.chomp.colorize(:cyan)  
        puts ""
        puts ("Hello #{@name}!").colorize(:cyan)
        sleep(1)
    end
    
    def greeting
        puts " \n "
        puts "Welcome to Quotes \n ".colorize(:magenta)
        sleep(1)
    end

    def authors
        Quote.all.collect {|quote| quote.quoteAuthor}.sort.uniq
    end


    def selects_by_name
       
        prompt = TTY::Prompt.new(active_color: :magenta) 

        input = prompt.select("Choose an Author \n ".colorize(:light_green), authors, per_page: 40) 
       quote = Quote.find_by_name(input) 
       display_quote(quote)
       input2 = nil
       input2 = prompt.select("Do you want to choose a different Author? \n ", %w(Authors Exit))
       if input2 != "Exit"
        selects_by_name  
       else
        exit
        end
    end

    def display_quote(input)
        puts ""
        puts "~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ \n ".colorize(:light_magenta)
        puts " \" #{input.quoteText} \" - #{input.quoteAuthor} \n ".colorize(:light_green)
        puts "~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~  ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~\n ".colorize(:light_magenta)
        puts "How much do you like this Quote?  \n".colorize(:light_magenta)
        prompt = TTY::Prompt.new(active_color: :magenta)
        volume = prompt.slider("Like", max: 10, default: 7, help: "(Move arrows left and right to set value)", show_help: :always)
        puts ""
        
    end

    def exit
        puts ""
        puts ""
        puts "Thank you #{@name} for reading Quotes, Goodbye!    ♡ ♡ ♡\n "
    end


    def pic_one
        puts"
                                                                                                     
        ./oh/                                                                                 
        `/yNhho/ ```..`                                 `:.`                                     
       -hmNNd/.:shdNNNmy/`                             `hNNds`                                   
     .ohdmmo/yo/:.`` `:yhy-                            oNNMMh                                    
    -syhdhs/-`         `ymm                    ````....NMMMM:.`````````                          
   :dmmms.`             sNN`                   ++osssshMMMMNoo+///+//+:                          
  /mmmmh`              .mMm                           sMMMMh             ````                    
 -mmmmh.               yMMo                           hMMMN/         `:ohdhhys/                  
 ydddd-               +NMN.``                 ``      hmmmd`       .omNNy:.`.+m`     ...`        
`dddds               :NMN+ ohs    `        `-+so      shhho       -yhds.    `+o    -ss:-/o.      
`dmmm+              :mMN+ `mNy   .os`     -ooss+.`   `ssss-      .+syy--.--:/-    -hh-  +y-      
.mmmm/            `ohdd/  :yy.   ohh`   `/ssoo-``+`  :ssso`      +syy-...``      `+yy+` -.       
`mNNmy`          -oyhh+   +ds   +hho   .oyhy:o`  /:.:+sss+     `/sss+           -/-yhhy/`        
 :mmmms.      .:oysyo-    /mo .+ymd-  /o/mdd`-/:-yo` ohyy:    -//yss/         .:.  .yhhdo`       
  +dmmmds+:/ohmddho-`     `++:-.oho .o/`.hhy`   :y.  +Nmd-  ./- .shh+       .-.`o/  `+yys/       
   .odddmmmmNNmdh/`             -yo+/`   -oys//oo.   .ddd-`/:`   .sdd+-.--::-  -h:   `syys       
 .+oshdddddho:.`                 ```   `  ``.-.`      -oyo/.       `.::::.`    :y`    :yy+       
 .yyyyyhddddh+`                                        ```                     `o:   .sdo`       
  ```` `.:/sddh/                                `                                -::++/`         
            `:shs:`               `    `                                                         
               `-/+:           ````        ````                                                ".colorize(:light_magenta)
        
        
         
      end
      
end
