class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def info
    "#{self.name} weighs #{self.weight} and is #{self.height} tall."
  end

  def what_is_self
    self
  end

  puts self
end

# sparky = GoodDog.new("Sparky", "12 inches", "10 lbs")
# p sparky.what_is_self

# That's interesting. From within the class, when an instance method uses self, it references the calling object. In this case, that's the sparky object. Therefore, from within the change_info method, calling self.name= acts the same as calling sparky.name= from outside the class (you can't call sparky.name= inside the class, though, since it isn't in scope). Now we understand why using self to call instance methods from within the class works the way it does! https://launchschool.com/books/oo_ruby/read/classes_and_objects_part2 .....

# To be clear, from within a class...

# self, inside of an instance method, references the instance (object) that called the method - the calling object. Therefore, self.weight= is the same as sparky.weight=, in our example.

# self, outside of an instance method, references the class and can be used to define class methods. Therefore if we were to define a name class method, def self.name=(n) is the same as def GoodDog.name=(n).


