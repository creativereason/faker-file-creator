# faker-file-creator

## Create a tab delimited file with Ruby Faker data. 

Wrote this to help create some data I needed for mockups, not much to it. I only created a repo for this because I've done this about 20 times now and always have to look up something and this should speed that up. 

## Requirements

- Ruby
- [Ruby Faker](https://github.com/faker-ruby/faker) Gem installed

## To Use: 

Start a ruby console

	irb

Run the following commands to generate a file:

	load 'generate.rb'
	names = GenerateNames.new
	names.init

If everything is working correctly, this will create a file called __companies.txt__. 

## Next Steps: 

I probably will add to this as I need different data... 

If you have different needs, this is a good example of a Ruby wrapper of Faker for you, it should be pretty easy to create your own or use any of the different methods in Faker.

