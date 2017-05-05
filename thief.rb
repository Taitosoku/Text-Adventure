# defines the Theif Object
class Thief
  def initialize
    @type  = "Thief"
    @level = initialize_level
    @hp    = initialize_hp
    @ac    = initialize_ac
    @xp    = initialize_xp
    @gold  = initialze_gold
    @str   = initialize_str
  end

  def attack
    # based on str
    puts "The Thief swings"
    success = roll_to_hit
    if success
      roll_dmg
    else
      puts "The Theif misses"
    end
  end

  def accept_tribute
    # thief accepts gold and flees the encounter
  end

  def demand_tribute
    # demand gold from a Player
  end

  def offer_gold
    # offers gold for it's life
  end

  def negotiate
    # determines if the will flee, offer gold or fight
    if level < Character.level
      puts "The thief seems wary"
    else
      puts "The thief demands a tribute of #{demand_tribute}"
  end

  def flee
    # thief flees the encounter
  end
end # end of Theif class
