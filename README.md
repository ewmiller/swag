# swag
A Ruby gem for generating YAML from within Rails apps.

Current status: under development.

## Overview
Want an easier way to generate API documentation? The goal of Swag is to automate the
process of writing YAML files for that purpose. From within a Rails app, a user will be 
able to enter ```swag``` in the command line, and Swag will figure out their app's 
functionality. A YAML file will be generated to describe the results. Specific 
controllers will be able to be invoked, too. Let's say there's a resource called 
```documents``` in a user's app - typing ```swag documents``` will generate 
a YAML doc specifically for that resource.

## Latest Version
The latest version of Swag can be found on [rubygems.org/gems/swag](http://rubygems.org/gems/swag).
