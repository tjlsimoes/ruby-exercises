class Person
  MAX_HEALTH = 120

  attr_accessor :name, :age, :health, :strength, :dead
  def  initialize(name, age, health, strength)
    @name = name
    @age = age
    @health = health
    @strength = strength

    @dead = false
  end

  def heal
    self.health += 1 unless self.health + 1 > MAX_HEALTH
  end
end



class Viking < Person

  def heal
    2.times{ super }
    puts "Ready for battle!" 
  end

  def self.create_warrior(name)
    age = rand * 20 + 15
    health = [age * 5, 10].min
    strength = [age / 2, 10].min
    Viking.new(name, health, age, strength)
  end

  def shout(str)
    puts str
  end

  def self.random_name
    ["Erik", "Lars", "Leif"].sample
  end

  def self.silver_to_gold(silver_pieces)
    silver_pieces / 10
  end

  class << self 
    def gold_to_silver(gold_pieces)
      gold_pieces * 10
    end
  end

  def attack(recipient)
    if recipient.dead
      puts "#{recipient.name} is already dead!"
      return false
    end
    damage = (rand * 10 + 10).round(0)
    recipient.take_damage(damage)
  end

  protected

  def take_damage(damage)
    self.health -= damage #or @health -= damage
    self.shout("Ouch! #{self.name} took #{damage} damage and has #{self.health} health left.") #self optional. Ruby would assume, if nothing to the contrary, that #shout method was being called
    die if self.health <= 0
  end

  private

  def die
    puts "#{self.name} has benn killed :("
    self.dead = true
  end
end

oleg = Viking.create_warrior("Oleg")
sten = Viking.create_warrior("Sten")

10.times {oleg.attack(sten)}

p sten