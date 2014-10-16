module GA
	class Dollar < Entry
		def parse_attributes(data={})
			@last_name 			= data[0]
			@first_name 		= data[1]
			@middle_initial		= data[2]
			@campus			 	= data[3]
			@dob 				= data[4]
			@favorite_color 	= data[5]
		end
	end
end