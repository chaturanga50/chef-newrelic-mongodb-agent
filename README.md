Description
===========

Installs new relic mongo monitoring agent.

Requirements
============

Tested on CentOS & Amazon Linux. Should work on Debian and Fedora

Cookbooks
---------

No other cookbooks are required.

Attributes
==========

* `node['newrelic']['license_key']` - Your newrelic license key. From Account Settings -> Account Information.
* `node['newrelic']['app_name']` - Your newrelic application name
* `node['newrelic']['endpoint']` - Mongo Endpoint
* `node['newrelic']['database']` - Mongo database
* `node['newrelic']['mongo_user']` - Mongo user for get stats
* `node['newrelic']['mongo_pw']` - Mongo pw for above user

Usage
=====

Include `recipe[mongo_newrelic_agent]` in a run list to have the system monitored. This performs a baseline installation. You'll need to change the attributes to the key from your New Relic Settings page and Mongo details.

References
==========

* [New Relic home page](http://newrelic.com/)
* [Plugin](https://github.com/eksoverzero/newrelic_mongodb_agent/) by Steven Eksteen

License and Author
==================

Author: Chathuranga Abeyrathna (<chaturanga.abeyrathna@pearson.com>)

Copyright 2018.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
