class Viking
    attr_accessor :name, :age, :health, :strength
   def  initialize(name, age, health, strength)
     @name = name
     @age = age
     @health = health
     @strength = strength
   end

   def self.create_warrior(name)
    age = rand * 20 + 15
    health = [age * 5, 10].min
    strength = [age / 2, 10].min
    Viking.new(name, health, age, strength)
   end

   def take_damage(damage)
    self.health -= damage #or @health -= damage
    self.shout("OUCH!") #self optional. Ruby would assume, if nothing to the contrary, that #shout method was being called
   end

   def shout(str)
    puts str
   end
end

sten = Viking.create_warrior("Sten")
p sten