#About::To remove tables from a storage account

Write-Host "Delete Start!"
$StorageAccountName = "[storage account name]"
$StorageAccountKey = "[account key]"

#$Ctx = New-AzureStorageContext –StorageAccountName $StorageAccountName -StorageAccountKey $StorageAccountKey

$ctx = New-AzureStorageContext -StorageAccountName $StorageAccountName -StorageAccountKey $StorageAccountKey
$tables =Get-AzureStorageTable -Context $ctx

foreach($table in $tables)
{
    $tabName = $table.Name
    Remove-AzureStorageTable –Name $tabName –Context $Ctx -Force
    Write-Host "Deleted table "+$tabName
    #$tclient.DeleteTable($table)
}
