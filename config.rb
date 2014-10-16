require 'csv'
require 'date'
require './lib/entry'

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }



module GA
	module Config
		DELIMETERS = [',', '$', '|']
		CITY_CODES  = {
			'ATL' => 'Atlanta',
			'HK'  => 'Hong Kong',
			'LA'  => 'Los Angeles',
			'LUK' => 'London',
			'MAU' => 'Melbourne',
			'NYC' => 'New York City',
			'SF'  => 'San Francisco'
		}
		DEFAULT_ENTRY_FORMAT = [:last_name, :first_name, :campus, :dob, :favorite_color]
	end
end

include GA::Config