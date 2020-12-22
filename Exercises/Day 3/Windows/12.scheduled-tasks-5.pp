#To run at logon, use the logon trigger:
scheduled_task { 'example_notepad':
  compatibility => 2,
  command       => 'C:\\Windows\\System32\\notepad.exe',
  trigger       => [{
    schedule => 'logon',
    user_id  => 'MyDomain\\SomeUser'
  }],
}