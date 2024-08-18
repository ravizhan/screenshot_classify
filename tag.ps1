# 定义要遍历的目录路径
$directoryPath = "./screenshot"

# 检查目录是否存在
if (-Not (Test-Path -Path $directoryPath)) {
    Write-Host "目录不存在： $directoryPath"
    exit
}

# 定义要保存的CSV文件路径
$outputCsvPath = "./screenshot.csv"

# 定义要保存到CSV文件中的列名
$csvHeaders = "filename,screenshot,cameracap,others"

# 创建并写入CSV文件头部
Out-File -FilePath $outputCsvPath -InputObject $csvHeaders -Encoding UTF8

# 获取目录中的所有图片文件（假设图片文件扩展名为jpg、png、jpeg等）
$imageFiles = Get-ChildItem -Path $directoryPath

# 检查是否找到了图片文件
if ($imageFiles.Count -eq 0) {
    Write-Host "目录中没有找到图片文件： $directoryPath"
    exit
}

# 遍历每一个图片文件
foreach ($imageFile in $imageFiles) {
    # 获取文件名
    $fileName = $imageFile.Name

    # 假设head和helmet的值是固定的，可以根据需要修改
    $headValue = 1
    $helmetValue = 0
    $othervalue = 0

    # 创建CSV格式的行
    $csvLine = "$fileName,$headValue,$helmetValue,$othervalue"

    # 将行追加到CSV文件
    Add-Content -Path $outputCsvPath -Value $csvLine
}

Write-Host "CSV文件已成功生成：" $outputCsvPath