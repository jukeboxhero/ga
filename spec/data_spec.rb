require 'spec_helper'

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
		describe '#order!' do
			it 'should sort by string' do


			end
			it 'should sort by date' do

			end
			it 'should sort by two parameters' do

			end
			it 'should sort in desc order' do

			end
		end

		describe '#dump' do

		end
	end
end