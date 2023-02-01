require "csv"

puts "EventManager initialized"

def clean_homephone(phone_number)
    
    phone_number = phone_number.split("").grep(/\d/).join("")

    if phone_number.length == 11

        if phone_number[0] == 1
        
            phone_number[1..11]

        else

            phone_number = "0000000000"

        end

    elsif phone_number.length == 10

        phone_number

    else
        phone_number = "0000000000"
    end

    # Possibly not contemplating case of nil output?
end




contents = CSV.open(
    "event_attendees.csv",
    headers: true,
    header_converters: :symbol
)

contents.each do |row|
    name = row[:first_name]
    phone_number = clean_homephone(row[:homephone])
    
    puts "#{name} #{phone_number}"
end