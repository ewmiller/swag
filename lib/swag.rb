class Swag
	def initialize
	end
	def self.hi
    	puts "Swag, world."
	end

	def self.check
		puts "Checking your directory: #{Dir.pwd}"
    	if File.exist?("bin/rails")
    		puts "Rails App detected. Proceeding."
    	else
    		puts "You must be in a Rails root directory for Swag to work. Aborting."
    		abort
    	end
	end

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

	def self.writePaths
    	puts "Writing paths."
		begin
		@controllerArray = self.readControllers
		doc = open(doc.yml, 'w')
		doc.truncate(0)
		doc.write("info: Generated with Swag.\n")
		doc.write("paths:\n")
		@controllerArray.each {|c| doc.write("-#{c}\n")}
		end
	end
end
