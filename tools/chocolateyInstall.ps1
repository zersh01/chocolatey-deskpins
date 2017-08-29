$packageName = 'deskpins'
$installerType = 'exe'
$url = 'https://bitbucket.org/efotinis/deskpins/downloads/DeskPins-1.32-setup.exe'
$silentArgs = '/S'

$checksum = '5A669C5723F8E1E6ADC328B3869A8955'

$checksumType = 'md5'
 
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url"  -Checksum "$checksum" -ChecksumType "$checksumType"







