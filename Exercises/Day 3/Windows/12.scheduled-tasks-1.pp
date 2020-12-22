scheduled_task { 'Disk Cleanup':
  command   => "$::system32\\WindowsPowerShell\\v1.0\\powershell.exe",
  arguments => '-File "C:\\Scripts\\Clear-DiskSpace.ps1"',
  enabled   => 'true',
  trigger   => [{
    schedule   => 'once',
    start_time => '23:20',
    start_date => '2018-01-01'
  }],
}