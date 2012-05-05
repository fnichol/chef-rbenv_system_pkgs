maintainer       "Fletcher Nichol"
maintainer_email "fnichol@nichol.ca"
license          "Apache 2.0"
description      "Installs pre-built rbenv Ruby version tarballs in a system install."
long_description "Please refer to README.md (it's long)."
version          "0.1.0"

depends "ruby_build"
depends "rbenv"

recommends "java", "> 1.4.0"  # if using jruby, java is required on system

supports "ubuntu"
