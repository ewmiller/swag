require_relative 'vars.rb'

class SwagHelper

  def initialize
  end

  def readConfig(doc)
    File.open("swag/config.rb", 'r') do |c|
      c.each_line do |line|
        doc << "#{line}"
      end # end each line block
    end # close File block
  end

  def makeConfig
    config = File.open("swag/config.rb", 'w')
    config << "swag: '#{SWAG_VERSION}'\n"
    config << "info:\n"
    config << "  version:\n"
    config << "  title: #{File.basename(Dir.pwd)}\n"
    config << "  description: an API.\n"
    config << "  author:\n"
    config << "      name:\n"
    config << "      contact:\n"
    config << "  license:\n"
    config << "host: localhost:3000\n"
    config << "basepath: /\n"
    config << "schemes:\n"
    config << "  - http\n"
    config << "paths:\n"
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
