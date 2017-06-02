require './character'
require './shared'

def display_menu
  # displays the beginning menu
  puts "[1] Investigate"
  puts "[2] Use Item"
  puts "[3] Take Action"
  puts "[4] Exit"
  take_user_input((gets.chomp).to_i)
end

def take_user_input(input)
  # takes user input to determine next action
  # always calls back to display_menu
  case input
  when 1
    puts "You search the ground nearby."
    #investigate
  when 2
    puts "You open your items pouch."
    #display_items
  when 3
    # take some action
  when 4
    puts "See you next time!"
    exit
  end
  #continue_story
  display_menu
end
=begin
  Let's start this complex and then we'll simplify as we go
=end

# beginning of the game
puts "You begin your adventure in the middle of the woods."
puts " After some time you come to a fork in the path."

display_menu
