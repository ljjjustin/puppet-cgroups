cgroups::rule { 'rule1':
  user        => 'root',
  controllers => 'cpu',
  destination => 'group1/',
}

cgroups::rule { 'rule2':
  user        => '@root',
  process     => '/bin/bash',
  controllers => 'cpu',
  destination => 'group2/',
}
