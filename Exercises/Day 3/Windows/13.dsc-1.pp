#Installing Packages with DSC
dsc_package{'installpython'
  dsc_ensure    => 'Present',
  dsc_name      => 'Python 2.7.2',
  dsc_productid => '2E295B5B-1AD4-4D36-97C2-A316084722CF'
  dsc_path      => 'C:\Users\atingupta2005\Downloads\python-2.7.2.msi',
}