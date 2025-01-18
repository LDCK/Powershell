----------
Basics
----------
# Print to terminal 
Write-Host "Hello, World!"

# FInd a PS command
Get-Command 
# Find a Verb
Get-Command -Verb Get
# Find a Noun
Get-Command -Noun Host

# View recently used cmdlets
Get-History

# Simple script named "HelloWorld.ps1" to display to Hello, World!" message
Write-Host "Hello, World!"
# Run script from Powershell
.\HelloWorld.ps1
