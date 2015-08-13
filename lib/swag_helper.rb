require_relative 'swag.rb'
require_relative 'vars.rb'
require 'yaml'
require 'net/http'

class SwagHelper

  def initialize
  end

  def setupApi
    doc = File.open("swag/api.yml", 'w')
    # read config.yml in as a Ruby hash. Populate doc with appropriate info.
    config = YAML.load_file('./swag/config.yml')
    puts "Loaded config info from swag/config.yml"
    doc << config.to_yaml
    puts "Wrote config info to swag/api.yml"
    doc.close
  end

  # TODO: leaving this as a reminder to implement /path/:id
  # def doShow(nameSliced, controllerName, doc)
  #   # puts "#{controllerName} contains show"
  #   doc << "  /#{nameSliced}/:id\n"
  # end

  def doGet(fullPath)
    getArray = $DEFAULT_GET
    puts "Sending an http get request to #{fullPath}. Returning a hash."

    return getArray
  end

  def doPost(fullPath)

  end

  def doPatch(fullPath)

  end

  def doDelete(fullPath)

  end

  # have not implemented yet
  def doPut(fullPath)

  end

  def doPath(arg, api)
    input = {
      "#{arg}" => {
        "get" => $DEFAULT_GET,
        "post" => $DEFAULT_POST,
        "patch" => {},
        "delete" => $DEFAULT_DELETE,
      },
    }
    # the path to send to HTTP methods
    fullPath = "#{api["host"]}#{api["basepath"]}#{arg}"

    # assign the get, post, patch, delete sections for this path
    # call the HTTP methods from above
    input["#{arg}"]["get"] = doGet(fullPath)
    input["#{arg}"]["post"] = doPost(fullPath)
    # input["#{arg}"]["patch"] = doPatch(fullPath)
    # input["#{arg}"]["delete"] = doDelete(fullPath)

    # now that the path info is assigned, combine it with the whole API doc
    api["paths"]["#{arg}"] = input["#{arg}"]

    # write the final product to swag/api.yml
    begin
      doc = File.open("swag/api.yml", 'w')
      doc << api.to_yaml
          puts "Wrote api info to swag/api.yml"
      doc.close
    rescue Errno::ENOENT => e
      puts "Error creating file: swag/api.yml"
      puts e
    rescue IOError => e
      puts "Error writing to file: swag/api.yml"
      puts e
    end
  end
end # end class
