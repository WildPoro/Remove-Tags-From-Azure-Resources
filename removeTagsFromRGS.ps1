Connect-AzAccount
Set-AzContext -SubscriptionId "bd81c2b1-95ae-4edf-ba2d-839a4eb82c00"

$rg = "test"
$resources = Get-AzResource -ResourceGroupName $rg
foreach ($resource in $resources){
    Set-AzResource -ResourceId $resource.ResourceId -Tag @{} -Force
}
Disconnect-AzAccount