class Entry

	attr_reader :last_name, :first_name, :middle_initial, :dob

	def initialize(data={})
		@last_name 			= data[0]
		@first_name 		= data[1]
		@middle_initial     = data.find { |v| v.size == 1 }
		@dob 				= data.find { |v| v =~ /\d+\/|\-\d+\/|\-\d+/ }
	end

	def self.create_all_from_data(data)
		data.each do |entry_data|
			create_from_data(entry_data)
		end
	end

	def self.create_from_data(data)
		data.map!{|v| v.strip }
		Entry.new(data)
	end

end