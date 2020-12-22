```
scheduled_task { 'Disk Cleanup Nightly':
  command   => "$::system32\\WindowsPowerShell\\v1.0\\powershell.exe",
  arguments => '-File "C:\\Scripts\\Clear-DiskSpace.ps1"',
  enabled   => 'true',
  trigger   => [{
    schedule   => 'daily',
    start_time => '23:20'
  }],
}
```