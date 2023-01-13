class MyCar
    attr_accessor :color
    attr_reader :year
    attr_accessor :current_speed


    def initialize(year, color, model)
        @year = year
        @color = color
        @model = model

        @current_speed = 0
    end

    def speed_up(num)
        @current_speed += num
        puts "You've accelerated #{num} mph."
    end

    def brake(num)
        @current_speed -= num
        puts "You've deccelerated #{num} mph."
    end

    def shut_off
        @current_speed = 0
        puts "Stopped!"
    end
end

micra = MyCar.new(1996, "red", "micra")

micra.speed_up(20)
p micra.current_speed
micra.speed_up(20)
micra.brake(40)
micra.shut_off

p micra.year
p micra.color = "white"
p micra.color=("red")
p micra.color