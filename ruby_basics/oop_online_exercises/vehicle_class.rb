module Towable
    def can_tow?(pounds)
        pounds < 2000
    end
end


class Vehicle
    attr_accessor :color
    attr_reader :model, :year
    @@number_of_vehicles = 0

    def self.vehicles_number
        p "This program has created #{@@number_of_vehicles} vehicles."
    end

    def self.gas_mileage(gallons, miles)
        puts "#{miles / gallons} miles per gallon of gas"
    end
    
    def initialize(year, model, color)
        @year = year
        @model = model
        @color = color

        @@number_of_vehicles += 1
        @current_speed = 0
    end

    def speed_up(num)
        @current_speed += num
        p "You've just sped up #{num} mph!"
    end

    def brake(num)
        @current_speed -= num 
        p "You've deccelerated #{num} mph!"
    end

    def shut_down 
        @current_speed = 0
        puts "Shutdown!"
    end

    def spray_paint(color)
        self.color = color
        puts "Your new #{color} paint job looks great!"
    end

    def current_speed
        p "You have a current speed of #{@current_speed} mph!"
    end

    def how_old
        p "Your #{self.model} is #{calc_age} years old!"
    end

    private

    def calc_age
        Time.new.year - self.year
    end
end

class MyCar < Vehicle
    NUMBER_OF_DOORS = 4

    def to_s
        "My car is a #{self.color}, #{self.year}, #{self.model}"
    end
end


class MyTruck < Vehicle
    include Towable

    NUMBER_OF_DOORS = 2

    def to_s
        "My truck is a #{self.color}, #{year}, #{self.model}!"
    end
end


lumina = MyCar.new(1997, "chevy lumina", "white")
lumina.speed_up(20)
lumina.current_speed
lumina.speed_up(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.shut_down
MyCar.gas_mileage(13, 351)
lumina.spray_paint("red")
puts lumina
puts MyCar.ancestors
puts MyTruck.ancestors
puts Vehicle.ancestors


lumina.how_old