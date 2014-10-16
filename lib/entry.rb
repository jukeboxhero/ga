class Entry

	attr_reader :last_name, :first_name, :middle_initial, :dob,
				:campus, :favorite_color

	def initialize(data={})
		parse_attributes(data)
		clean_data!
	end

	def parse_attributes(data)
		@last_name 			= data[0]
		@first_name 		= data[1]
		@campus		 		= data[2]
		@favorite_color 	= data[3]
		@dob 				= data[4]
	end

	def clean_data!
		instance_variables.map(&method(:instance_variable_get)).each do |val|
			val.strip!
		end
		format_dob!
		format_campus!
	end

	def format_dob!
		if @dob
			@dob =~ /\d+(.)\d+(.)\d+/
		   	@dob = Date.strptime(@dob, "%m#{$1}%d#{$1}%Y")
		end
	end

	def format_campus!
		if @campus
			@campus = CITY_CODES[@campus] || @campus
		end
	end

end