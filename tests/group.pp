cgroups::group { 'group1':
  controller => 'cpuset',
  parameters => {'cpuset.cpus' => '0', 'cpuset.mems' => '0'},
}
cgroups::group { 'group2':
  controller => 'cpuset',
  permission => {'task_user' => 'root', 'task_group' => 'root', 'admin_user' => 'root', 'admin_group' => 'root'},
  parameters => {'cpuset.cpus' => '0', 'cpuset.mems' => '0'},
}
