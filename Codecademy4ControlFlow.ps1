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


# ----------

Loops - foreach

Arrays hold multiple data points, and loops are a great way to iterate over the data with repetitive actions. 
Just like the foreach method of arrays, the foreach loop is a way to loop through arrays to access and process 
each array element.

$array = 51,12,31,4,15
foreach ($element in $array) {
  if ($element % 2 -eq 0) {
    Write-Host $element "is" Even
  } else {
    Write-Host $element "is" Odd
  }
}

The foreach keyword is used in the above example, followed by parentheses.
Inside the parentheses, the expression $element in $array tells the loop to iterate through each element of 
$array and set the value of $element to the values in the array. The code output is:

51 is Odd
12 is Even
31 is Odd
4 is Even
15 is Odd

As shown above, in the first loop iteration, $element is assigned the first element in the array, 51.
In each iteration to follow, $element is updated with the next $array value.


# ----------

Loops - while

while loops run their body of code while a defined condition is true. This is similar to for loops, 
but more control is put in our hands regarding what variable is used in the condition and how the variable is 
updated in the loop.

$counter = 0
while ($counter -lt 3) {
  $counter++
  Write-Host "Be sure to update counter"
}

The while loop above uses the condition $counter -lt 3. If $counter is less than 3, 
the loop will keep iterating and outputting the string. 
Our job is to include the line $counter++ inside the while body to update $counter and eventually stop the loop. 
Also, note that we are using a variable defined outside the loop, which is not usually the case with for loops.

Beware of infinite loops! If the line $counter++ is omitted from the loop body, 
the expression $counter -lt 3 will always be true, and the loop will never terminate or iterate infinitely.


# ----------

Loops - do..while, do..until

When you want the behavior of a while loop and would like 1 iteration to happen before any condition is checked,
the do…while and do…until loops are a good choice.

$answer = 4
do {
  $input = Read-Host "Guess my number"
} while ($input -ne $answer)
Write-Host "Correct!"

The above example starts the loop with the keyword do and the loop body will execute once.
After one iteration, the condition $input -ne $answer defined after the keyword while will be checked.
If the condition is true, the loop will continue.

The do…while allows Read-Host to execute and set the value of $input, which is then checked after the first loop.
The output of the above example could look like this:

Guess my number: 5
Guess my number: 3
Guess my number: 4
Correct!

do…until is the same as do…while except when the condition is true, the loop will exit.
The above example with a do…until will use the -eq operator in the condition.

$answer = 4
do {
  $input = Read-Host "Guess my number"
} until ($input -eq $answer)
Write-Host "Correct!"

Remember that these loops are helpful when you want at least one loop iteration to happen,
regardless of your code state. 


# ----------

Loops - break, continue

Sometimes we want to exit the loop early or skip an iteration. This is what the break and continue commands are for.

break will exit the loop it is executed in:

for ($i = 0; $i -lt 5; $i++) {
  if ($i -eq 2) {
    break
  }
  Write-Host $i
}

The above for loop is defined to loop 5 times: $i starts at 0, and each loop will fire from $i equals 0 through 4. 
Inside the loop body is an if statement that checks if $i is 2, and if so, break. 
The following output shows that the loop exits once $i equals 2.

0
1

continue will skip a loop iteration:

for ($i = 0; $i -lt 5; $i++) {
  if ($i -eq 2) {
    continue
  }
  Write-Host $i
}

Using the first example but replacing break with continue causes the loop to finish through the condition,
$i -lt 5, but skip the iteration when $i equals 2. The output shows this:

0
1
3
4

As we can see, the for loop finishes its iterations but does not output 2.

break and continue are helpful when there are exceptional cases that need to be considered when looping. 
Your loop condition may cover some or most situations for your code execution, 
but break and continue can add extra behavior if necessary.
