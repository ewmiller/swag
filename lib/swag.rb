require_relative 'swag_helper.rb'
require_relative 'vars.rb'


class Swag

	@helper = SwagHelper.new

	def self.hi
		puts "Swag, world."
	end

	def self.config
		puts "Starting configuration..."
		if File.exist?("swag/config.rb")
			puts "Config file already exists. Proceeding."
		else
			Dir.mkdir("swag")
			@helper.makeConfig
			puts "Created swag/config.rb"
		end
	end

end # end Class
