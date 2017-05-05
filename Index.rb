require 'Character'

def display_menu
  # displays the beginning menu
  take_user_input
end

def take_user_input
  # takes user input to determine next action
  # always calls back to display_menu
  display_menu
end

# beginning of the game
display_menu()
