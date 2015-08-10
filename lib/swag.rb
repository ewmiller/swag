require_relative 'swag_helper.rb'
require_relative 'global_vars.rb'


class Swag
	def self.hi
		puts "Swag, world."
	end

	def self.checkConfig
		if File.exist?("swag/config.yml")
			puts "Found config file. Proceeding."
		else
			Dir.mkdir("swag")
			File.open("swag/config.yml", 'w')
			puts "Created swag/config.yml"
		end
	end
end # end Class
