class SwagHelper

  def initialize
  end

  # prints index info to open YAML File 'doc'
  def doIndex(controllerName, doc)
    puts "#{controllerName} contains index"
    doc << "    get:\n"
    doc << "      description:\n"
  end
end # end class
