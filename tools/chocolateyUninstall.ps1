$processor = Get-WmiObject Win32_Processor
$is64bit = $processor.AddressWidth -eq 64
 
$packageName = 'deskpins'
$fileType = 'exe'
$silentArgs = '/S'
  
if ($is64bit) {
  $uninstallString = (Get-ItemProperty HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\DeskPins).UninstallString 
} else {
  $uninstallString = (Get-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\DeskPins).UninstallString
}
 
if ($uninstallString -ne "") {
	Stop-Process -Name deskpins
	Uninstall-ChocolateyPackage $packageName $fileType $silentArgs $uninstallString
}
