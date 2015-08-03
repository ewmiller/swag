echo "Enter version number"
read version
echo "Gem::Specification.new do |s|
  s.name        = 'swag'
  s.version     = '$version'
  s.date        = `date +"%Y%m%d"`
  s.summary     = \"Swag. Under development.\"
  s.description = \"A gem with which to generate YAML from a Rails app. Currently
  under development.\"
  s.authors     = [\"Ethan Miller\"]
  s.email       = \"ethan.w.miller@gmail.com\"
  s.files       = [\"lib/swag.rb\"]
  s.homepage    = 'http://rubygems.org/gems/swag'
  s.license     = \"\"
  s.executables << 'swag'
  end" > swag.gemspec 
