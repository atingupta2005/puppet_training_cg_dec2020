file { 'c:\\Temp\\foo.txt':
  ensure   => present,
  content  => 'This is some text in my file'
}