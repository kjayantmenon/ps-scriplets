
Select-AzureRmProfile -Path [path to the azure profile json file]

Select-AzureRmSubscription -SubscriptionId [Azure subscription id]
Get-AzureRmResourceGroup

$rgName="[resource group name]"
$Tab = [char]9
$resources = Get-AzureRmResource

$line="Resource Name".PadRight(40,' ') +$Tab+$Tab+ "|" +$Tab+$Tab+ "Resource Type"
Write-Host $line
$line="_".PadRight(100,'_')
Write-Host $line
foreach($resource in $resources)
{
    if($resource.ResourceGroupName –eq $rgName){
        $resoureName=$resource.Name.PadRight(40,' ')
        
        $line=$resoureName +$Tab+$Tab+ "|" +$Tab+$Tab+ $resource.ResourceType
        Write-Host $line
    }
}
