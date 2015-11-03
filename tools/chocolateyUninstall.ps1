$packageName = 'deskpins'
$fileType = 'exe'
$silentArgs = '/S'
  
$osBitness = Get-ProcessorBits
if ($osBitness -eq 64) {
  $uninstallString = (Get-ItemProperty HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\DeskPins).UninstallString 
} else {
  $uninstallString = (Get-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\DeskPins).UninstallString
}
 
if ($uninstallString -ne "") {
  Stop-Process -Name deskpins
  Uninstall-ChocolateyPackage $packageName $fileType $silentArgs $uninstallString
}
