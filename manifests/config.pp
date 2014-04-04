# == Class: cgroups::config
#
# This class provides minimal configurations for cgroups service.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'cgroups::config': }
#
class cgroups::config {
  concat { $::cgroups::cgconfig_conf:
    owner   => 'root',
    group   => 'root',
    require => Class['cgroups::install'],
    notify  => Class['cgroups::service'],
  }
  concat::fragment { '00-cgroup-mounts':
    order   => '00',
    target  => $::cgroups::cgconfig_conf,
    content => template("${module_name}/cgconfig.conf.erb"),
  }
  file { $cgroups::cgred_conf:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    content => template("${module_name}/cgred.conf.erb"),
    require => Class['cgroups::install'],
    notify  => Class['cgroups::service'],
  }
  file { $cgroups::cgrules_conf:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    content => template("${module_name}/cgrules.conf.erb"),
    require => Class['cgroups::install'],
    notify  => Class['cgroups::service'],
  }
}
