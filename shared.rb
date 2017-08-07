# contains shared methods across all classes
require 'dotenv/load'
Dotenv.load('../.env')

def award_item(item_name, item_type)
  # is the character's pouch already full?
  if pouch_full?
    puts "You don't have room in your pouch to carry this item."
    return
  else
    db = Sequel.postgres('text_adv_db', :user => ENV['DB_USERNAME'], :password => ENV['DB_PASSWORD'])
    id = db[:items].select(:id).where(:name => item_name, :type => item_type).first[:id] # must do first[:id] otherwise it returns {id: 4}
    db[:character_pouch].insert(:item_id => id)
    puts "#{item_name.capitalize} has been added to your pouch"
  end

end

def attack(opponent_ac,character_type,level)
  puts "The #{character_type} swings"

  if roll_to_hit >= opponent_ac
    # this number should be returned?
    roll_dmg(level)
  else
    if character_type != String.empty
      puts "The #{character_type} misses"
    else
      puts "The attack misses"
    end
  end
end

def display_items(character_id)
  # will be linked to character_id in psql db
  # for now hard coded to just have something to display

end

def investigate
  # roll 1d4 to determine if they find anything
  # they can only investigate 4 times (add flag?)

  case (1 + rand(6)).to_i
  when 1, 5
    puts "There is nothing to be found"
  when 2
    random_clue
  when 3
    puts "Congrats! You are the proud owner of a handful of pocket sand!"
  when 4, 6
    random_treasure
  end
end

def pouch_full?
  db = Sequel.postgres('text_adv_db', :user => ENV['DB_USERNAME'], :password => ENV['DB_PASSWORD'])
  if db[:character_pouch].count >= 8
    return true
  else
    return false
  end
end

def random_clue
  #roll d8 to determine clue awarded
  case (1 + rand(8)).to_i
  when 1; puts "You see goblin tracks." # set next enemy to goblin
  when 2; puts "You find a hidden chamber in a nearby tree." # set treasure grab
  when 3; puts "You hear a rustle in the bushes." # set next enemy encounter
  when 4; puts "You see a freshly dug hole." # set either trap or treasure
  when 5; puts "You activate a trip wire and are strung upside down from a tree."
  when 6; puts "You see a part of a skeleton sticking out of the ground."
  when 7; puts "You see leaves of 3. Best to let that be."
  when 8; puts "You see animal tracks. A mix of deer and bear"
  end
end

def random_treasure
  #roll d12 to determine treasure awarded
  case (1+ rand(12))
  when 1
    puts "You see something glittering. Gained 10 gold pieces."
    #award_gold
  when 2
    puts "You find a bright Jasper chunk. Lucky you!"
    award_item('jasper','treasure')
  when 3
    puts "You find a golden statue."
    award_item('golden statue', 'treasure')
  when 4
    puts "You find a delicate chunk of coral"
    award_item('coral','treasure')
  when 5
    puts "you find a " + random_instrument + " hope you know how to play it."
  when 6
    puts "Bling bling it's a MAGIC RING!"
    #award_item('ring')
  when 7
    puts "Shiny shiny gold. Gained 35 gold pieces."
    #award_gold
  when 8
    puts "You pick up a vial of swirling gold liquid. Gained healing potion."
    award_item('potion of lesser healing','consumable')
  when 9
    puts "You pick up a vial filled with an inky black liquid. Gained vial of poison."
    #award_item
  when 10
    puts "You find a Silver Bracelet."
    award_item('silver bracelet','treasure')
  when 11
    puts "you found a satchel containing 3 throwing knives."
    #award_item
  when 12
    puts "you find a pouch containing catnip"
    #award_item('')
  end
end

def roll_to_hit
  # roll d20
  (1 + rand(20))
end

def roll_dmg(level)
  # dmg = lvl + 1d6
  level + (1+rand(6))
end

def take_dmg(hp,dmg)
  if hp < dmg
    hp = 0
    puts "#{character_type} was defeated"
  else
    hp = hp - dmg
  end
end
