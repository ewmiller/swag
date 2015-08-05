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
    config << "  version:\n"
    config << "  title: #{File.basename(Dir.getwd)}\n"
    config << "  description: a Rails app.\n"
    config << "  author:\n"
    config << "      name:\n"
    config << "      contact:\n"
    config << "  license:\n"
    config << "schemes:\n"
    config << "  - http\n"
    config << "consumes:\n"
    config << "produces:\n"
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
    # puts "#{controllerName} contains index"
    doc << "    get:\n"
    doc << "      description: returns an index for this resource.\n"
    doc << "      produces:\n"
    doc << "      parameters:\n"
    doc << "      responses:\n"
    doc << "        200:\n"
    doc << "            description: #{nameSliced} response\n"
    doc << "            schema:\n"
    doc << "        default:\n"
    doc << "            description: unexpected error\n"
    doc << "            schema:\n"
  end

  def doCreate(nameSliced, controllerName, doc)
    # puts "#{controllerName} contains new"
    doc << "    post:\n"
    doc << "      description: creates a new instance of this resource.\n"
    doc << "      produces:\n"
    doc << "      parameters:\n"
    doc << "      responses:\n"
    doc << "        200:\n"
    doc << "            description: #{nameSliced} response\n"
    doc << "            schema:\n"
    doc << "        default:\n"
    doc << "            description: unexpected error\n"
    doc << "            schema:\n"
  end

  def doShow(nameSliced, controllerName, doc)
    # puts "#{controllerName} contains show"
    doc << "  /#{nameSliced}/:id\n"
    doc << "    get:\n"
    doc << "      description: returns a specific #{nameSliced} item.\n"
    doc << "      produces:\n"
    doc << "      parameters:\n"
    doc << "        - name: id\n"
    doc << "          in: path\n"
    doc << "          description: id of specific #{nameSliced} object\n"
    doc << "          required: true\n"
    doc << "          type: integer\n"
    doc << "          format:\n"
    doc << "    responses:\n"
    doc << "        200:\n"
    doc << "            description: #{nameSliced} response\n"
    doc << "            schema:\n"
    doc << "        default:\n"
    doc << "           description: unexpected error\n"
    doc << "           schema:\n"
  end

  def doDelete(nameSliced, controllerName, doc)

  end
end # end class
