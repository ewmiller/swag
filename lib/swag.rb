class Swag
	def self.hi
    	puts "Swag, world."
	end

	def self.check
		puts "Checking your directory: #{Dir.pwd}"
    	if File.exist?("bin/rails")
    		puts "Rails App detected. Proceeding."
    	else
    		puts "You must be in a Rails root directory for Swag to work.
    		Aborting."
    		abort
    	end
	end

	def self.checkControllers
    	puts "Checking controllers."
		begin
		controllerArray = readControllers
		controllerArray.foreach {|controller| puts "Found #{controller}"}
    	rescue Exception
    		puts "Error while reading controllers."
		end
	end

	def self.writePaths
    	puts "Writing paths."
		begin
		doc = open(doc.yml, 'w')
		doc.truncate(0)
		doc.write("")
		end
	end

	private
	def readControllers
		arr = {}
		Dir.foreach("app/controllers") {|x| arr.add(x)}
	end
end
