require_relative 'swag_helper.rb'
require_relative 'vars.rb'
require 'yaml'


class Swag

	@helper = SwagHelper.new

	def self.hi
		puts "Swag, world."
	end

	def self.usage
		puts "Usage: swag <command>"
		puts "Command options: config, <path>, merge"
		puts "config"
		puts " - sets up the 'swag' folder in your current directory."
		puts " - creates 'swag/config.yml' for your API's meta information."
		puts " - swag/config.yml MUST exist in order for swag to run properly."
		puts "<path>"
		puts " - where <path> is a path in your API to document"
		puts " - for example , 'swag users' will document the /users path"
		puts " - documentation is generated as swag/<path>-api.yml"
		puts "merge"
		puts " - generates swag/api.yml, a full documentation of your API."
		puts " - reads from all swag/<path>-api.yml files to accomplish this."
		puts " - important: you must document each path individually before merging."
	end

	def self.config
		puts "Starting configuration..."
		if File.exist?("swag/config.yml")
			puts "Config file already exists. Proceeding."
		else
			Dir.mkdir("swag")
			@helper.makeConfig
			puts "Created swag/config.yml"
			puts "Please edit swag/config.yml to include your API's meta info."
			puts "This is important in order for swag to work properly!"
			puts "Run 'swag' again when ready. Aborting."
			abort
		end
	end

	def self.merge
		doc = File.open("swag/api.yml", 'w')
		@helper.readConfig(doc)
		doc.close
	end

	def self.path(arg)
		puts "Path to explore: /#{arg}"
		puts "Is this correct? [y/n]:"
		answer = STDIN.gets.chomp
		if answer.downcase == "y"
			puts "yes"
		elsif answer == ""
			puts "yes"
		elsif answer.downcase == "n"
			puts "no"
		else
			puts "?"
		end
	end
end # end Class
