cgroups::group { 'group1':
  permissions => {'task_user' => 'root', 'task_group' => 'root', 'admin_user' => 'root', 'admin_group' => 'root'},
  controllers => {cpu => {'cpu.shares' => '1024'}, cpuset => {'cpuset.cpus' => '0', 'cpuset.mems' => '0'}},
}
