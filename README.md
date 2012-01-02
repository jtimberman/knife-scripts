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

This script is deprecated. You should look at [Steven Danna's knife hacks](https://github.com/stevendanna/knife-hacks/) for the `backup_export.rb` and `backup_restore.rb` plugins.

Copyright and License
====

Copyright: 2011, Joshua Timberman (<opensource@housepub.org>)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
