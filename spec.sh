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
  s.files       = [\"lib/swag.rb\", \"lib/swag_helper.rb\", \"lib/vars.rb\"]
  s.homepage    = 'http://rubygems.org/gems/swag'
  s.license     = \"BSD-3-Clause\"
  s.executables << 'swag'
  end" > swag.gemspec

echo "Remember to update the version in lib/vars.rb."
