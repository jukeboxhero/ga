require 'csv'
require 'date'
require './config'
require './lib/entry'

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each {|file| require file }

RSpec.configure do |config|
	config.before(:each) do
		Data.class_variable_set :@@data_path, 'spec/factories/*.txt'
		stub_const('DELIMETERS', [',', '$', '|'])
	end
end