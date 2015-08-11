require_relative 'swag_helper.rb'
require_relative 'global_vars.rb'


class Swag

	@helper = SwagHelper.new

	def self.hi
		puts "Swag, world."
	end

	def self.config
		if File.exist?("swag/config.yml")
			puts "Config file already exists. Proceeding."
		else
			Dir.mkdir("swag")
			@helper.makeConfig
			puts "created swag/config.yml"
		end
	end

end # end Class
