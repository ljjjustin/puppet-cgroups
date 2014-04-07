# == Class: cgroups::group
#
# This class define a cgroup group.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  cgroups::group { 'root':
#    permissions => {task_user => 'root', task_group => 'root', admin_user => 'root', admin_group => 'root'},
#    controllers => {cpu => {'cpu.shares' => '1024'}, cpuset => {'cpuset.cpus' => '0', 'cpuset.mems' => '0'}},
#  }
#
define cgroups::group (
  $permissions = false,
  $controllers = false,
) {

  # check controllers
  if ! $controllers {
    fail("You MUST provide 'controllers' in order to define a group")
  }

  concat::fragment { "cgroups-group-${name}":
    target  => $::cgroups::cgconfig_conf,
    content => template("${module_name}/group.conf.erb"),
    require => Package[$::cgroups::package_name],
    notify  => Service[$::cgroups::cgconfig_service_name],
  }
}
