require 'csv'

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }

DELINEATORS = [',', '$', '|']

Data.parse_all