#Adding or Removing Windows Features
#Add a Windows Feature
dsc_windowsfeature {'featureexample':
  dsc_ensure = 'present'
  dsc_name = 'Web-Server'
}

#Remove a Windows Feature
dsc_windowsfeature {'featureexample':
  dsc_ensure = 'absent'
  dsc_name = 'Web-Server'
}