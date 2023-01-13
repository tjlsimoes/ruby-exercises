class Student
    def initialize(name, grade)
        @grade = grade
        @name = name
    end

    def better_grade_than?(another_student)
        self.grade > another_student.grade

    end
    protected

    def grade
        @grade
    end

end

joe = Student.new("joe", 100)
bob = Student.new("bob", 80)

puts "Well done!" if joe.better_grade_than?(bob)