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
			puts "Please edit swag/config.rb to include your API's paths."
			puts "List them under the provided \"paths:\" section using YAML formatting."
			puts "Also be sure to edit the other default information. This is crucial\n
			in order for swag to work properly!"
			puts "If no paths are provided, only the root path / \n
			will be documented."
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
