# Define Character Class
class Character
  attr_reader :max_xp
  attr_accessor :current_xp

  # example of a const(DEFAULT_NAME = 'Player McPlayerFace')

  def initialize
    @name       = "Max"
    @max_xp     = 7440
    @current_xp = 0
    @max_hp     = 10
    @curren_hp  = 10
    @ac         = 10
    @gold       = 10
    @move_speed = 30
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
    puts "#{(Math.log2(1.075) * Math.sqrt(current_xp)).to_i}"
  end

  def award_xp(awarded_xp)
    @current_xp += awarded_xp
  end

  def attack
    # attack
  end

  def negotiate
    # negotiate
  end

  def search
    # search
  end

  def move
    #move
  end

end # end character class


@susan = Character.new

# @goblin = Creature.new(name: 'Bob', xp: 25)
# @susan.awardXP(@goblin.xp)
@susan.award_xp(3000)
puts "Susan's current experience points = #{@susan.current_xp}"
puts "Susan's level is #{@susan.calculate_level(@susan.current_xp)}"
puts "awarding 1000 xp"
@susan.award_xp(1000)
puts "Susan's new experience points = #{@susan.current_xp}"
puts "Susan's level is #{@susan.calculate_level(@susan.current_xp)}"
