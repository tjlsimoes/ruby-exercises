class Parent
    def say_hi
        p "Hi from Parent."
    end
end

class Child < Parent
    def say_hi
        p "Hi from Child."
    end

    def send
        p "send from Child..."
    end

    def instance_of?
        p "I'm a fake instance"
    end
end

heir = Child.new
heir.instance_of? Child