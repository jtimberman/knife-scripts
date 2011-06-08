Overview
====

This repository is a collection of scripts that can be used with knife exec.

Usage
====

Simply point knife exec at the desired script in this directory.

    knife exec knife-scripts/$SCRIPT_NAME.rb

Individual Scripts
----

The scripts are intended to be simple and straightforward to use. This section describes additional configuration when required.

# chef\_server\_backup.rb

This script backs up the following data from the Chef Server.

* nodes
* roles
* data bags and items

This script will use `.chef/chef_server_backup` as the default directory to backup the data to, but you can change the location by setting `knife[:chef_server_backup_dir]` in `.chef/knife.rb`. For example:

    knife[:chef_server_backup_dir] = "/home/username/chef_backups"

Cookbooks are not backed up as they are assumed to already be in the chef-repo and can be uploaded using `knife cookbook upload -a`. Clients are not backed up as they should be reregistered using the validation certificate of the new Opscode Platform organization or other Chef Server.

Bugs
====

See [How to Contribute](wiki.opscode.com/display/chef/How+to+Contribute) to Opscode projects if you encounter a bug with these scripts and would like to contribute a fix.

Copyright and License
====

Copyright: 2011, Joshua Timberman (<joshua@opscode.com>)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
