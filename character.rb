# Define Character Class
require './shared'
class Character
  # define defaults and allow these to be read by other mehods
  attr_reader :max_xp
  attr_reader :name
  attr_reader :current_xp
  attr_reader :current_hp
  attr_reader :gold
  attr_reader :ac
  attr_reader :move_speed

  # example of a const(DEFAULT_NAME = 'Player McPlayerFace')

  def initialize
    @max_xp     = 7440
    @current_xp = 0
    @max_hp     = 10
    @current_hp  = 10
    @level = calculate_level(@current_xp)
    @ac         = 10
    @gold       = 10
    @move_speed = 30
    @inventory_slots = Array.new(4)
    @equipment_slots = {armor: 'none',
                        shield: 'none',
                        weapon: 'rusted sword'}
  end

  def set_player_name(name)
    @name = name
  end

  def set_player_password(password)
    @password = password
  end

  def set_player_id
    # open db
    #@id =
  end

  def calculate_level(current_xp)
    # Level 1 0-367
    # Level 2 367 - 826
    # level 3 827 - 1469
    # level 4 1470 - 2296
    # level 5 2297 - 3306
    # level 6 3307 - 4501
    # level 7 4502 - 5879
    # level 8 5880 - 7440
    # simplify because figure out how to calculate xp is HARD
    (Math.log2(1.075) * Math.sqrt(current_xp)).to_i
  end

  def award_xp(awarded_xp)
    @current_xp += awarded_xp
  end

  def attack
    # attack
  end

  def create_character_stats
    db = Sequel.postgres('text_adv_db', :user => ENV['DB_USERNAME'], :password => ENV['DB_PASSWORD'])
    db[:character].insert(:name => @name, :level => @level, :hp => @current_hp, :xp => @current_xp, :gold => @gold, :ac => @ac, :password => @password)
  end

  def create_character_inventory
  end

  def display_stats
    puts'HP: ' + @current_hp
    puts'XP: ' + @current_xp
    puts'Level: ' + @level
    puts'Gold: ' + @gold
  end

  def load_character_stats()
    # load character stats if starting from a save
  end

  def load_inventory
    # load inventory items if starting from a save
  end

  def save
    if (@id != nil)
      update_character_stats(@id)
      update_character_inventory(@id)
    else
      create_character_stats
      create_character_inventory
    end
  end

  def update_character_stats(id)
    db = Sequel.postgres('text_adv_db', :user => ENV['DB_USERNAME'], :password => ENV['DB_PASSWORD'])
  end

  def update_character_inventory(id)
    db = Sequel.postgres('text_adv_db', :user => ENV['DB_USERNAME'], :password => ENV['DB_PASSWORD'])
  end
end # end character class
