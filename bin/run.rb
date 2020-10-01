require_relative '../config/environment'



run




# def update_tama_timer
#     thetime = Time.now.utc
#     count = (thetime - Tama.find(1).background_timer)/60

#     Tama.all.each do |t|
#         t.background_timer += 60*count.to_i
#         #t.background_timer = thetime - (count/1440.0)
#         t.save
#     end
# end


# ## losing truncation

# def hunger_check
#     thetime = Time.now.utc

#     Tama.all.each do |t|
#         if thetime - t.background_timer >= 60  #checks if a minute has passed, decrements, saves
            
#             count = (thetime - t.background_timer)/60
            
#             t.fullness -= count.to_i
#             update_tama_timer
#             #t.save

#             puts "#{t.name} lost #{count} fullness!"  ###just visibly shows one of the tama's fullness
#             puts "vvvvvvvvvvvvvvvvvvvvvvvvvvvvv"
#             puts t.fullness         ###just visibly shows one of the tama's fullness
#         end
#     end
# end

# def is_dead
#     #checks hunger and happiness
# end

# ################################################################################
# ################################################################################
# ################################################################################
# ################################################################################

# thetime = Time.now.utc
# puts thetime

# Tama.all.each do |t|
#     t.background_timer = thetime
#     t.save
# end  ## <----- updates every tamagotchi's "background_timer"
#                   ## constraints:
#                 ##               - only runs when app is on
#             ##                   - (next time it's turned on, might evalute the time between?)


# puts "################################################################################"
# puts "################################################################################"
# puts "################################################################################"
# puts "Welcome to CRUDAGOTCHI"
# puts "################################################################################"
# puts "################################################################################"
# puts "################################################################################"
# puts "Please enter a name, handsome stranger:"
# theinput = gets.chomp
# puts "-------------------------"
# puts "-------------------------"
# puts "-------------------------"
# puts "-------------------------"
# puts "-------------------------"
# puts "-------------------------"
# newest_user = User.find_or_create_by(name: theinput)
# puts "Awesome! #{newest_user.name}, it's time to begin your Tama-Journey!!!!! XDXD"
# puts "-------------------------" # IMPLEMENT A "WELCOME BACK USER"
# puts "-------------------------"
# puts "-------------------------"
# puts "-------------------------"
# puts "-------------------------"
# Tama.all.each {|t| puts "#{t.name} ----- #{t.background_timer}"}
# puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
# puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
# puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
# puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
# puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
# if newest_user.tamas == []
#     loop do
#         puts "I see that you're new, would you like to adopt a Tamagotchi?"
#         puts "Yes or No (Y or N)"
#         theinput = gets.chomp.downcase
#     break if theinput == "yes" || theinput == "y"
#     end



#     puts "Wonderful! Let's see the Tamaeggs you can choose:"
# end





# thetime = Time.now.utc
# update_tama_timer   #premature syncing of tama-timer.

# Tama.all.each do |t|
#     puts "#{t.name}, current timer #{t.background_timer}."
#     puts "FULLNESS = #{t.fullness}/10, HAPPINESS =  #{t.happiness}."
# end




# loop do
#     puts "Now we're going to check if the timers work:"
    
#     thetime = Time.now.utc
#     puts "THE TIME IS ----- #{thetime}"

#     puts Tama.find(1).background_timer
#     puts thetime - Tama.find(1).background_timer

#     hunger_check

#     puts "continue? y or n"
#     testinput = gets.chomp.downcase
# break if testinput == "no" || testinput == "n"
# end


# puts "THE END OF FILE"
# puts "THE END OF FILE"
# puts "THE END OF FILE"
# puts "THE END OF FILE"
# puts "THE END OF FILE"
# Tama.all.each do |t|
#     puts "#{t.name}, current timer #{t.background_timer}."
#     puts "FULLNESS = #{t.fullness}/10, HAPPINESS =  #{t.happiness}."
# end