file{'c:/tempperms':
 ensure => directory,
}

# By default, the acl creates an implicit relationship to any
# file resources it finds that match the location.
acl {'c:/tempperms':
  inherit_parent_permissions => false,
  permissions                => [
    {identity => 'Administrators', rights => ['full']},
    {identity => 'Users', rights => ['read','execute']}
  ],
}