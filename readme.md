GA Test App
==============

This is my submission for the General Assembly code challenge.  A couple notes:

Run ga.rb for the requested output.

This is intended to be flexible.  If you have a need to add another "api" (add another txt file to the data folder), the app will be aware of it.  Additionally, you can add characters to the delimiter whitelist if the file follows a different format.

If additional txt files follow a unique separated-list-order, you can add a file to the lib folder with the same name as the txt file.  Simply namespace it to 'GA', subclass Entry, and override the parse_attributes method (see comma.rb for example).

In the config.rb file, you may change default values.  For additional city codes that may exist in your file, you can add to the CITY_CODES constant.  Additionally, you can change the format of the data output at run time by setting format on your collection.  For example:

	entries = Data.parse_all
	entries.format = [:first_name, :campus]

Will give you the output:

	Syd Atlanta
	Frankie New York City
	Bob	San Francisco

I believe that should sum it up.  Enjoy!