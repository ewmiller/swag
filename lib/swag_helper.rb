require_relative 'swag.rb'
require_relative 'vars.rb'
require 'yaml'
require 'net/http'

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
    config << $DEFAULT_CONFIG.to_yaml
    config.close
  end

  # TODO: leaving this as a reminder to implement the /path/:id path thing yeah
  # def doShow(nameSliced, controllerName, doc)
  #   # puts "#{controllerName} contains show"
  #   doc << "  /#{nameSliced}/:id\n"
  #   doc << "    get:\n"
  #   doc << "      description: returns a specific #{} item by id.\n"
  #   doc << "      produces:\n"
  #   doc << "      parameters:\n"
  #   doc << "        - name: id\n"
  #   doc << "          in: path\n"
  #   doc << "          description: id of specific #{} object\n"
  #   doc << "          required: true\n"
  #   doc << "          type: integer\n"
  #   doc << "          format:\n"
  #   doc << "      responses:\n"
  #   doc << "        200:\n"
  #   doc << "          description: #{} response\n"
  #   doc << "          schema:\n"
  #   doc << "        default:\n"
  #   doc << "          description: unexpected error\n"
  #   doc << "          schema:\n"
  # end

  def doGet(fullPath)
    puts "Sending an http get request to #{fullPath}. Returning a hash."
    return $DEFAULT_GET
  end

  def doPath(arg, @config)
    input = {
      "#{arg}" => {
        "get" => {},
        "post" => {},
        "patch" => {},
        "delete" => {},
      },
    }
    fullPath = "#{@config["host"]}#{@config["basepath"]}#{arg}"
    input["paths"]["#{arg}"] = doGet(fullPath)
    begin
      doc = File.open("swag/#{arg}-api.yml", 'w')
        config = YAML.load_file("swag/config.yml")
        doc << config.to_yaml
        puts "Wrote config info to swag/#{arg}-api.yml"
        doc << input.to_yaml
        puts "Wrote path info to swag/#{arg}-api.yml"
      doc.close
    rescue Errno::ENOENT => e
      puts "Error while creating swag/#{arg}-api.yml"
      puts e
      puts "Make sure you run 'swag config' if you haven't yet."
    end
  end
end # end class
