class Data

	def self.parse_all
		result = []

		Dir.glob('data/*.txt') do |item|
			first_line = File.open(item).first

			DELINEATORS.each do |del|

				if first_line.split(del).size > 1
					result.concat(CSV.read(item, :col_sep => del))
					break
				end
			end
		end
		result
	end

end