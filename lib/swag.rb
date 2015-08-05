require_relative 'SwagHelper.rb'

class Swag

	@helper = SwagHelper.new

	def initialize
	end

	def self.hi
    	puts "Swag, world."
	end

	# verifies rails directory
	def self.check
		puts "Checking your directory: #{Dir.pwd}"
    	if File.exist?("bin/rails")
    		puts "Rails App detected. Proceeding."
    	else
    		puts "You must be in a Rails root directory for Swag to work. Aborting."
    		abort
    	end
	end

	# checks that app/controllers can be read
	def self.checkControllers
    	puts "Checking controllers."
		begin
			Dir.foreach("app/controllers") do |c|
					puts "Found #{c}"
				end
    		rescue => ex
    			puts "Error while reading controllers."
					puts ex.inspect
					puts ex.backtrace
		end # end begin
	end # end checkControllers

	# writes specific controller's routes (helper for self.writePaths)
	# 'controllerName' is the controller's name, 'doc' is the open File
	def self.analyzeController(controllerName, doc)
		puts "Analyzing controller: #{controllerName}"

		# edits the controller name for use in the File
		nameSliced = controllerName.slice(0..(controllerName.index('_') -1))
		doc << "  /#{nameSliced}:\n"

		File.open("app/controllers/#{controllerName}", 'r') do |c|
			@show = false
			c.each_line do |line|
				if line.include? "def index"
					@helper.doIndex(controllerName, doc)
				elsif line.include? "def create"
					@helper.doCreate(controllerName, doc)
				elsif line.include? "def show"
					@show = true
				end
			end # end each_line do block
			if @show
				puts "#{controllerName} contains show"
				doc << "  /#{nameSliced}/:id\n"
			end
		end # end File.open do block (File is closed automatically)
	end # end analyzeController

	# lists controller paths by reading app/controllers directory
	def self.writePaths
    	puts "Writing paths."
		begin
			doc = File.open("doc.yml", 'w')
			doc << "info: Generated with Swag.\n"
			doc << "paths:\n"
			Dir.foreach("app/controllers") do |c|
				unless (c == "." || c == ".." || c == "concerns" ||
					c == "application_controller.rb")
					analyzeController(c, doc)
				end
			end
	  	doc.close
			rescue => ex
				puts "Error while writing paths."
				puts ex.inspect
				puts ex.backtrace
		end # end begin block
	end # end writePaths
end # end Class
