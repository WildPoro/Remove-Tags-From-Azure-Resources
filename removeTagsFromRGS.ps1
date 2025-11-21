Connect-AzAccount
Set-AzContext -SubscriptionId "xxxxxxxxxxxxxxxxxxxxxxxxxx"

$rg = "test"
$resources = Get-AzResource -ResourceGroupName $rg
foreach ($resource in $resources){
    Set-AzResource -ResourceId $resource.ResourceId -Tag @{} -Force
}
Disconnect-AzAccount
