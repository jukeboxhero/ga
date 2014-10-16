module GA
	class Comma < Entry
		def parse_attributes(data={})
			@last_name 			= data[0]
			@first_name 		= data[1]
			@campus		 		= data[2]
			@favorite_color 	= data[3]
			@dob 				= data[4]
		end
	end
end