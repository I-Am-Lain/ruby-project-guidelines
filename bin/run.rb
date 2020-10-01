require_relative '../config/environment'

def update_tama_timer(thetime)
    Tama.all.each do |t|
        t.background_timer = thetime
        t.save
    end
end
################################################################################
################################################################################
################################################################################
################################################################################

thebeginningoftime = Time.now.utc
thetime = Time.now.utc
puts thetime

update_tama_timer(thetime)   ## <----- updates every tamagotchi's "background_timer"


puts "################################################################################"
puts "################################################################################"
puts "################################################################################"
puts "Welcome to CRUDAGOTCHI"
puts "################################################################################"
puts "################################################################################"
puts "################################################################################"
puts "Please enter a name, handsome stranger:"
theinput = gets.chomp
puts "-------------------------"
puts "-------------------------"
puts "-------------------------"
puts "-------------------------"
puts "-------------------------"
puts "-------------------------"
newest_user = User.find_or_create_by(name: theinput)
puts "Awesome! #{newest_user.name}, it's time to begin your Tama-Journey!!!!! XDXD"
puts "-------------------------" # CAN IMPLEMENT A "WELCOME BACK USER"
puts "-------------------------"
puts "-------------------------"
puts "-------------------------"
puts "-------------------------"
Tama.all.each {|t| puts "#{t.name} ----- #{t.background_timer}"}
puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
if newest_user.tamas == []
    loop do
        puts "I see that you're new, would you like to adopt a Tamagotchi?"
        puts "Yes or No (Y or N)"
        theinput = gets.chomp.downcase
    break if theinput == "yes" || theinput == "y"
    end




    puts "Wonderful! Let's see the Tamaeggs you can choose:"
end

thetime = Time.now.utc
update_tama_timer(thetime)

Tama.all.each do |t|
    puts "#{t.name}, current timer #{t.background_timer}."
    puts "FULLNESS = #{t.fullness}/10, HAPPINESS =  #{t.happiness}."
end

#puts out a list of all the user's eggs, with stats
# egg will hatch soon....
#       or egg hatching. .. ... .... ..... .....


# forms may have to be handled with another class

# eggs, 
# forms (egg, baby, child, adult, omega)



loop do
    puts "Now we're going to check if the timers work:"
    thetime = Time.now.utc
    #puts thetime
    #puts thetime - thebeginningoftime
    puts "THE TIME IS ----- #{thetime}"
    puts Tama.find(1).background_timer
    puts thetime - Tama.find(1).background_timer
    if thetime - Tama.find(1).background_timer >= 60  #checks if a minute has passed, decrements, saves
        Tama.all.each {|t| 
        t.fullness -= 1
        t.background_timer = thetime
        t.save
        }
        puts "all tamas last 1 fullness!"  ###just visibly shows one of the tama's fullness
        puts Tama.find(1).fullness         ###just visibly shows one of the tama's fullness
    end
    puts "continue? y or n"
    testinput = gets.chomp.downcase
break if testinput == "no" || testinput == "n"
end


puts "THE END OF FILE"
puts "THE END OF FILE"
puts "THE END OF FILE"
puts "THE END OF FILE"
puts "THE END OF FILE"