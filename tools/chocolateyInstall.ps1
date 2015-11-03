$packageName = 'deskpins'
$installerType = 'exe'
$url = 'http://files.snapfiles.com/directdl/DeskPins130.zip'
$silentArgs = '/S'
$validExitCodes = @(0)

$chocTempDir = Join-Path $env:TEMP "chocolatey"
$tempDir = Join-Path $chocTempDir "$packageName"
$tempDir = Join-Path $tempDir "unzip"
if (![System.IO.Directory]::Exists($tempDir)) {[System.IO.Directory]::CreateDirectory($tempDir)}

Install-ChocolateyZipPackage "$packageName" "$url" "$tempDir"
$exeFilePath = get-childitem $tempDir -recurse -include *.$installerType | select -First 1
Install-ChocolateyInstallPackage "$packageName" "$installerType" "$silentArgs" "$exeFilePath"

Remove-Item "$tempDir" -Recurse
