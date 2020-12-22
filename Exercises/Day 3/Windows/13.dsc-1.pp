#Installing Packages with DSC
dsc_package{'installpython'
  dsc_ensure    => 'Present',
  dsc_name      => 'Python 2.7.10',
  dsc_productid => 'E2B51919-207A-43EB-AE78-733F9C6797C2'
  dsc_path      => 'C:\\python.msi',
}