SWAG_VERSION = '0.5.1'

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
  "paths" => {}
}

$DEFAULT_GET = {
  "description" => "",
  "produces" => "",
  "parameters" => "",
  "responses" => {
    "200:" => {
      "description" => "",
      "schema" => "",
    },
    "default" => {
      "description" => "unexpected error",
      "schema" => [],
    },
  },
}

$DEFAULT_POST = {
  "description" => "",
  "produces" => "",
  "parameters" => [],
  "responses" => {
    "200:" => {
      "description" => "",
      "schema" => [],
    },
    "default" => {
      "description" => "unexpected error",
      "schema" => [],
    },
  },
}

$DEFAULT_PATCH = {}

$DEFAULT_PUT = {}

$DEFAULT_DELETE = {
  "description" => "",
  "produces" => "",
  "parameters" => [{
    "name" => "id",
    "in" => "path",
    "description" => "id of entry to be deleted.",
    "required" => "true",
    "type" => "integer",
    }],
  "responses" => {
    "200:" => {
      "description" => "",
      "schema" => [],
    },
    "default" => {
      "description" => "unexpected error",
      "schema" => "",
    },
  },
}
