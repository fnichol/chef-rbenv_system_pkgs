#
# Cookbook Name:: rbenv_system_pkgs
# Library:: Chef::RbenvSystemPkgs::RecipeHelpers
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

class Chef
  module RbenvSystemPkgs
    module RecipeHelpers
      def install_ruby_pkg_dependencies(version, rbenv_resource)
        case version
        when /^\d\.\d\.\d-/, /^rbx-/, /^ree-/
          pkgs = node['ruby_build']['install_pkgs_cruby']
        when /^jruby-/
          pkgs = node['ruby_build']['install_pkgs_jruby']
        else
          pkgs = []
        end

        Array(pkgs).each do |pkg|
          package pkg do
            action      :nothing
            subscribes  :install, resources(rbenv_resource), :immediately
          end
        end
      end

      def pkg_url_from_version(root_url, ruby_version)
        pkg_name = [
          "rbenv-system",
          "-#{node['platform']}-#{node['platform_version']}",
          "-#{ruby_version}",
          "-#{node['kernel']['machine']}",
          ".tar.gz"
        ].join
        "#{root_url}/#{pkg_name}"
      end
    end
  end
end
