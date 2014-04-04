# == Class: cgroups::params
#
# This defines configuration values for cgroups. You don't want to use it directly.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'cgroups::params': }
#
class cgroups::params {

  case $::osfamily {
    redhat: {
      $package_name          = 'libcgroup'
      $package_status        = 'latest'
      $cgconfig_service_name = 'cgconfig'
      $cgconfig_conf         = '/etc/cgconfig.conf'
      $cgred_service_name    = 'cgred'
      $cgred_conf            = '/etc/sysconfig/cgred.conf'
      $cgrules_conf          = '/etc/cgrules.conf'
    }
    debian: {
      $package_name          = 'cgroup-bin'
      $package_status        = 'latest'
      $cgconfig_service_name = 'cgconfig'
      $cgconfig_conf         = '/etc/cgconfig.conf'
      $cgred_service_name    = 'cgred'
      $cgred_conf            = '/etc/default/cgred.conf'
      $cgrules_conf          = '/etc/cgrules.conf'
    }
    default: {
      fail("The ${module_name} module is not supported on ${::osfamily}/${::operatingsystem}.")
    }
  }
}
