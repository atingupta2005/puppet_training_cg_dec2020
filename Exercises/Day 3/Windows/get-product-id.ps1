function Get-MsiDatabaseInfo{
  param ([IO.FileInfo]$FilePath)

  $productName = Invoke-MSIQuery -FilePath $filePath.FullName -Query "SELECT Value FROM Property WHERE Property = 'ProductName'"
  $productCode = Invoke-MSIQuery -FilePath $filePath.FullName -Query "SELECT Value FROM Property WHERE Property = 'ProductCode'"

  return [PSCustomObject]@{
    FullName    = $FilePath.FullName
    ProductName = ([string]$productName).TrimStart()
    ProductCode = ([string]$productCode).Replace("{","").Replace("}","").TrimStart()
  }
}

function Invoke-MSIQuery{
  param($FilePath, $Query)
  try{
    $windowsInstaller = New-Object -com WindowsInstaller.Installer
    $database = $windowsInstaller.GetType().InvokeMember("OpenDatabase", "InvokeMethod", $Null, $windowsInstaller, @($FilePath, 0))
  }catch{
    throw "Failed to open MSI file. The error was: {0}." -f $_
  }

  try{
    $View = $database.GetType().InvokeMember("OpenView", "InvokeMethod", $Null, $database, ($query))
    $View.GetType().InvokeMember("Execute", "InvokeMethod", $Null, $View, $Null)

    $record = $View.GetType().InvokeMember("Fetch", "InvokeMethod", $Null, $View, $Null)
    $property = $record.GetType().InvokeMember("StringData", "GetProperty", $Null, $record, 1)

    $View.GetType().InvokeMember("Close", "InvokeMethod", $Null, $View, $Null)

    return $property
  }catch{
    throw "Failed to read MSI file. The error was: {0}." -f $_
  }
}

Get-MsiDatabaseInfo -FilePath "C:\\Users\\User\\Downloads\\python-2.7.2.msi"
