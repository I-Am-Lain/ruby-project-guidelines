# TO DO
# - Create functionality
#   - happy check
#   - refactor the check entirely
#   - is_dead function
#   - NEW TAMA IS BORN FUNCTION
#   - FORMS????
# - Quotes API
# - Refactor/Clean up
# - Add UI/Art
# - README
# - 2 min vid

# big questions:
# update for individual tamas?
# persist across plays?
# forms or no?

def run
    #prompt = TTY::Prompt.new
    #prompt.ask("What is your name?", default: ENV["USER"])
    #prompt.yes?("Do you like Ruby?")

    #choices = %w(emacs nano vim)

    #prompt.select("Select an editor?", choices)


    greet
    intro



    test    # <------- CRITICAL!!!!
end




def greet
    thetime = Time.now.utc ## Our constant reference to the current time

    prompt = TTY::Prompt.new(active_color: :cyan)

    Tama.all.each do |t|  ## can add IF statment, IF tama.each |t| t.background_timer == nil
        t.background_timer = thetime
        t.save
    end
    


    cute = '❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤'
    titlebox
    puts ""
    puts ""


    x = prompt.ask("What is your name?", default: ENV["USER"])
    #puts Rainbow(prompt.ask("What is your name?", default: ENV["USER"])).yellow.bright.inverse
    #theinput = gets.chomp
    newest_user = User.find_or_create_by(name: x)

    puts ""
    puts "."
    puts ".."
    puts "..."
    puts ""

    if newest_user.tamas == []
        puts Rainbow("Welcome! #{newest_user.name}, it's time to begin your Tama-Journey!!!!!").yellow.bright.inverse
    else
        puts Rainbow("Welcome back #{newest_user.name}, let's get back to keeping your children alive!").yellow.bright.inverse
    end
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
end
# 1. presents list of options
# 2. save user selection, evaluate on switch case



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
    prompt = TTY::Prompt.new(active_color: :cyan)
    choices = %w(View Feed Tamas Play Adopt Create_Egg Quit)
    choices = ["View My Tamas", "Feed", "Play", "Adopt-a-tama", "Create New Egg", "Quit"]
    x = prompt.select("Select a choice", choices)
    
    #update tama table

    case x
        when "View My Tamas"
            ## do_view_function
        when "Feed"
            ## feed all my tamas
        when "Play"
            ## increase all my tamas happiness
        when "adopt"
            ## create a new many-to-many with an alive Tama
        when "create_egg"
            ## create a one to many new tama
    end




    # puts ""
    # puts Rainbow("CRUDagotchi is the CLI interface").yellow.bright.inverse
    # puts Rainbow("for all fake retro digital pet enthusiasts, worldwide.™").yellow.bright.inverse
    # puts ""
    # puts Rainbow("><><><><><><><><><><><><><>").green
    # puts Rainbow("Select an option: (1 - 5)").green
    # puts Rainbow("><><><><><><><><><><><><><>").green
    # puts ""
    # puts Rainbow((" 1. ") + "View My Tamas").yellow
    # puts Rainbow((" 2. ") + "Feed Tamas").yellow
    # puts Rainbow((" 3. ") + "Play With Tamas").yellow
    # puts Rainbow((" 4. ") + "Adopt Tama").yellow
    # puts Rainbow((" 5. ") + "Create Tama Egg" ).yellow
    # puts Rainbow((" 6. ") + "Exit").yellow
    # puts ""
    # puts ""
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
            
            if t.users != []
                t.fullness -= count.to_i
                puts "#{t.name} lost #{count} fullness!"  ###just visibly shows one of the tama's fullness
                puts "vvvvvvvvvvvvvvvvvvvvvvvvvvvvv"
                puts t.fullness         ###just visibly shows one of the tama's fullness
            end
            update_tama_timer
            t.save
        end
    end
end

def happy_check
    thetime = Time.now.utc

    Tama.all.each do |t|
        if thetime - t.background_timer >= 120  #checks if a minute has passed, decrements, saves
            
            count = (thetime - t.background_timer)/120
            
            if t.users != []
                t.happiness -= count.to_i
                puts "#{t.name} lost #{count} happiness!"  ###just visibly shows one of the tama's fullness
                puts "vvvvvvvvvvvvvvvvvvvvvvvvvvvvv"
                puts t.happiness         ###just visibly shows one of the tama's fullness
            end
            update_tama_timer
            t.save
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
        Tama.all.each do |t|
            puts "#{t.name}...... has fullness = #{t.fullness}"
        end
        
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