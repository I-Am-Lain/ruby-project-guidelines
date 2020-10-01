# TO DO
# - Create functionality
# - Quotes API
# - Refactor/Clean up
# - Add UI/Art
# - README
# - 2 min vid

def run
    greet
    intro
    test
end




def greet
    thetime = Time.now.utc ## Our constant reference to the current time

    Tama.all.each do |t|  ## can add IF statment, IF tama.each |t| t.background_timer == nil
        t.background_timer = thetime
        t.save
    end
    

    cute = '❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤'
    titlebox
    puts ""
    puts ""
    puts Rainbow('Please enter a name, handsome stranger:').yellow.bright.inverse
    theinput = gets.chomp
    newest_user = User.find_or_create_by(name: theinput)
    puts ""
    puts "."
    puts ".."
    puts "..."
    puts ""
    puts Rainbow("Awesome! #{newest_user.name}, it's time to begin your Tama-Journey!!!!! XDXD").yellow.bright.inverse
end




def titlebox
    font = TTY::Font.new(:block)
    pastel = Pastel.new

    box = TTY::Box.frame(("               TAMALAND               "),  # just set the specific space
    padding: 3, 
    align: :center, 
    border: :thick, 
    style: {fg: :bright_yellow, 
            bg: :blue,
            border: {fg: :bright_yellow, bg: :blue}},
            title: {top_center: "WELCOME TO", bottom_left: "Adopt", bottom_center: "Feed", bottom_right: "Play"})
    print box
    box2 = TTY::Box.warn("Tama Deployed!!") # info, warn, success, error
    print box2
end




def intro
    puts ""
    puts Rainbow("TamaPals is your CLI interface for ensuring the wellbeing of Tama near and yonder!").yellow.bright.inverse
    puts ""
    puts Rainbow("><><><><><><><><><><><><><>").green
    puts Rainbow("Select an option: (1 - 5)").green
    puts Rainbow("><><><><><><><><><><><><><>").green
    puts ""
    puts Rainbow((" 1. ") + "View My Tamas").yellow
    puts Rainbow((" 2. ") + "Feed Tamas").yellow
    puts Rainbow((" 3. ") + "Play With Tamas").yellow
    puts Rainbow((" 4. ") + "Adopt Tama").yellow
    puts Rainbow((" 5. ") + "Create Tama Egg" ).yellow
    puts Rainbow((" 6. ") + "Exit").yellow
    puts ""
    puts ""
end




def update_tama_timer
    thetime = Time.now.utc
    count = (thetime - Tama.find(1).background_timer)/60

    Tama.all.each do |t|
        t.background_timer += 60*count.to_i
        #t.background_timer = thetime - (count/1440.0)
        t.save
    end
end


def hunger_check
    thetime = Time.now.utc

    Tama.all.each do |t|
        if thetime - t.background_timer >= 60  #checks if a minute has passed, decrements, saves
            
            count = (thetime - t.background_timer)/60
            
            t.fullness -= count.to_i
            update_tama_timer

            puts "#{t.name} lost #{count} fullness!"  ###just visibly shows one of the tama's fullness
            puts "vvvvvvvvvvvvvvvvvvvvvvvvvvvvv"
            puts t.fullness         ###just visibly shows one of the tama's fullness
        end
    end
end

def is_dead
    #checks hunger and happiness
end

#puts out a list of all the user's eggs, with stats
# egg will hatch soon....
#       or egg hatching. .. ... .... ..... .....


# forms may have to be handled with another class

# eggs, 
# forms (egg, baby, child, adult, omega)





## thetime -> a variable that is always being updated after every break in our program, to
##              know exactly HOW LONG HAS ELAPSED in comparison to:


def test
    loop do
        puts "Now we're going to check if the timers work:"
        
        thetime = Time.now.utc
        puts "THE TIME IS ----- #{thetime}"

        puts Tama.find(1).background_timer
        puts thetime - Tama.find(1).background_timer

        hunger_check

        puts "continue? y or n"
        testinput = gets.chomp.downcase
    break if testinput == "no" || testinput == "n"
    end

    run
end