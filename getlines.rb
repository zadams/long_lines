#!/usr/bin/ruby 

lines = Array.new

#read lines from sample file into array of hashes

File.open('sample_file.txt','r') do |file|
  while (line = file.gets)
    lines << {:text => line, :length => line.length}
  end
end

# sort array by line length

lines = lines.sort_by {|line| line[:length]}

#output n longest lines to a new file

newfile = File.new('longest_lines.txt','w+')

print "How many lines would you like?: "
num_lines = gets.chomp

num_lines = lines.size if num_lines.to_i > lines.size

num_lines.to_i.times {|i| newfile.puts(lines.pop[:text])} if num_lines

newfile.close
