$directoryPath = "./img"
$files = Get-ChildItem -Path $directoryPath -Recurse -File

foreach ($file in $files) {
    $md5 = Get-FileHash -Path $file.FullName -Algorithm MD5 | Select-Object -ExpandProperty Hash
    $extension = $file.Extension
    $newFileName = "$md5$extension"
    $newFilePath = Join-Path -Path $file.DirectoryName -ChildPath $newFileName
    Rename-Item -Path $file.FullName -NewName $newFilePath
    Write-Host "Renamed '$($file.FullName)' to '$newFilePath'"
}
