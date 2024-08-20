$directoryPath = "./img"
$files = Get-ChildItem -Path $directoryPath -Recurse -File

foreach ($file in $files) {
    $hash = Get-FileHash -Path $file.FullName -Algorithm SHA256 | Select-Object -ExpandProperty Hash
    $extension = $file.Extension
    $newFileName = "$hash$extension"
    $newFilePath = Join-Path -Path $file.DirectoryName -ChildPath $newFileName
    Rename-Item -Path $file.FullName -NewName $newFilePath
    Write-Host "Renamed '$($file.FullName)' to '$newFilePath'"
}
