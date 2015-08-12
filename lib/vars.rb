SWAG_VERSION = '0.3.5'

$DEFAULT_CONFIG = {
  "swag" => "#{SWAG_VERSION}",
  "info" => {
    "version" => '0.0',
    "title" => "My API.",
    "description" => "An API.",
    "author" => {
      "name" => "Example",
      "contact" => "example@example.com",
    },
    "license" => "BSD 3-Clause",
  },
  "host" => "localhost:3000",
  "basepath" => "/",
  "schemes" => ["http"],
}
