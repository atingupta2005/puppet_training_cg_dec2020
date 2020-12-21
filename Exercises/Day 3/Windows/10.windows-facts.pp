$app_data = $facts['windows_env']['APPDATA']
# Output the AppData path in the puppet log
notify { $app_data: }