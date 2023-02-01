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


hours = contents.inject([]) do |hours, row|
            name = row[:first_name]
            date_and_time = clean_dates_and_times(row[:regdate])

            date_and_time = Time.parse(date_and_time)

            hour = date_and_time.hour
            
            hours << hour
            hours.sort
        end

count_on_hours = hours.group_by { |hour| hours.count(hour)}

count_on_hours = count_on_hours.transform_values! { |value| value.uniq }


count_on_hours.each_pair do |count, hours|  

    if count == 1

        puts "The following hours #{hours.join("h ")}h occured #{count} time." 

    else
            
        puts "The following hours #{hours.join("h ")}h occured #{count} times." 

    end

end
