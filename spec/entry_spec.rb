require 'spec_helper'

describe Entry do
	describe "#initialize" do
		before(:all) do
			@entry = Entry.new(["Kirlin", " Mckayla", " Atlanta    ", " Maroon ", " 5/29/1986   "])
		end
		it "should remove all leading and trailing whitespace from attributes" do
			@entry.last_name.should eq("Kirlin")
			@entry.first_name.should eq("Mckayla")
			@entry.campus.should eq("Atlanta")
			@entry.favorite_color.should eq("Maroon")
		end
		it "should convert date strings to date objects" do
			@entry.dob.class.should eq(Date)
			@entry.dob.month.should eq(5)
			@entry.dob.day.should eq(29)
			@entry.dob.year.should eq(1986)
		end
		it "should convert campus city codes to full city names" do
			@entry = Entry.new(["Kirlin", " Mckayla", " NYC    ", " Maroon ", " 5/29/1986   "])
			@entry.campus.should eq("New York City")
		end
	end
end