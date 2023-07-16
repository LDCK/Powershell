# Import the Azure Powershell module.
Import-Module -Name Az

# Connect to an Azure account.
Connect-AzAccount

# Define Azure variables for a virtual machine.
$vmName = "wingtiptoysVM"
$resourceGroup = "WingtiptoysRG"

# Create Azure Credentials.
$adminCredential = Get-Credential -Message "Enter a username and password for the VM admin account"

# Create a virtual machine in Azure.
New-AzVm -ResourceGroupName $resourceGroup -Name $vmName -Credential $adminCredential -Image UbuntuLTS