# == Class: cgroups::service
#
# This class enforces running of the cgroups service.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'cgroups::service': }
#
class cgroups::service {
  service { $::cgroups::cgconfig_service_name:
    ensure  => running,
    enable  => true,
    require => Class['cgroups::config'],
  }
  service { $::cgroups::cgred_service_name:
    ensure  => running,
    enable  => true,
    require => Class['cgroups::config'],
  }
}
