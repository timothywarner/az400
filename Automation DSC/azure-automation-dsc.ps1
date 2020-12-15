# Sign in and set your subscription/AAD tenant
Connect-AzAccount -Tenant 'db1766ec-5540-4cde-ad8d-b2b59fb2ed8e' -Subscription '2fbf906e-1101-4bc0-b64f-adc44e462fff'

# Apply LCM metaconfiguration to machine(s) we want to onboard
Set-DscLocalConfigurationManager -Path E:\az400 -ComputerName 'vm1-test'

# Onboard the machine
Register-AzAutomationDscNode  `
   -AutomationAccountName "oreilly-auto-prod" `
   -AzureVMName "vm1-prod" `
   -ResourceGroupName "DSC" `
   -NodeConfigurationName "config.webserver"

$PSVersionTable