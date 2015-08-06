require_relative 'swag_helper.rb'
require_relative 'global_vars.rb'

class Swag

	@helper = SwagHelper.new

	def initialize
	end

	def self.hi
    	puts "Swag, world."
	end

	# verifies rails directory
	def self.checkDir
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

	def self.checkRoutes
		if !File.exists?("config/routes.rb")
			puts "Could not find config/routes.rb. Aborting."
			abort
		else
			puts "Found config/routes.rb. Proceeding."
		end
	end

	# checks config info
  def self.checkConfig(doc)
    # open config file (if it exists)
    # read line-by-line
    # write relevant information to doc
    if File.exists?("swag/config.yml")
      @helper.readConfig(doc)
    else
      @helper.writeConfig
      @helper.readConfig(doc)
    end
  end

	# writes specific controller's routes (helper for self.writePaths)
	# 'controllerName' is the controller's name, 'doc' is the open File
	def self.analyzeController(controllerName, doc)
		puts "Analyzing controller: #{controllerName}"

		# edits the controller name for use in the File
		nameSliced = controllerName.slice(0..(controllerName.index('_') -1))
		doc << "  /#{nameSliced}:\n"

		File.open("app/controllers/#{controllerName}", 'r') do |c|
			@show = false
			@delete = false
			c.each_line do |line|
				if line.include? "def index"
					@helper.doIndex(nameSliced, controllerName, doc)
				elsif line.include? "def create"
					@helper.doCreate(nameSliced, controllerName, doc)
				elsif line.include? "def show"
					@show = true
				elsif line.include? "def delete"
					@delete = true
				end
			end # end each_line do block
			@helper.doShow(nameSliced, controllerName, doc) if @show
			@helper.doDelete(nameSliced, controllerName, doc) if @delete
		end # end File.open do block (File is closed automatically)
	end # end analyzeController

	# lists controller paths by reading app/controllers directory
	def self.writePaths
    puts "Writing paths."
		begin
			# creates directory for swag to use
			Dir.mkdir("swag") unless File.exists?("swag")
			doc = File.open("swag/api.yml", 'w')

			# sets up doc w/ config info
			checkConfig(doc)

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
