require_relative 'global_vars.rb'

class SwagHelper

  def initialize
  end

  def readConfig(doc)
    File.open("swagGem/config.yml", 'r') do |c|
      c.each_line do |line|
        doc << "#{line}"
      end # end each line block
    end # close File block
  end

  def writeConfig
    config = File.open("swagGem/config.yml", 'w')
    config << "swag: #{$SWAG_VERSION}\n"
    config << "info:\n"
    config << "    version:\n"
    config << "    title: #{File.basename(Dir.getwd)}\n"
    config << "    description: a Rails app.\n"
    config << "    author:\n"
    config << "        name:\n"
    config << "        contact:\n"
    config << "    license:\n"
    config << "paths:\n"
    config.close
  end

  # checks config info
  def checkConfig(doc)
    # open config file (if it exists)
    # read line-by-line
    # write relevant information to doc
    if File.exists?("swagGem/config.yml")
      readConfig(doc)
    else
      writeConfig
      readConfig(doc)
    end
  end

  # prints index info to open YAML File 'doc'
  def doIndex(nameSliced, controllerName, doc)
    puts "#{controllerName} contains index"
    doc << "    get:\n"
    doc << "      description: returns an index for this resource.\n"
  end

  def doCreate(nameSliced, controllerName, doc)
    puts "#{controllerName} contains new"
    doc << "    post:\n"
    singular = controllerName.slice(0..(nameSliced.index('s') -1))
    doc << "      description: creates a new instance of this resource.\n"
  end

  def doShow(nameSliced, controllerName, doc)
    puts "#{controllerName} contains show"
    doc << "  /#{nameSliced}/:id\n"
  end
end # end class
