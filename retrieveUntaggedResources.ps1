Connect-AzAccount
Set-AzContext -SubscriptionId "bd81c2b1-95ae-4edf-ba2d-839a4eb82c00"

$resources = Get-AzResource
$Output = foreach ($resource in $resources) {
    if ($null -eq $resource.Tags -or $resource.Tags.Count -eq 0) {
        [PSCustomObject]@{
            ResourceName      = $resource.Name
            ResourceGroupName = $resource.ResourceGroupName
            ResourceType      = $resource.ResourceType
        }
    }
}
$Output | Where-Object { $_ } | Export-Csv -Path "UntaggedResources.csv"
Disconnect-AzAccount
