require './config'

entries 	= Data.parse_all

puts "Output 1: "
entries.order!(:campus, :last_name)
entries.dump
puts "\n"


puts "Output 2: "
entries.order!(:dob)
entries.dump
puts "\n"

puts "Output 3: "
entries.order!(:last_name, nil, :order => 'DESC')
entries.dump
puts "\n"