class Swag
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
		end
	end

	# writes specific controller's routes (helper for self.writePaths)
	# 'name' is the controller's name, 'doc' is the open YAML File to write to
	def self.analyzeController(controllerName, doc)
		puts "Analyzing controller: #{controllerName}"
		# controller = File.open("app/controllers/#{controllerName}", 'r')
		nameSliced = controllerName.slice(0..(controllerName.index('_') -1))
		doc << "  /#{nameSliced}:\n"
		File.open("app/controllers/#{controllerName}", 'r') do |c|
			@show = false
			c.each_line do |line|
				if line.include? "def index"
					puts "#{controllerName} contains index"
					doc << "    get:\n"
					doc << "      description:\n"
				elsif line.include? "def create"
					puts "#{controllerName} contains new"
					doc << "    post:\n"
					doc << "      description:\n"
				elsif line.include? "def show"
					@show = true
				end
			end # end each_line do block
			if @show
				puts "#{controllerName} contains show"
				doc << "  /#{nameSliced}/:id\n"
			end
		end # end File.open do block
		puts "Closed file." # closed automatically
	end

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
		end
	end
end
