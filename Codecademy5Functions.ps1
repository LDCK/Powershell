# ----------
Functions
# ----------
Functions in Powershell are groups of code collected in a single location that can be referenced anywhere in your code.
Functions are a way to collect code in a single space and reference them with a simple command throughout your script.

Parameters allow us to change the behaviors of our functions.
This supports their purpose of being able to reuse code in multiple places that may each night need slightly different behavior.
Default parameters are a great way to define a usual behavior for a function but still get the needed flexibility.


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

Within the above function greet1, I've added the line param($name).
This allows the function to receive data from my function call and place it in the variable $name.

    greet1 "Codecademy"
    # outputs "Hello, Codecademy"

By adding a string to our function call, we now pass "Codecademy" to the variable $name in the greet1 function.
We can also pass multiple variables by separating parameters by commas in the function:

    function greet2 {
      param($timeOfDay, $name)
      Write-Host "Good $timeOfDay, $name"
    }

The function greet2 is now crafting its greeting using 2 variables, $timeOfDay and $name.
To call this function, separate the data by spaces after the function call:

    greet2 "Evening" "Codecademy"
    # outputs "Good Evening, Codecademy"

Parameters allow us to change the behaviors of our functions.
This supports their purpose of being able to reuse code in multiple places that may each night need slightly different behavior.


# ----------
Default Parameters
# ----------
You may constantly use the same parameter values for most function calls. But you also want to maintain the flexibility of parameters.
To streamline your code, you can set up default parameters.

Default parameters give a value to a function parameter when it's declared.
The default value is used if no value is passed to that parameter.

    function greet2 {
      param($name, $timeOfDay = "morning")
      Write-Host "Good $timeOfDay, $name"
    }

In the above example, the function greet2 takes $name and $timeOfDay parameters.
The $timeOfDay parameter now has a default value "morning". We can now call the function with just a name:

    greet2 "Codecademy"
    # Output: "Good morning, Codecademy"

In the above example, the output will default to "Good morning, Codecademy" since only the $name parameter
received a value from the function call.

It is important to note that the default parameter, $timeOfDay is the 2nd parameter. The parameter values are placed in the parameter
variables in the order used in the function call. If $timeOfDay was the first parameter and we called the function:

    greet2 "Codecademy"
    # Output: `"Good Codecademy, "`

This output is because “Codecademy” would replace the default value "morning" in $timeOfDay and $name would not get any value since 
only one value was passed with the function call. Default parameters must be used after non-default parameters.

Default parameters are a great way to define a usual behavior for a function but still get the needed flexibility.
