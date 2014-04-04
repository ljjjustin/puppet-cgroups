# == Class: cgroups::install
#
# This class make sure that the required packages are installed.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'cgroups::install': }
#
class cgroups::install {
  if $cgroups::package_name != false {
    package { $cgroups::package_name:
      ensure => $cgroups::package_status
    }
  }
}
