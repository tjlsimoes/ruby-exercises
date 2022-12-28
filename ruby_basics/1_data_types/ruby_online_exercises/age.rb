# def getsUserAge()
#     puts "Wie alt bist du?";
#     age = gets.chomp.to_i;
#     puts "In 10 years you will be:\n #{age += 10}";
#     puts "In 20 years you will be:\n #{age += 10}";
#     puts "In 30 years you will be:\n #{age += 10}";
#     puts "In 40 years you will be:\n #{age += 10}";
# end

# getsUserAge;



def getsUserAge()
    puts "Wie alt bist du?";
    age = gets.chomp.to_i;
    puts "In 10 years you will be:\n #{age + 10}";
    puts "In 20 years you will be:\n #{age + 20}";
    puts "In 30 years you will be:\n #{age + 30}";
    puts "In 40 years you will be:\n #{age + 40}";
end

getsUserAge;