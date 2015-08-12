require_relative 'swag_helper.rb'
require_relative 'vars.rb'
require 'yaml'


class Swag

	@helper = SwagHelper.new

	def self.hi
		puts "Swag, world."
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

		def self.write
			doc = File.open("swag/api.yml", 'w')
			@helper.readConfig(doc)
			doc.close
		end
	end

end # end Class
