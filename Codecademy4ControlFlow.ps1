# ----------
Control Flow
# ----------
# You will want to achieve different outcomes based on the state of our data within a script.
# This behavior is known as control flow and uses conditional statements and loops that allow us to execute our code
# in a desired fashion.

# In this lesson, we’ll look at

    if, else, and elseif statements
    switch statements
    for and foreach loops
    while and do…while and do…until loops
    break and continue commands

# Using the correct form of control flow will help create scripts with different behaviors
# that are easy to understand and improve upon. 

# ----------

Conditional Statements - if

$myVar = 2
if ($myVar -eq 2) { 
  Write-Host "A True Statement"
}
Write-Host "After the if statement"

The above example will output A True Statement! since $myVar does equal 2.
The code will finish with the output, After the if statement.

if statements consist of two parts:

    The conditional statement inside the parentheses, $myVar -eq 2,
    The body inside the curly brackets is the code to run if the condition is true, A True Statement!

Alternatively, when $myVar is anything but 2, the code inside the if statement body will not run,
and only After the if statement will be output.

# ----------

Conditional Statements - else, elseif

An if statement tests for a condition and takes action if the condition is true,
but what if we want to do something if the condition is false? This is where else can be used:

$myVar = 2  
if($myVar -lt 0) {
  Write-Host "A negative number"
} else {
  Write-Host "A positive number"
}

The above example uses else after the initial if statement body.
Curly braces after the else defines another body that contains the code to be executed if the condition is false.

else captures all other scenarios not met by your if statement.
We can now define specific behaviors based on a true or false condition.

Depending on our situation, we may need to account for multiple conditions at a specific point in our code. 
This is where we could utilize the elseif conditional statement:

$myVar = 2  
if ($myVar -lt 0) {
  Write-Host "A negative number"
} elseif ($myVar -gt 0) {
  Write-Host "A positive number"
} else {
  Write-Host "Zero"
}

This example has two conditions to check. If the first condition, $myVar -lt 0, is false, 
the script moves on to the elseif with another condition in parentheses. 
If the second condition, $myVar -gt 0, is true, the code inside the body is run. 
The else body is executed if both conditions are false.

We can add as many elseif statements to an if statement as long as an else statement remains the final statement.

# ----------

Conditional Statements - switch

switch statements provide similar behavior as if/elseif statements,
but the syntax is more straightforward,making the logic easier to implement in your code:

$myVar = 5
switch ($myVar) {
 10 { 
   Write-Host "It is 10"
  }
  5 { 
    Write-Host "It is 5" 
  }
  default { 
    Write-Host "Some other number"
  }
}

This example starts with the switch keyword followed by a value to test, $myVar.
Inside the switch body test expressions, 10 and 5, are each compared to $myVar in order.
The body inside the curly brackets is executed if any values are equal.
Lastly, the default value acts as an else statement, where the code is executed if no given value is equal to $myVar.

Conditional expressions can be used within the switch body to create more complex testing:

$myVar = 5
switch ($myVar) {
  {$_ -gt 5} { 
    Write-Host "Greater than 5"
  }
  {$_ -lt 5} { 
    Write-Host "Less than 5" 
  }
  default { 
    Write-Host "It is 5"
  }
}

Each test expression is now enclosed in curly brackets, with $_ representing $myVar.
If the expression result is true, the enclosed code run.
In the example above, both written test expressions {$_ -gt 5} and {$_ -lt 5} are false,so the default code is run.

It is important to note that if one of the defined conditions, {$_ -gt 5},
is true, the following conditions are still checked.

$myVar = 10
switch ($myVar) {
  {$_ -gt 5} { 
    Write-Host "Greater than 5"
  }
  {$_ -gt 0} { 
    Write-Host "Greater than 0" 
  }
}

The above code will output the following:

Greater than 5
Greater than 0

This differs from if and elseif because all the conditions are still tested even if the first condition is true.
We will look at a command that allows us to break out of the switch statement once a condition is true.


# ----------

Loops - for

Loops define a body of code to be executed repeatedly until a stop condition is met.
Each execution of code is called an iteration.

The first loop we will cover is the for loop. There are three steps to creating a for loop:

    initializing a counter variable
    setting a stop condition using the counter variable
    changing the value of the counter variable

The body of a for loop contains the code that iterates over and over until the given condition is met:

for ($i = 0; $i -lt 3; $i++) {
  Write-Host "i is ($i)"
}

The example above starts with the for keyword with the following inside the parentheses:

    $i = 0 initializes the counter $i to 0.
    $i -lt 3 sets the condition for the loop to continue. As long as $i is less than 3, the code inside the loop body will continue to execute
    $i++ increments the counter, so the set condition will eventually evaluate to false.

The above loop will repeat three times before $i -lt 3 is no longer true, and the code will output:

$i is 0
$i is 1
$i is 2

Once $i equals 3, the code will no longer execute. 

