# TO DO
# - Create functionality
#   - refactor the check entirely
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

require 'pry'

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
    $CURRENTUSER = User.find_or_create_by(name: x)

    puts ""
    puts "."
    puts ".."
    puts "..."
    puts ""

    if $CURRENTUSER.tamas == []
        puts Rainbow("Welcome! #{$CURRENTUSER.name}, it's time to begin your Tama-Journey!!!!!").yellow.bright.inverse
    else
        puts Rainbow("Welcome back #{$CURRENTUSER.name}, let's get back to keeping your children alive!").yellow.bright.inverse
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
end




def intro
    prompt = TTY::Prompt.new(active_color: :cyan)
    choices = %w(View Feed Tamas Play Adopt Create_Egg Quit)
    choices = ["View My Tamas", "Feed", "Play", "Adopt-a-tama", "Create New Egg", "Quit"]
    x = prompt.select("Select a choice", choices)
    
    #update tama table!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

    the_check


    case x
        when "View My Tamas"
            view_tamas
        when "Feed"
            feed
            ## they really enjoyed it, now here's a quote by Franz Kafka
        when "Play"
            play
        when "Adopt-a-tama"
            ## create a new many-to-many with an alive Tama
        when "Create New Egg"
            create_egg
        when "Quit"
            "Goodbye!!!"
        else
            "How did you even get here?"
    end


    # puts Rainbow("CRUDagotchi is the CLI interface").yellow.bright.inverse
    # puts Rainbow("for all fake retro digital pet enthusiasts, worldwide.™").yellow.bright.inverse
end

def view_tamas  ### also add table of ALL tamas?
    a1 = Tama.all.map {|t| t.name}
    table = TTY::Table.new(find_tamas)
    puts table.render(:ascii)
    intro
end

def find_tamas  ### used to build the ascii table
    array = [["Name", "Hunger", "Happiness"]]
    Adoption.all.each do |a|
        tama_array = []
        if a.user == $CURRENTUSER
            tama_array << a.tama.name
            tama_array << a.tama.fullness
            tama_array << a.tama.happiness
            array << tama_array
        end
    end
    array
end

def feed
    if $CURRENTUSER.tamas != []
        Adoption.all.each do |a|
            if a.user == $CURRENTUSER
                a.tama.fullness += 1
                a.tama.save
            end
        end
    end
    binding.pry
    Tama.all.each {|t| t.save}
    intro
end

def play
    if $CURRENTUSER.tamas != []
        Adoption.all.each do |a|
            if a.user == $CURRENTUSER
                a.tama.happiness += 1
                a.tama.save
            end
        end
    end
    intro
end

#first time i create a user, their stuff isn't updating in real time
# next time i run, it runs. or if user waits a minute
# no asserted MAX for happiness
####################################
####################################
####################################
####################################
####################################

def update_tama_timer
    thetime = Time.now.utc
    count = (thetime - Tama.find(5).background_timer)/60

    Tama.all.each do |t|
        t.background_timer += 60*count.to_i
        #t.background_timer = thetime - (count/1440.0)
        t.save
    end
end

def create_egg
    prompt = TTY::Prompt.new(active_color: :cyan)
    baby_name = prompt.ask("What would you like to name your new baby?", default: "Lil' Tubkins")

    the_baby = Tama.create(name: baby_name)
    the_baby.background_timer = Time.now.utc
    the_baby.save

    Adoption.create(user_id: $CURRENTUSER.id, tama_id: the_baby.id)



    box2 = TTY::Box.warn("Tama-Egg #{baby_name} Hatched!!")
    print box2
    intro
end


####################################
####################################
####################################
####################################
####################################


def hunger_check
    thetime = Time.now.utc

    Tama.all.each do |t|
        if thetime - t.background_timer >= 60  #checks if a minute has passed, decrements, saves
            
            count = (thetime - t.background_timer)/60
            
            if t.users != []
                t.fullness -= count.to_i
                puts Rainbow("#{t.name} lost #{count} fullness!")  ###just visibly shows one of the tama's fullness
                puts Rainbow("vvvvvvvvvvvvvvvvvvvvvvvvvvvvv")
                puts t.fullness         ###just visibly shows one of the tama's fullness
                t.save
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
                t.save
            end
            update_tama_timer
            t.save
        end
    end
end

def is_dead
    #checks hunger and happiness
    Tama.all.each do |t|
        if t.fullness == 0 || t.happiness == 0
            t.adoptions.each do |a| 
                Adoption.delete(a.id)
            end
            Tama.delete(t.id)

        end 
    end
end

def the_check
    hunger_check
    happy_check
    is_dead
end



####################################
####################################
####################################
####################################
####################################



def test
    loop do
        puts "Now we're going to check if the timers work:"
        Tama.all.each do |t|
            puts "#{t.name}...... has fullness = #{t.fullness}"
        end
        
        thetime = Time.now.utc
        puts "THE TIME IS ----- #{thetime}"

        puts Tama.find(5).background_timer
        puts thetime - Tama.find(5).background_timer


        the_check

        puts "continue? y or n"
        testinput = gets.chomp.downcase
    break if testinput == "no" || testinput == "n"
    end
end