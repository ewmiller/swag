require_relative 'swag.rb'
require_relative 'vars.rb'
require 'yaml'

class SwagHelper

  def initialize
  end

  def readConfig(doc)
    # read config.yml in as a Ruby hash. Populate doc with appropriate info.
    config = YAML.load_file('swag/config.yml')
    puts "Loaded config info from swag/config.yml"
    doc << config.to_yaml
    puts "Wrote config info to swag/api.yml"
  end

  def makeConfig
    config = File.open("swag/config.yml", 'w')
    config << "swag: '#{SWAG_VERSION}'\n"
    config << "info:\n"
    config << "  version: \n"
    config << "  title: #{File.basename(Dir.pwd)}\n"
    config << "  description: an API.\n"
    config << "  author:\n"
    config << "      name: Example\n"
    config << "      contact: example@example.com\n"
    config << "  license: BSD 3-Clause\n"
    config << "host: localhost:3000\n"
    config << "basepath: /\n"
    config << "schemes:\n"
    config << "  - http\n"
    config.close
  end

  # prints index info to open YAML File 'doc'
  def doIndex(nameSliced, controllerName, doc)
    doc << "    get:\n"
    doc << "      description: returns an index for #{}.\n"
    doc << "      produces:\n"
    doc << "      parameters:\n"
    doc << "      responses:\n"
    doc << "        200:\n"
    doc << "            description: #{} response\n"
    doc << "            schema:\n"
    doc << "        default:\n"
    doc << "            description: unexpected error\n"
    doc << "            schema:\n"
  end

  def doCreate(nameSliced, controllerName, doc)
    doc << "    post:\n"
    doc << "      description: creates a new #{} instance.\n"
    doc << "      produces:\n"
    doc << "      parameters:\n"
    doc << "      responses:\n"
    doc << "        200:\n"
    doc << "            description: #{} response\n"
    doc << "            schema:\n"
    doc << "        default:\n"
    doc << "            description: unexpected error\n"
    doc << "            schema:\n"
  end

  def doShow(nameSliced, controllerName, doc)
    # puts "#{controllerName} contains show"
    doc << "  /#{nameSliced}/:id\n"
    doc << "    get:\n"
    doc << "      description: returns a specific #{} item by id.\n"
    doc << "      produces:\n"
    doc << "      parameters:\n"
    doc << "        - name: id\n"
    doc << "          in: path\n"
    doc << "          description: id of specific #{} object\n"
    doc << "          required: true\n"
    doc << "          type: integer\n"
    doc << "          format:\n"
    doc << "      responses:\n"
    doc << "        200:\n"
    doc << "          description: #{} response\n"
    doc << "          schema:\n"
    doc << "        default:\n"
    doc << "          description: unexpected error\n"
    doc << "          schema:\n"
  end

  def doDelete(nameSliced, controllerName, doc)
    doc << "    delete:\n"
    doc << "      description: deletes a specific #{} item by id.\n"
    doc << "      produces:\n"
    doc << "      parameters:\n"
    doc << "        - name: id\n"
    doc << "          in: path\n"
    doc << "          description: id of specific #{} object\n"
    doc << "          required: true\n"
    doc << "          type: integer\n"
    doc << "          format:\n"
    doc << "      responses:\n"
    doc << "        204:\n"
    doc << "          description: #{} object deleted\n"
    doc << "          schema:\n"
    doc << "        default:\n"
    doc << "          description: unexpected error\n"
    doc << "          schema:\n"
  end
end # end class
