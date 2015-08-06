require_relative 'global_vars.rb'

class SwagHelper

  def initialize
  end

  def readConfig(doc)
    File.open("swag/config.yml", 'r') do |c|
      c.each_line do |line|
        doc << "#{line}"
      end # end each line block
    end # close File block
  end

  def writeConfig
    config = File.open("swag/config.yml", 'w')
    config << "swag: '#{SWAG_VERSION}'\n"
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

  def doRoutes
    routeDoc = File.open("config/routes.rb", 'r') do |r|
      r.each_line do |line|
        if line.include? "resources :"
          puts "read line"
          # puts line unless line.include? " # "
        else
        end
      end # end each_line
    end #close File
  end

  # prints index info to open YAML File 'doc'
  def doIndex(nameSliced, controllerName, doc)
    doc << "    get:\n"
    doc << "      description: returns an index for #{nameSliced}.\n"
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
    doc << "    post:\n"
    doc << "      description: creates a new #{nameSliced} instance.\n"
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
    doc << "      description: returns a specific #{nameSliced} item by id.\n"
    doc << "      produces:\n"
    doc << "      parameters:\n"
    doc << "        - name: id\n"
    doc << "          in: path\n"
    doc << "          description: id of specific #{nameSliced} object\n"
    doc << "          required: true\n"
    doc << "          type: integer\n"
    doc << "          format:\n"
    doc << "      responses:\n"
    doc << "        200:\n"
    doc << "          description: #{nameSliced} response\n"
    doc << "          schema:\n"
    doc << "        default:\n"
    doc << "          description: unexpected error\n"
    doc << "          schema:\n"
  end

  def doDelete(nameSliced, controllerName, doc)
    doc << "    delete:\n"
    doc << "      description: deletes a specific #{nameSliced} item by id.\n"
    doc << "      produces:\n"
    doc << "      parameters:\n"
    doc << "        - name: id\n"
    doc << "          in: path\n"
    doc << "          description: id of specific #{nameSliced} object\n"
    doc << "          required: true\n"
    doc << "          type: integer\n"
    doc << "          format:\n"
    doc << "      responses:\n"
    doc << "        204:\n"
    doc << "          description: #{nameSliced} object deleted\n"
    doc << "          schema:\n"
    doc << "        default:\n"
    doc << "          description: unexpected error\n"
    doc << "          schema:\n"
  end
end # end class
