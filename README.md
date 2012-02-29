puppet-git-face
=====================

Description
-----------

A Puppet Face for pulling manifests from a git repo and running locally.

Requirements
------------

* `puppet` ~> 2.7.0

### Rubygems ###

* `git`

Installation
------------

Install puppet-git-face as a module in your Puppet master's module path.

Usage
-----

puppet help git

Notes
-----

There is currently no way to edit repository settings after adding.  To change the root manifest, modulepath, etc. just edit the appropriate file in $GITCACHE/repo/.puppet-git.

Author
------

Shawn Siefkas 
<shawn@siefk.as>

License
-------

    Author:: Shawn Siefkas (<shawn@siefk.as>)
    Copyright:: Copyright (c) 2011 Shawn Siefkas
    License:: Apache License, Version 2.0

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
