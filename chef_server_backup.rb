#
# Author:: Joshua Timberman (<joshua@opscode.com>)
# Author:: Adam Jacob (<adam@opscode.com>)
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

Chef::Config[:solo] = false

class Opscode
  class Backup
    attr_accessor :backup_dir

    def initialize
      @backup_dir = Chef::Config[:knife][:chef_server_backup_dir] ? Chef::Config[:knife][:chef_server_backup_dir] : File.join(".chef", "chef_server_backup")
    end

    def backup
      nodes
      roles
      data_bags
    end

    def nodes
      backup_standard("nodes", Chef::Node)
    end

    def roles
      backup_standard("roles", Chef::Role)
    end

    def data_bags
      dir = File.join(@backup_dir, "data_bags")
      system("mkdir -p #{dir}")
      Chef::DataBag.list.each do |bag_name, url|
        system("mkdir -p #{File.join(dir, bag_name)}")
        Chef::DataBag.load(bag_name).each do |item_name, url|
          Chef::Log.info("Backing up data bag #{bag_name} item #{item_name}")
          item = Chef::DataBagItem.load(bag_name, item_name)
          File.open(File.join(dir, bag_name, "#{item_name}.json"), "w") do |dbag_file|
            dbag_file.print(item.to_json)
          end
        end
      end
    end

    def backup_standard(component, klass)
      dir = File.join(@backup_dir, component)
      system("mkdir -p #{dir}")
      klass.list.each do |component_name, url|
        Chef::Log.info("Backing up #{component} #{component_name}")
        component_obj = klass.load(component_name)
        File.open(File.join(dir, "#{component_name}.json"), "w") do |component_file|
          component_file.print(component_obj.to_json)
        end
      end
    end

  end
end

b = Opscode::Backup.new
b.backup
