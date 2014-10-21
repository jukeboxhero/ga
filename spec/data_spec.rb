require_relative 'spec_helper'

describe Data do
	describe ".parse_all" do
		it "should return a collection object" do
			Data.parse_all.class.should eq(Data::Collection)
		end
		it "should parse values for all files with valid delimeters" do
			Data.should_receive(:parse).exactly(3).times.and_return([])
			Data.parse_all
		end
	end

	describe ".file_to_class" do
		it "should return the proper API class if it exists" do
			Data.file_to_class('data/comma.txt').should eq(GA::Comma)
		end
		it "should return default Entry class if API class does not exist" do
			Data.file_to_class('data/bogus.txt').should eq(Entry)
		end
		it "should only return a scoped class to avoid existing classes in ruby" do
			Data.file_to_class('data/string.txt').should eq(Entry)
		end
	end

	describe Data::Collection do

		before(:each) do
			@jerry = Entry.new(['Only', 'Jerry', 'New Jersey', 'Black', '11/1/1988'])
			@milo  = Entry.new(['Aukerman', 'Milo', 'Hermosa Beach', 'White','10/12/1984'])
			@greg  = Entry.new(['Ginn', 'Greg', 'Los Angeles', 'Black', '1/4/1979'])
		end

		describe '#order!' do

			it 'should sort by string' do
				result = Data::Collection.new([@jerry, @milo, @greg])
				result.order!(:first_name)
				result.should eq([@greg, @jerry, @milo])
			end
			it 'should sort by date' do
				result = Data::Collection.new([@greg, @jerry, @milo])
				result.order!(:dob)
				result.should eq([@greg, @milo, @jerry])
			end
			it 'should sort by two parameters' do
				result = Data::Collection.new([@milo, @jerry, @greg])
				result.order!(:favorite_color, :last_name)
				result.should eq([@greg, @jerry, @milo])
			end
			it 'should sort in desc order' do
				result = Data::Collection.new([@milo, @jerry, @greg])
				result.order!(:favorite_color, :last_name, :order => 'DESC')
				result.should eq([@milo, @jerry, @greg])
			end
		end

		describe '#dump' do
			it 'shoulld' do
				result = Data::Collection.new([@jerry, @milo, @greg])
				expect { result.dump }.to output("Only Jerry New Jersey 11/1/1988 Black \nAukerman Milo Hermosa Beach 10/12/1984 White \nGinn Greg Los Angeles 1/4/1979 Black \n").to_stdout
			end

		end
	end
end