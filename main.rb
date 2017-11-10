require 'dotenv/load'
require 'Sequel'

require_relative './shared'
require_relative './character'

Dotenv.load('../.env')

def display_menu
  # displays the beginning menu
  puts "[1] Investigate"
  puts "[2] Use Item"
  puts "[3] Take Action"
  puts "[4] Display Stats"
  puts "[5] Save"
  puts "[6] Exit"
  take_user_input((gets.chomp).to_i)
end

def take_user_input(input)
  # takes user input to determine next action
  # always calls back to display_menu
  case input
  when 1
    puts "You search the ground nearby."
    investigate
  when 2
    puts "You open your items pouch."
    #display_items
  when 3
    # take some action
  when 4
    # display user's Stats
  when 5
    $pc.save
  when 6
    puts "See you next time!"
    exit
  else
    puts "That's not one of the options"
  end
  #continue_story
  display_menu
end
=begin
  Let's start this complex and then we'll simplify as we go
=end

# beginning of the game
# Initiate player character
puts "Hello traveler. You look familiar, have I met you before?(y/n)"
if gets.chomp == 'y'
  # load character data
  puts "Your adventure continues."
else
  $pc = Character.new()
  puts "I must have mistaken you for someone else. What is your name?"
  $pc.set_player_name(gets.chomp)
  puts "We should create a secret password just between you and me. What should it be?"
  $pc.set_player_password(gets.chomp)
  puts "Cool this is how i'll identify you later."
  puts "#{$pc.name} your adventure begins in the middle of the woods."
  puts "After some time you come to a fork in the path."
end

display_menu
