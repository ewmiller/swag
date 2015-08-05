class SwagHelper

  def initialize
  end

  # prints index info to open YAML File 'doc'
  def doIndex(controllerName, doc)
    puts "#{controllerName} contains index"
    doc << "    get:\n"
    doc << "      description:\n"
  end

  def doCreate(controllerName, doc)
    puts "#{controllerName} contains new"
    doc << "    post:\n"
    doc << "      description:\n"
  end

  def doShow(controllerName, doc)
    puts "#{controllerName} contains show"
    doc << "  /#{nameSliced}/:id\n"
  end
end # end class
