# Exercise: Find the top 10 largest files

dirname = "JavaScript30"

files_by_size =  Dir.glob("#{dirname}/**/*").sort_by! { |element| element.size}

files_by_size[-10..-1]


# Exercise: Determine file makeup of directories, print to spreadsheet

def group_files(type)
    
    dirname = "JavaScript30"

    files = Dir.glob("#{dirname}/**/*").grep(/\.\w*/)
    files.select{ |element| element.end_with?(type)}
end


def get_total_size(type_files)
    type_files.reduce(0) { |sum, file| sum + File.size(file) }
end

def get_count(type_files)
    type_files.count
end


def get_group_files_analysis(type)

    type_files = group_files(type)
    size = get_total_size(type_files)
    count = get_count(type_files)

    "#{type.upcase}   #{count}   #{size}"
    
end



def push_to_file
    File.open("/home/tjlsimoes/repos/ruby-exercises/ruby_basics/files-and-serialization/file-analysis.txt", "w") do |file|
        file.puts("Filetype   Count   Bytes")
        file.puts(get_group_files_analysis("jpg"))
        file.puts(get_group_files_analysis("jpeg"))
        file.puts(get_group_files_analysis("md"))
        file.puts(get_group_files_analysis("html"))
        file.puts(get_group_files_analysis("wav"))
        file.puts(get_group_files_analysis("mp4"))
        file.puts(get_group_files_analysis("mp3"))
        file.puts(get_group_files_analysis("css"))
        file.puts(get_group_files_analysis("js"))
        file.puts(get_group_files_analysis("json"))
        file.puts(get_group_files_analysis("svg"))
        
    end
end

# Exercise: Determine file makeup of directories, print to spreadsheet. Solution:


DIRNAME = "JavaScript30"

hash = Dir.glob("#{DIRNAME}/**/*.*").inject({}) do |hsh, fname|
    ext = File.basename(fname).split('.')[-1].to_s.downcase
    hsh[ext] ||= [0,0] # Define default values, right?
    hsh[ext][0] += 1
    hsh[ext][1] += File.size(fname)   
    hsh
 end          

 File.open("/home/tjlsimoes/repos/ruby-exercises/ruby_basics/files-and-serialization/file-analysis-sol.txt", "w") do |f|
    hash.each do |arr|
      txt = arr.flatten.join("\t")
       f.puts txt
       puts txt
    end

 end


 # Exercise: Read a text file and create a Google Chart


def get_values
    values = []

    File.open("/home/tjlsimoes/repos/ruby-exercises/ruby_basics/files-and-serialization/file-analysis-sol.txt", "r") do |f|

        while !f.eof?
            line = f.readline
            values_per_line = line.split("\t")
            values << values_per_line
        end

    end

    values
end



def get_type_files(values)

    type_files = []

    i = 0    
    while i < values.length do

        type_files << values[i][0]

        i += 1
    end

    type_files
end

def get_num_files(values)

    num_files = []

    i = 0    
    while i < values.length do

        num_files << values[i][1]

        i += 1
    end

    num_files
    
end

def get_url

    get_type_files(get_values)

    get_num_files(get_values)

labels = get_type_files(get_values).join("|")
respective_num = get_num_files(get_values).join(",")

url = "https://chart.googleapis.com/chart?cht=p&chd=t:#{respective_num}&chs=500x300&chl=#{labels}"
end


# https://www.twilio.com/blog/download-image-files-ruby

def push_to_file_ii


    require "open-uri"

    URI.open(get_url) do |image|

        File.open("/home/tjlsimoes/repos/ruby-exercises/ruby_basics/files-and-serialization/analysis.jpg", "w") do |file|
        file.write(image.read)
        end
    end
    
end

 # Exercise: Read a text file and create a Google Chart. Improved solution:

 # Still not fit to restriction:
#  Values are displayed relative to each other: so a chart with values 1,2,3 will look the same as a chart with values 100,200,300. However, when using text format data, values greater than 100 are trimmed to 100, so you will need to use text format with custom scaling to display slices greater than 100 properly (use the chds parameter with min/max values of chds=0,<max-slice-size>).

require 'open-uri'

BASE_URL = "https://chart.googleapis.com/chart?cht=p&chs=500x300"

rows = File.open("/home/tjlsimoes/repos/ruby-exercises/ruby_basics/files-and-serialization/file-analysis-sol.txt"){|f| f.readlines.map{|p| p.strip.split("\t")} }

headers = rows[0]
[1,2].each do |idx|
    labels = []
    values = []
    rows[1..-1].each do |row|
       labels << row[0]
       values << row[idx]
    end

    puts values

    remote_google_img = "#{BASE_URL}&chl=#{labels.join('|')}&chd=t:#{values.join(',')}"
    puts remote_google_img

    URI.open(remote_google_img) do |image|

        File.open("/home/tjlsimoes/repos/ruby-exercises/ruby_basics/files-and-serialization/analysis#{idx}.jpg", "w") do |file|
        file.write(image.read)
        end
    end
end