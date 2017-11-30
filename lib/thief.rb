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
    # we want to determine their stats and immediately agro
    negotiate
  end

  def initialize_level
    1 + rand(5)
  end

  def initialize_hp
    (@level.to_i * (1+ rand(10)))
  end

  def initialize_ac
    (@level.to_i + 10)
  end

  def initialize_xp
    (@level.to_i * (1 + rand(100)))
  end

  def initialize_gold
    (@level.to_i * rand(1000))
  end

  def accept_tribute
    # thief accepts gold and flees the encounter
    puts "The Theif accepts your offer and flees."
    flee
  end

  def demand_tribute
    # demand gold from a Player
    generate_threat
    puts "Give me #{calculate_gold} and I might just let you live."
  end

  def generate_threat
    # generate a random string
    threat = Array.new(4) {
      "You picked the wrong time to get lost buddy.",
      "Give me what I want and no one gets hurt.",
      "Suprised you didn't I?",
      "Hands in the air! This is a hold-up!"
    }
    return threat[rand(4)]
  def offer_gold
    # offers gold for it's life
    offer = (1 + rand((@gold-10))
    puts "The Theif offers you #{offer} gold in exchange for his life."
  end

  def calculate_gold
    # determines how much gold is demanded or offered
    @level + (1+rand(100))
  end

  def negotiate(character_level)
    # determines if the will flee, offer gold or fight
    if @level < character_level
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
