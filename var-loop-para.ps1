# Variables
# Use $ to declare a variable and = to assign a value. For example:
	$loc= "East US"
 	$iterations= 3
# Variables can hold objects. For example, the following definition sets the adminCredential variable to the object returned by the Get-Credential cmdlet.
	$adminCredential= Get-Credential
#To obtain the value stored in a variable, use the $ prefix and its name, as in the following:
	$loc= "East US
 	"New-AzResourceGroup -Name"MyResourceGroup" -Location$loc

# Loops
# PowerShell has several loop structures, including For, Do...While, and For...Each. The For loop is the best match for our needs because we'll execute a cmdlet a fixed number of times.
# The following example shows the core syntax. The example runs for two iterations and prints the value of i each time. The comparison operators are written -lt for "less than", -le for "less than or equal", -eq for "equal", -ne for "not equal", etc.
	For($i= 1; $i -lt3; $i++)
	{
    		$i
     	}

# Parameters
# When you execute a script, you can pass arguments on the command line. You can provide names for each parameter to help the script extract the values. For example:
	.\setupEnvironment.ps1 -size5 -location"East US"
	
# Inside the script, you'll capture the values into variables. In this example, the parameters are matched by name:
	param([string]$location, [int]$size)
# You can omit the names from the command line. For example:
	.\setupEnvironment.ps1 5"East US"
# Inside the script, you'll rely on position for matching when the parameters are unnamed:
	param([int]$size, [string]$location)
