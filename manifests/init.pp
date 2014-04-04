# == Class: cgroups                                                                                                                                                      
#
# Meta class to install cgroups with a basic configuration.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'cgroups': }
#
class cgroups (
) inherits cgroups::params {
  class { 'cgroups::install': }
  class { 'cgroups::config': }
  class { 'cgroups::service': }
}
