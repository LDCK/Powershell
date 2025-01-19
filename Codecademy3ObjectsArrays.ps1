# ----------
Objects
# ----------

PowerShell is an object-oriented scripting language, meaning that much of the data in PowerShell is in the form of an object.

In addition to objects, we will introduce a new type of data structure called an array.
We will discover how to create, update, and access items from an array and go over the operators we can use to manipulate arrays.

Many shells, such as the Linux Bash shell, have limited capabilities since they focus on strings as output. 
Plaintext output forces us to use other commands for additional functionality, such as formatting and filtering. 

On the other hand, PowerShell is an object-oriented shell. Since almost everything in PowerShell is an object, 
including the output of commands, further data processing is much easier.

An object is a combination of Variables and Functions. Each object has the following:
	• Properties: variables that describe the object (characteristics)
	• Methods: functions that describe how to use the object (actions)
Each object is an instance of a blueprint called a type, or class

  Let us describe these terms using a real-world example. 
  Assume we have an object based on an animal called $dog. 
  We can describe $dog using properties such as name, breed, age, etc.
  All the actions a dog can perform are methods such as speak(), eat(), play(), etc.

All information associated with an object is called a member. We can discover the members of an object with the Get-Member cmdlet. 
It also shows the type of an object. In the following example, the object is a string:

Get-Member -InputObject "Codecademy"

A more common way to use Get-Member is by piping an object to Get-Member like so:

"Codecademy" | Get-Member

Both approaches produce the same result.


