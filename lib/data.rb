class Data
	@@data_path = 'data/*.txt'

	def self.parse_all
		result = Collection.new

		Dir.glob(@@data_path) do |item|
			data_sample = File.open(item).first
			api_class	= Data.file_to_class(item)

			DELIMETERS.each do |del|
				# if data is delimited by one of our allowed delimeters,
				# parse it and create an object with the data
				if data_sample.split(del).size > 1
					file_data 	= Data.parse(item,del)
					file_data.each do |entry_data|
						result << api_class.new(entry_data)
					end
					break
				end
			end
		end
		result
	end

	def self.file_to_class(path)
		basename 	= File.basename(path, '.txt')
		class_name 	= basename.downcase.split.each_with_index.map { |v| v.capitalize }.join

		# need to namespace classes so a user can't add a file like string.rb
		if GA.const_defined?(class_name)
			return GA.const_get(class_name)
		end
		Entry
	end

	def self.parse(filename, delimeter = ',')
		CSV.read(filename, :col_sep => delimeter)
	end

	class Collection < Array

		attr_accessor :format

		def initialize
			@format = DEFAULT_ENTRY_FORMAT
			super
		end

		def order!(attribute, attribute2=nil, opts={})
			result = if attribute2
				self.sort_by! {|x| [x.send(attribute), x.send(attribute2)] }
			else
				self.sort_by! {|x| x.send(attribute) }
			end

			result.reverse! if opts[:order] == 'DESC'
		end

		def dump
			self.each do |entry|
				output = ''
				format.each do |x|
					value = entry.send(x)
					value = value.class == Date ? value.strftime("%-m/%-d/%Y") : value
					output += "#{value} "
				end
				puts output
			end
		end
	end
end