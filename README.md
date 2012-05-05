# <a name="title"></a> chef-rbenv_system_pkgs

## <a name="description"></a> Description

Installs pre-built [rbenv][rbenv_site] Ruby version tarballs in a system
install.

## <a name="usage"></a> Usage

...coming soon..

## <a name="requirements"></a> Requirements

### <a name="requirements-chef"></a> Chef

Tested on 0.10.8 but newer and older version should work just
fine. File an [issue][issues] if this isn't the case.

### <a name="requirements-platform"></a> Platform

The following platforms have been tested with this cookbook, meaning that
the recipes and LWRPs run on these platforms without error:

* ubuntu (10.04)

Please [report][issues] any additional platforms so they can be added.

### <a name="requirements-cookbooks"></a> Cookbooks

This cookbook depends on the following external cookbooks:

* [ruby_build][ruby_build_cb]
* [rbenv][rbenv_cb]

If you are installing [JRuby][jruby] then a Java runtime will need to be
installed. The Opscode [java cookbook][java_cb] can be used on supported
platforms.

## <a name="installation"></a> Installation

Depending on the situation and use case there are several ways to install
this cookbook. All the methods listed below assume a tagged version release
is the target, but omit the tags to get the head of development. A valid
Chef repository structure like the [Opscode repo][chef_repo] is also assumed.

### <a name="installation-librarian"></a> Using Librarian

[Librarian-Chef][librarian] is a bundler for your Chef cookbooks.
Include a reference to the cookbook in a [Cheffile][cheffile] and run
`librarian-chef install`. To install Librarian-Chef:

    gem install librarian
    cd chef-repo
    librarian-chef init

To reference the Git version:

    cat >> Cheffile <<END_OF_CHEFFILE
    cookbook 'rbenv_system_pkgs',
      :git => 'https://github.com/fnichol/chef-rbenv_system_pkgs', :ref => 'v0.1.0'
    END_OF_CHEFFILE
    librarian-chef install

### <a name="installation-kgc"></a> Using knife-github-cookbooks

The [knife-github-cookbooks][kgc] gem is a plugin for *knife* that supports
installing cookbooks directly from a GitHub repository. To install with the
plugin:

    gem install knife-github-cookbooks
    cd chef-repo
    knife cookbook github install fnichol/chef-rbenv_system_pkgs/v0.1.0

### <a name="installation-tarball"></a> As a Tarball

If the cookbook needs to downloaded temporarily just to be uploaded to a Chef
Server or Opscode Hosted Chef, then a tarball installation might fit the bill:

    cd chef-repo/cookbooks
    curl -Ls https://github.com/fnichol/chef-rbenv_system_pkgs/tarball/v0.1.0 | tar xfz - && \
      mv fnichol-chef-rbenv_system_pkgs-* rbenv_system_pkgs

### <a name="installation-gitsubmodule"></a> As a Git Submodule

A dated practice (which is discouraged) is to add cookbooks as Git
submodules. This is accomplishes like so:

    cd chef-repo
    git submodule add git://github.com/fnichol/chef-rbenv_system_pkgs.git cookbooks/rbenv_system_pkgs
    git submodule init && git submodule update

**Note:** the head of development will be linked here, not a tagged release.

### <a name="installation-platform"></a> From the Opscode Community Platform

This cookbook is not currently available on the site as it relies on a
cookbook ([rbenv][rbenv_cb]) not available on the community site.

## <a name="recipes"></a> Recipes

### <a name="recipes-default"></a> default

...coming soon...

## <a name="attributes"></a> Attributes

### <a name="attributes-root-url"></a> root_url

The base URL from which all tarball packages are available.

The default is `"http://s3.amazonaws.com/rbenv-system-pkgs"`.

## <a name="lwrps"></a> Resources and Providers

There are **no** resources and providers in this cookbook.

## <a name="development"></a> Development

* Source hosted at [GitHub][repo]
* Report issues/Questions/Feature requests on [GitHub Issues][issues]

Pull requests are very welcome! Make sure your patches are well tested.
Ideally create a topic branch for every separate change you make.

## <a name="license"></a> License and Author

Author:: Fletcher Nichol (<fnichol@nichol.ca>)

Copyright 2012, Fletcher Nichol

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

[chef_repo]:        https://github.com/opscode/chef-repo
[cheffile]:         https://github.com/applicationsonline/librarian/blob/master/lib/librarian/chef/templates/Cheffile
[java_cb]:          http://community.opscode.com/cookbooks/java
[gem_package_options]: http://wiki.opscode.com/display/chef/Resources#Resources-GemPackageOptions
[jruby]:            http://jruby.org/
[kgc]:              https://github.com/websterclay/knife-github-cookbooks#readme
[librarian]:        https://github.com/applicationsonline/librarian#readme
[rbenv_cb]:         http://fnichol.github.com/chef-rbenv
[rbenv_site]:       https://github.com/sstephenson/rbenv
[ruby_build_cb]:    http://fnichol.github.com/chef-ruby_build

[repo]:         https://github.com/fnichol/chef-rbenv_system_pkgs
[issues]:       https://github.com/fnichol/chef-rbenv_system_pkgs/issues
