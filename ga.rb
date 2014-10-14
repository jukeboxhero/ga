require 'csv'
require 'date'

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }

DELINEATORS = [',', '$', '|']

data 	= Data.parse_all
entries = Entry.create_all_from_data(data)