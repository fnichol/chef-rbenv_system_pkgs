#
# Cookbook Name:: rbenv_system_pkgs
# Recipe:: default
#
# Author:: Fletcher Nichol <fnichol@nichol.ca>
#
# Copyright 2012, Fletcher Nichol
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

# mixin helpers for this recipe
self.class.send(:include, Chef::RbenvSystemPkgs::RecipeHelpers)

include_recipe "ark"

pkg_url_root        = node['rbenv_system_pkgs']['root_url'].sub(%r{/$}, '')
rbenv_versions_path = "#{node['rbenv']['root_path']}/versions"
rbenv_resource      = {:bash => "Initialize rbenv (system)"}

node['rbenv']['rubies'].each do |ruby_version|
  pkg_url = pkg_url_from_version(pkg_url_root, ruby_version)

  install_ruby_pkg_dependencies(ruby_version, rbenv_resource)

  ark ruby_version do
    path    rbenv_versions_path
    url     pkg_url
    action  :nothing

    not_if  { ::File.directory? "#{rbenv_versions_path}/#{ruby_version}" }
    only_if %{curl -sLI #{pkg_url} | head -n 1 | grep -q ' 200 '}

    subscribes :put, resources(rbenv_resource), :immediately
  end
end

rbenv_rehash "After rbenv_system_pkgs" do
  action      :nothing
  subscribes  :run, resources(rbenv_resource), :immediately
end
