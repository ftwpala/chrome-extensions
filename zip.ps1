[CmdletBinding(SupportsShouldProcess = $true)]
Param(
  [Parameter(Position=0, ValueFromRemainingArguments=$true)] $Extensions = @())

Push-Location (Split-Path (Resolve-Path $MyInvocation.MyCommand.Path))

foreach ($extension in $Extensions) {
  $extension = Split-Path -Leaf $extension
  $extension_zip = "C:\Users\Guillaume\Google Drive\Perso\Chrome extensions\${extension}.zip"
  echo "$extension ..."
  rm $extension_zip
  zip.exe -jo9 $extension_zip "$extension/*"
}

Pop-Location
pause