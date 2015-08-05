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

## Build Scripts
This repo includes ```spec.sh```, a bash script for automatically updating the version and
date information in the ```swag.gemspec``` file, as well as ```rebuild.sh```, to quicken
the process of rebuilding the gem during testing.

## License

[BSD-3-Clause](http://spdx.org/licenses/BSD-3-Clause.html#licenseText)

Copyright (c) 2015 Ethan W. Miller . All rights reserved.
Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
