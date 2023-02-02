require "csv"
require "time"

puts "EventManager initialized"

def clean_dates_and_times(date_and_time)

    splitted = date_and_time.split(" ")

    date = splitted[0]
    time = splitted[1]

    date_split = date.split("/")

    clean_date = []
    clean_date << date_split[2] << date_split[0] << date_split[1]
    clean_date = clean_date.join("-")

    clean_date_and_time = []
    clean_date_and_time << clean_date << time
    clean_date_and_time.join(" ")
end

contents = CSV.open(
    "event_attendees.csv",
    headers: true,
    header_converters: :symbol
)


days = contents.inject([]) do |days, row|
            name = row[:first_name]
            date_and_time = clean_dates_and_times(row[:regdate])

            date_and_time = Date.parse(date_and_time)

            day = date_and_time.wday

            days << day
        end


days = days.map{ |day| Date::DAYNAMES[day] }


count_on_days = days.group_by { |day| days.count(day)}

count_on_days = count_on_days.transform_values! { |value| value.uniq }


count_on_days.each_pair do |count, days|  

    if count == 1 && days.length == 1

        puts "#{days.join("h ")} occured #{count} time." 

    elsif days.length == 1

        puts "#{days.join("h ")} occured #{count} times."     
    
    elsif count == 1 

        puts "#{days.join("h ")} occured #{count} time." 

    else
            
        puts "#{days.join("h ")} occured #{count} times." 

    end

end