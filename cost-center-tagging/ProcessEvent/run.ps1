param($eventGridEvent, $TriggerMetadata)

$costCenterDevelopment = "0001"
$costCenterProduction = "0002"

$eventSubject = $eventGridEvent['subject']

if ($eventSubject.contains('resourceGroups')) {
  $rg = Get-AzResourceGroup -Id $eventSubject -ErrorAction SilentlyContinue

  if($rg -and $rg.Tags['Env']){
    switch($rg.Tags['Env']){
      "Development" {
        $rg.Tags.Add('CostCenter', $costCenterDevelopment)
        Set-AzResourceGroup -Name $rg.ResourceGroupName -Tag $rg.Tags
      }
      "Production" {
        $rg.Tags.Add('CostCenter', $costCenterProduction)
        Set-AzResourceGroup -Name $rg.ResourceGroupName -Tag $rg.Tags
      }
    }
  }
}

# Make sure to pass hashtables to Out-String so they're logged correctly
# $eventGridEvent | Out-String | Write-Host
