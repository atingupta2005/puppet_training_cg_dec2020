# Title type #1. Variable name and value are extracted from title, splitting on '='.
# Default 'insert' mergemode is selected and default 'present' ensure is selected,
# so this will add 'C:\code\bin' to PATH, merging it neatly with existing content.
windows_env { 'PATH=C:\code\bin': }

# Title type #2. Variable name is derived from the title, but not value (because there is no '=').
# This will remove the environment variable 'BADVAR' completely.
windows_env { 'BADVAR':
  ensure    => absent,
  mergemode => clobber,
}

# Title type #3. Title doesn't set parameters (because both 'variable' and 'value' have
# been supplied manually).
# This will create a new environment variable 'MyVariable' and set its value to 'stuff'.
# If the variable already exists, its value will be replaced with 'stuff'.
windows_env {'random_title':
  ensure    => present,
  variable  => 'MyVariable',
  value     => 'stuff',
  mergemode => clobber,
}

# Create an environment variable for 'Administrator':
windows_env { 'KOOLVAR':
  value => 'hi',
  user  => 'atingupta2005',
}

# Creates (if needed) an enviroment variable 'VAR', and sticks 'VAL:VAL2' at
# the beginning. Separates with : instead of ;. The broadcast_timeout change
# probably won't make any difference.
windows_env { 'title':
  ensure            => present,
  mergemode         => prepend,
  variable          => 'VAR',
  value             => ['VAL', 'VAL2'],
  separator         => ':',
  broadcast_timeout => 2000,
}
