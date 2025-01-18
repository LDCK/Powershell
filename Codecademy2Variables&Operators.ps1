# ----------
# Variables & Operators
# ----------
Variables are created with the $ symbol. Common variable types:
  Int: integers like 2, -5, 99
  String: zero or more characters enclosed in double quotes like "Codecademy!", "3X4mP|3"
  Boolean: two possible values: $True and $False
  Array: a collection of items like 25, "red", $False, 16.30
# ----------
Integers & Strings
# Prompt for the user input to enter their name and store it as $name
$name = Read-Host -Prompt "What is your name?"
# Prompt for the user input to enter their age and store it as $age
$age = Read-Host -Prompt "Enter your age"
# Write both $name & $age to the host
Write-Host "Hello, $name! You are $age years old."

# ----------
Variable Types
# ----------
# PowerShell dynamically assigns a type to a variable depending on the value assigned to it. .GetType().Name can be appended 
# to a variable reference to get that variable’s data type.
This is beneficial for:
	• Conditional handling based on type.
	• Debugging and verifying assumptions about data types.
	• Validating input data or parameters.

PS > $my_string_variable.GetType().Name
PS > String

# ----------
Constrained Variables
# ----------
# A constrained variable is when a certain type can be enforced onto a variable via casting. 
# To create a constrained variable, specify the type in brackets before the variable reference.
Constrained variables are used when you want a certain type of answer, a number, text, true/false
Useful when 

PS > [Int]$age = 25
PS > $age
25
PS > [Int]$age = "twenty five" # Results in an error
Cannot convert value "age" to type "System.Int32". Error: "Input string was not in a correct format."

Creating Multiple Variables
# Multiple variables can be created with one statement using either the same value for all variables or multiple values.
# Same value
$i = $j = $k = 0
# Multiple values
$number, $color, $bool = 25, "red", $false

# ----------
Environment Variables
# ----------
# Environment Variables store information related to the current environment,
# like the Operating System and user sessions, and like your current terminal.
# They are global Variables, meaning we can access them across commands and programs.
# The operating system usually creates them, but we can also use them to configure our production environment. 

Get-ChildItem Env:

