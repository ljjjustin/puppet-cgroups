# == Class: cgroups::rule
#
# This class define a cgroup rule.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  cgroups::rule { 'root':
#    user        => 'root',
#    controllers => '*',
#    destination => 'root/',
#  }
#
define cgroups::rule (
  $user = false,
  $process = false,
  $controllers = false,
  $destination = false,
) {

  # check parameter
  if ! $user or ! $controllers or ! $destination {
    fail("You MUST provide 'user', 'controllers' and 'destination' in order to define a rule")
  }

  if $process {
    $real_user = "${user}:${process}"
  } else {
    $real_user = $user
  }
  
  # modify cgroup rules
  file_line { "$::cgroups::cgrules_conf $name":
    path    => $::cgroups::cgrules_conf,
    line    => "$real_user $controllers $destination",
    require => Package[$::cgroups::package_name],
    notify  => Service[$::cgroups::cgred_service_name],
  }
}
