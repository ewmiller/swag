# swag
A Ruby gem for generating YAML from within Rails apps, in the style of
[Swagger](http://swagger.io/).

Current status: under development.

## Overview
Want an easier way to generate API documentation? The goal of Swag is to automate the
process of writing YAML files for that purpose. From within a Rails app, a user will be
able to enter ```swag``` in the command line, and Swag will figure out their app's
functionality. A YAML file will be generated to describe the results. Specific
resources can be queried, too. Let's say there's a resource called
```documents``` in a user's app - typing ```swag documents``` will generate
a YAML doc specifically for that resource.

## Latest Version
The latest version of Swag can be found on
[rubygems.org/gems/swag](http://rubygems.org/gems/swag).

## Running Locally
To install the latest published version, simply run ```gem install swag```. To build
and run from the directory, do the following:

    gem build swag.gemspec
    gem install ./swag-*.gem

Then navigate to a Rails directory and simply run ```swag```.

## Other Info
This repo includes ```spec.sh```, a bash script for automatically updating the version and
date information in the ```swag.gemspec``` file, as well as ```rebuild.sh```, to quicken
the process of rebuilding the gem during testing.
