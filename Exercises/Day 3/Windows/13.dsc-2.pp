#Setting Registry Values
dsc_registry {'registry_test':
  dsc_ensure    => 'Present'
  dsc_key       => 'HKEY_LOCAL_MACHINE\SOFTWARE\ExampleKey'
  dsc_valuename => 'TestValue'
  dsc_valuedata => 'TestData'
}