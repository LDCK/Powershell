# ----------
Functions
# ----------
Functions in Powershell are groups of code collected in a single location that can be referenced anywhere in your code.
Functions are a way to collect code in a single space and reference them with a simple command throughout your script.
This makes code easier to read.

The components of a function in PowerShell are:
    - the keyword Function
    - a descriptive function name
    - a code body inside brackets

function greet {
  Write-Host "Hello, there!"
}

The above function is named greet and contains one line of code that outputs a hello message.
Within our code, we can now “call” the function by its name, greet.


# ----------
Using Parameters
# ----------
Giving our functions some data to perform the correct task is often helpful. To send data with our function call, we use parameters.
Let’s say when you greet someone, you would like to use their name:

function greet1 {
  param($name)
  Write-Host "Hello, $name"
}
