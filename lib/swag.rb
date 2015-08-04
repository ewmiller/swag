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
	def self.analyzeController(name, doc)
		puts "Analyzing controller: #{name}"
		# controller = File.open("app/controllers/#{name}", 'r')
		File.open("app/controllers/#{name}", 'r') do |c|
			c.each_line do |line|
				puts "#{name} contains index" if line.include? "def index"
			end
		end
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
				c = c.slice(0..(c.index('_') -1))
				doc << "    /#{c}:\n"
			end
		end
	  doc.close
		end
	end
end
