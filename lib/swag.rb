class Swag
  def self.hi
    puts "Swag, world."
  end

  def self.check
    puts "Checking your directory: #{Dir.pwd}"
    if File.exist?("bin/rails")
      puts "Rails App detected. Proceeding."
    else
      puts "You must be in a Rails root directory for Swag to work."
    end
  end
end
