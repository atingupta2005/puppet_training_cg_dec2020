#To manage administrator accounts with Puppet, create a user resource with 'Administrator' as the resource title
user { 'Administrator':
   ensure => present,
   password => 'Azure@123456789'
}