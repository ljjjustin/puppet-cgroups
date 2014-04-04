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
#    permission => {task_user => 'root', task_group => 'root', admin_user => 'root', admin_group => 'root'},
#    controller => {cpuset => {'cpuset.cpus' => '0', 'cpuset.mems' => '0'}},
#  }
#
define cgroups::group (
  $permission = false,
  $controller = false,
  $parameters = false,
) {

  # check parameters
  if ! $controller or ! $parameters {
    fail("You MUST provide 'controller' and 'parameters' in order to define a group")
  }

  concat::fragment { "cgroups-group-${name}":
    target  => $::cgroups::cgconfig_conf,
    content => template("${module_name}/group.conf.erb"),
    require => Package[$::cgroups::package_name],
    notify  => Service[$::cgroups::cgconfig_service_name],
  }
}
