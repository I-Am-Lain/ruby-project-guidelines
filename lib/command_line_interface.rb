# TO DO
# - README

# change birthday to age
# add little ascii pixel art view on top of choice select


require 'pry'

def run
    $QUOTES = get_quotes
    greet
    intro
end


####################################
####################################
####################################
####################################
####################################


def greet
    thetime = Time.now.utc ## Our constant reference to the current time
    prompt = TTY::Prompt.new(active_color: :cyan)
    Tama.all.each do |t|  ## can add IF statment, IF tama.each |t| t.background_timer == nil
        t.background_timer = thetime
        t.save
    end

    titlebox
    puts ""
    puts ""

    x = prompt.ask("What is your name?", default: ENV["USER"])
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

####################################
####################################
####################################
####################################
####################################


def intro
    prompt = TTY::Prompt.new(active_color: :cyan)
    choices = ["View My Tamas", "Feed", "Play", "Adopt-a-tama", "Create New Egg", "Quit"]
    x = prompt.select("Select a choice", choices)
    
    the_check

    case x
    when "View My Tamas"
        view_tamas
    when "Feed"
        feed
    when "Play"
        play
    when "Adopt-a-tama"
        adopt
    when "Create New Egg"
        create_egg
    when "Quit"
        puts "Goodbye!!!"
    else
        puts "How did you even get here?"
    end
end


####################################
####################################
####################################
####################################
####################################


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
    puts Rainbow("           CRUDagotchi is the CLI interface           ").yellow.bright.inverse
    puts Rainbow("for all fake retro digital pet enthusiasts, worldwide.").yellow.bright.inverse
end

####################################
####################################
####################################
####################################
####################################t


def view_tamas  
    table = TTY::Table.new(find_tamas)
    puts table.render(:ascii)
    intro
end

def find_tamas  
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
    x = $QUOTES.sample
    puts Rainbow("#{x["text"]}" + " - " + "#{x["author"]}").yellow
    if $CURRENTUSER.tamas != []
        Adoption.all.each do |a|
            if a.user == $CURRENTUSER
                if a.tama.fullness < 10
                    a.tama.fullness += 1
                    a.tama.save
                end
            end
        end
    end
    puts "><><><><><><><><><><><><>"
    puts ""
    puts ""
    puts ""
    puts ""
    view_tamas
end

def play
    x = $QUOTES.sample
    puts Rainbow("#{x["text"]}" + " - " + "#{x["author"]}").yellow
    if $CURRENTUSER.tamas != []
        Adoption.all.each do |a|
            if a.user == $CURRENTUSER
                if a.tama.happiness < 10
                    a.tama.happiness += 1
                    a.tama.save
                end
            end
        end
    end
    puts "><><><><><><><><><><><><>"
    puts ""
    puts ""
    puts ""
    puts ""
    view_tamas
end

def adopt
    puts "Thank you for deciding to contribute to Tamagotchi Communism, friend."
    prompt = TTY::Prompt.new(active_color: :green)
    choices = Adoption.all.reject do |a| 
        a.tama.users.include?($CURRENTUSER)
    end.uniq
    if choices != []
        choices = choices.map do |c|
            c.tama.name
        end
        x = prompt.select("Select a choice", choices)
        y = Tama.find_by(name: x)
        a = Adoption.create(user_id: $CURRENTUSER.id, tama_id: y.id)
        a.save
    else
        puts Rainbow("Oh no! There are no more Tamas to adopt :(").yellow
        puts Rainbow("Create a new egg insead to begin WORLD TAMA-NATIO-..... Look just go away").yellow
    end
    puts "><><><><><><><><><><><><>"
    puts ""
    puts ""
    puts ""
    puts ""
    intro
end

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

    $CURRENTUSER.tamas << the_baby
    $CURRENTUSER.save

    box2 = TTY::Box.warn("Tama-Egg #{baby_name} Hatched!!")
    print box2
    puts "><><><><><><><><><><><><>"
    puts ""
    puts ""
    puts ""
    puts ""
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
                t.save
            end
            update_tama_timer
            t.save
        end
    end
end

def is_dead
    Tama.all.each do |t|
        if t.fullness == 0 || t.happiness == 0
            t.adoptions.each do |a| 
                Adoption.delete(a.id)
            end
            
            box = TTY::Box.error("#{t.name} died. You monster.")
            print box
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