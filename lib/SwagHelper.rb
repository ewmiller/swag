class SwagHelper

  def initialize
  end

  def readConfig(doc)
    File.open("swagGem/config.yml", 'r') do |c|
      c.each_line do |line|
        doc << "#{line}\n"
      end # end each line block
    end # close File block
  end

  # checks config info
  def checkConfig(doc)
    # open config file (if it exists)
    # read line-by-line
    # write relevant information to doc
    if File.exists?("swagGem/config.yml")
      readConfig(doc)
    else
      config = File.open("swagGem/config.yml", 'w')
      config << "info:\n"
      config << "paths:\n"
      config.close
      readConfig(doc)
    end
  end

  # prints index info to open YAML File 'doc'
  def doIndex(nameSliced, controllerName, doc)
    puts "#{controllerName} contains index"
    doc << "    get:\n"
    doc << "      description: returns an index of all #{nameSliced}.\n"
  end

  def doCreate(nameSliced, controllerName, doc)
    puts "#{controllerName} contains new"
    doc << "    post:\n"
    singular = controllerName.slice(0..(nameSliced.index('s') -1))
    doc << "      description: creates a new #{singular}\n"
  end

  def doShow(nameSliced, controllerName, doc)
    puts "#{controllerName} contains show"
    doc << "  /#{nameSliced}/:id\n"
  end
end # end class
