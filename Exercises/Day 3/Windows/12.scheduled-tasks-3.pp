# - You can also set your scheduled tasks to repeat during a set time block
# - Using the cleanup script again, this scheduled task begins at the same time every day and runs once an hour from seven in the morning to seven at night as the SYSTEM account.

scheduled_task { 'Disk Cleanup Daily Repeating':
  ensure    => 'present',
  command   => "$::system32\\WindowsPowerShell\\v1.0\\powershell.exe",
  arguments => '-File "C:\\Scripts\\Clear-DiskSpace.ps1"',
  enabled   => 'true',
  trigger   => [{
    'schedule'         => 'daily',
    'start_time'       => '07:00',
    'minutes_duration' => '720',   # Specifies the length of time, in minutes, the task is active
    'minutes_interval' => '60'     # Causes the task to run every hour
  }],
  user      => 'system',           # Specifies the account to run the task as
}