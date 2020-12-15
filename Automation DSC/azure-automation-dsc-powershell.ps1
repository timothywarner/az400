# Enable a VM for Azure Automation DSC
Register-AzAutomationDscNode -AutomationAccountName "Contoso17" -AzureVMName "VirtualMachine01" -ResourceGroupName "ResourceGroup01"-NodeConfigurationName "ContosoConfiguration.webserver"

# Configure LCM on Windows remotely
Set-DscLocalConfigurationManager -Path C:\Users\joe\Desktop\DscMetaConfigs -ComputerName MyServer1, MyServer2

# Configure LCM on Linux VMs remotely
$SecurePass = ConvertTo-SecureString -String '<root password>' -AsPlainText -Force
$Cred = New-Object System.Management.Automation.PSCredential 'root', $SecurePass
$Opt = New-CimSessionOption -UseSsl -SkipCACheck -SkipCNCheck -SkipRevocationCheck

# need a CimSession for each Linux machine to onboard
$Session = New-CimSession -Credential $Cred -ComputerName <your Linux machine> -Port 5986 -Authentication basic -SessionOption $Opt

Set-DscLocalConfigurationManager -CimSession $Session -Path C:\Users\joe\Desktop\DscMetaConfigs

#
