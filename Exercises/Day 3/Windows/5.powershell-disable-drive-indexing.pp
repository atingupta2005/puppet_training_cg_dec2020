#A common Windows maintenance tasks is to disable Windows drive indexing, because it can negatively impact disk performance on servers.
#To disable drive indexing:
$drive = 'C:'

exec { 'disable-c-indexing':
   provider  => powershell,
   command   => "\$wmi_volume = Get-WmiObject -Class Win32_Volume -Filter 'DriveLetter=\"${drive}\"'; if (\$wmi_volume.IndexingEnabled -ne \$True) { return }; \$wmi_volume | Set-WmiInstance -Arguments @{IndexingEnabled = \$False}",
   unless    => "if ((Get-WmiObject -Class Win32_Volume -Filter 'DriveLetter=\"${drive}\"').IndexingEnabled) { exit 1 }",
}