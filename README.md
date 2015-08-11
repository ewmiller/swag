# swag
A Ruby gem for generating [Swagger](http://swagger.io/)-style API documentation.


Current status: under development. The latest (published) version of swag can be found on
[rubygems.org/gems/swag](http://rubygems.org/gems/swag).

## Overview
Want an easier way to generate API documentation? The goal of Swag is to automate the
process of writing YAML files for that purpose.

## Usage
(As development continues, the specifics of usage may change. Some of these
features may or may not be implemented yet):

Swag will need the user's help in order to figure out how an API works and
document it. This will most likely be a combination of reading a config file
and getting user input from the command line. On swag's first run, it will create
a ```swag``` directory and populate it with a file called ```config.yml```. Then
the config will need to be populated with certain information, including:

 - the API's base URL (default is localhost:3000)
 - paths to different resources (e.g. users, blog articles, etc.)
 - meta info such as the API's title, author, version, etc.

Alternatively, a user can call ```swag``` on individual resources. For example,
calling ```swag users``` from the command line will generate documentation for
*only* the ```users``` resource of the API.

The swag output will be saved to the ```swag``` directory as YAML files.

## Build Scripts (for gem development)
This repository includes ```spec.sh```, a bash script for automatically updating the version and
date information in the ```swag.gemspec``` file, as well as ```rebuild.sh```, to quicken
the process of rebuilding the gem during testing. I recommend using these for
development; they quicken the process and make sure that global variables stay
up-to-date.

## License

[BSD-3-Clause](http://spdx.org/licenses/BSD-3-Clause.html#licenseText)

Copyright (c) 2015 Ethan W. Miller. All rights reserved.
Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
