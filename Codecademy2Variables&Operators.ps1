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
Environment Variables store information related to the current environment,
like the Operating System and user sessions, and like your current terminal.
They are global Variables, meaning you can access them across commands and programs.
The operating system usually creates them, but you can also use them to configure your production environment. 

# Print all environment variables for the OS
Get-ChildItem Env:
# Print a specific environment variable
(Get-ChildItem Env:**NAME**).Value

# Create an Environment Variable. Environment variable names are usually in CAPS
$Env:**NAME** = "VALUE"

#Write a new Environment variable
$Env:**NAME** = "VALUE"


# ----------
Arithmetic Operators
# ----------
Operators are used to perform specific operations on data, often stored in a variable. 
PowerShell offers multiple types of operators to manipulate data, including:

• Arithmetic Operators
• Assignment Operators
• Unary Operators
• Comparison Operators
• Logical Operators

# ----------
Arithmetic Operators
# ----------
First, let’s discuss arithmetic operators used to calculate numeric values. Arithmetic operators include:
    + (Addition): adds numbers and concatenates strings. Eg. 5 + 2
    - (Subtraction): subtracts or negates numbers. Eg. 49 - 7
    * (Multiplication): multiplies numbers or copies strings a specified number of times. Eg. "hello" * 3
    / (Division): divides numbers. Eg. 64.209 / 3
    % (Modulus): returns the remainder of a division operation. Eg. 39 % 4

# ----------
Assignment Operators
# ----------
You can use assignment operators to assign, change, or append values to Variables.
The general syntax of the assignment operators is as follows: <Variable> <Assignment-Operator> <Value>.

You are already familiar with one of the assignment operators, =. It is used to assign a value to a variable. 
Other assignment operators include +=, -=, *=, /=, and %=. These operators are called compound assignment operators. 
Example:
$number = 75
$number_1 = $number / 3
$number_1
25
$number_2 = $number
$number_2 /= 3
$number_2
25

You can use the /= compound assignment operator as shorthand for dividing a variable and saving the result to the same variable. 
As shown above, the statements $number_1 = $number / 3 and $number_2 /= 3 behave similarly.

# ----------
Assignment Operators on Environment Variables
# ----------
Recall that environment variables are of type String and that the + arithmetic operator can concatenate strings. 
We can append the += compound assignment operator to an existing environment variable.

$Env:EXAMPLE_ENV_VAR = "custom value"
$Env:EXAMPLE_ENV_VAR += "; another value"
$Env:EXAMPLE_ENV_VAR 
# custom value; another value

Note: Environment variables that have multiple values are separated by a semicolon ; on Windows. 
For example, the PATH environment variable specifies the directories in which executable programs are located. 
Utilizing ; with the += assignment operator, we can add new directories to PATH.

# ----------
Unary Operators
# ----------
Unary operators operate on a single variable operand. ++ and -- are the increment and decrement operators and 
increase or decrease the value of a variable by 1, respectively.
Unary operators are an easily readable way to increase or decrease a variable value by 1.
Example:
$i = 0
$i++
$i
1

$i--
$i
0


# ----------
Comparison Operators
# ----------
Comparison Operators are used to compare values, test conditions, or filter elements of a collection, such as an array. 
They return a Boolean value, True or False, as a result.

Some of the comparison operators in PowerShell are called equality operators.
They are binary operators that compare two integer or string values that return True if the operator condition is met;
otherwise, False.
Operator 	Description
-eq 	Checks if the two operand values are an exact match
$my_num = 5
$my_num -eq 5	True
-ne 	Checks if the two operand values are NOT an exact match
$my_num -ne 5			False   
OR   
"tomato" -ne "vegetable"	True
-gt 	Checks if the value of the left operand is greater than the value of the right operand
7 -gt 2		True   
-lt 	Checks if the value of the left operand is less than the value of the right operand
7 -gt 2		True
-ge 	Checks if the value of the left operand is greater OR equal to the value of the right operand
3 -ge 6		False
-le 	Checks if the value of the left operand is less OR equal to the value of the right operand
42 -le 42	True


# ----------
Logical Operators
# ----------
Logical operators allow you to combine multiple True/False expressions and statements into complex conditionals.
Using the operators -and, -or, -xor, -not, !, we can test multiple conditions with the equality comparison operators 
we discussed in the previous exercise.

Truth Table
A simple way to show the output of logical operators is through a truth table.
x 	y 	x -and y 	x -or y 	x -xor y 	-not x
T 	T 	T 		T 		F 		F
T 	F 	F 		T 		T 		F
F 	T 	F 		T 		T 		T
F 	F 	F 		F 		F 		T
Imagine x and y are Variables are a way to store and manipulate data that hold the boolean values.
The rest of the columns show the output of the corresponding logical operator given the values for x and y for that row.

-and
The and logical operator is a binary operator that returns True if both statements are True.
-5 -lt 7 -and "hello" -eq "hello"		True
-5 -lt 7 -and "hello" -eq "world"		False

-or
The binary or logical operator returns True if either statement returns True.
42 -le 13 -or 5 -ge 5		True
42 -le 13 -or 5 -gt 5		False

-xor
This binary operator returns True when only ONE statement is True.
25 -gt 2 -xor "hello" -eq "world"	True
25 -gt 2 -xor "code" -eq "code"		False

-not and !
Both the -not and ! operators negate the statement that follows. They are unary operators.
-not (2 -gt 5)		True
!(17 -le 99)		False

Example code:
[String]$name = Read-Host -Prompt "Type your name"
[Int]$number_1 = Read-Host -Prompt "Type the first number"
[Int]$number_2 = Read-Host -Prompt "Type the second number"

$both_are_less_than_50 = $number_1 -lt 50 -and $number_2 -lt 50
$one_is_higher_than_100 = $number_1 -gt 100 -or $number_2 -gt 100
$only_one_is_less_than_10 = $number_1 -le 10 -xor $number_2 -le 10
$name_is_not_ldck = -not ($name -eq "ldck")

Write-Host "`nHello, $name! Let's evaluate your inputs as True or False."
Write-Host "Both numbers are less than 50: $both_are_less_than_50"
Write-Host "One number is higher than 100: $one_is_higher_than_100"
Write-Host "Only one number is less than or equal to 10: $only_one_is_less_than_10"
Write-Host "Your name is not 'ldck': $name_is_not_ldck"

# ----------
Operator Precedence
# ----------
Operator precedence in PowerShell is as follows:
	( )
	++ --
	! -not
	* / %
	+ -
	-is -isnot -as
	-eq -ne -gt -ge -lt -le
	-contains -notContains
	-and -or -xor
	= += -= *= /= %=

Precedence order is the order in which PowerShell evaluates the operators if multiple operators are used in the same expression.
Parentheses ( ) take the highest priority, and the assignment operators have the least priority.
Operators on the same level are evaluated from left to right.

Example code:
$expression_1 = 5 % (2 + 4 * 2) - 1
$expression_2 = (5 * 4) % (3 * (2 + 1))
$expression_3 = 3 + (2 -ne 5) -and (2 * 5 -gt 8)
