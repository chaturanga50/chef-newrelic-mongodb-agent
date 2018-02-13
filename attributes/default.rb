#
# Cookbook Name:: newrelic_monitoring
# Attributes:: default
#
# Copyright 2018
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['newrelic']['license_key'] = "newrelic_license"
default['newrelic']['app_name'] = "newrelic_app_name"
default['newrelic']['mongo_user'] = "newrelic_mongo_user"
default['newrelic']['mongo_pw'] = "newrelic_mongo_password"
