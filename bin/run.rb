require_relative '../config/environment'



puts "HELLO WORLD"
puts "Please enter your name:"
theinput = gets.chomp
puts "-------------------------"
newest_user = User.create_or_find_by(name: theinput)
puts "Awesome! #{newest_user.name}, it's time to begin your Tama-Journey!!!!! XDXD"


# NEED DATA IN THE TABLES
# NEED TO SHOW DATA/DO SOMETHING 

# will = User

# 5-10 tama objects already made
# Quotes class
# Food/Toys class
# Location variable within tamas
