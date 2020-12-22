# puppet module install puppetlabs-scheduled_task --version 2.3.1
```
scheduled_task { 'Disk Cleanup': # Unique name for the scheduled task
  command   => "$::system32\\WindowsPowerShell\\v1.0\\powershell.exe",
  arguments => '-File "C:\\Scripts\\Clear-DiskSpace.ps1"',
  enabled   => 'true',           # This is the default, but including it is good practice. Flip to 'false' to disable the task.
  trigger   => [{
    schedule   => 'once',        # Defines the trigger type; required.
    start_time => '23:20',       # Defines the time the task should run; required.
    start_date => '2018-01-01'   # Defaults to the current date; not required.
  }],
}
```