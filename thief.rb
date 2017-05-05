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

  def attack(opponent_ac)
    # based on str
    puts "The Thief swings"

    if roll_to_hit >= opponent_ac
      # this number should be returned?
      roll_dmg
    else
      puts "The Theif misses"
    end
  end

  def roll_to_hit
    # roll d20
    1 + rand(20))
  end

  def roll_dmg
    # dmg = lvl + 1d6
    @level + (1+rand(6))
  end

  def take_dmg(dmg)
    if @hp < dmg
      @hp = 0
      puts "Thief was defeated"
    else
      @hp -= dmg
    end
  end

  def accept_tribute
    # thief accepts gold and flees the encounter
  end

  def demand_tribute
    # demand gold from a Player
    puts "The Thief demands a tribute of gold. They ask for #{calculate_gold}"
  end

  def offer_gold
    # offers gold for it's life
  end

  def calculate_gold
    # determines how much gold is demanded or offered
    @level + (1+rand(100))
  end

  def negotiate
    # determines if the will flee, offer gold or fight
    if level < Character.level
      puts "The thief seems wary"
    else
      demand_tribute
  end

  def flee
    # thief flees the encounter
    puts "Thief flees the encounter"
    # make sure to destroy thief object after flee
  end
end # end of Theif class
