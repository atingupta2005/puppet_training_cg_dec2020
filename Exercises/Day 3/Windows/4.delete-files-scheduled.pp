#To delete all files recursively from C:\Windows\Temp at 8 AM each day, create a resource called scheduled_task with these attributes:
scheduled_task { 'Purge global temp files':
   ensure    => present,
   enabled   => true,
   command   => 'c:\\windows\\system32\\cmd.exe',
   arguments => '/c "del c:\\windows\\temp\\*.* /F /S /Q"',
   trigger   => {
      schedule   => daily,
      start_time => '08:00',
  }
}