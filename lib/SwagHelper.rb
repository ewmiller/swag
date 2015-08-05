class SwagHelper

  def initialize
  end

  # writes config info to YAML doc
  def doConfig(doc)
    # open config file (make one if it doesn't exist)
    # read line-by-line
    # write relevant information to doc
    doc << "info: Generated with Swag.\n"
    doc << "paths:\n"
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
    singular = controllerName.slice(0..(nameSliced.index('s') -1))}
    doc << "      description: creates a new #{singular}\n"
  end

  def doShow(nameSliced, controllerName, doc)
    puts "#{controllerName} contains show"
    doc << "  /#{nameSliced}/:id\n"
  end
end # end class
