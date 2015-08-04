gem uninstall swag
rm swag-*
gem build swag.gemspec
gem install ./swag-*
