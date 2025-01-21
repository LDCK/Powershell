# ----------
Objects
# ----------
# An object is a combination of Variables and Functions. Each object has the following:
	# • Properties: variables that describe the object (characteristics)
	# • Methods: functions that describe how to use the object (actions)
# Each object is an instance of a blueprint called a type, or class

# Example 
  # Assume you have an object based on an animal called $dog. 
  # You can describe $dog using properties such as name, breed, age, etc.
  # All the actions a dog can perform are methods such as speak(), eat(), play(), etc.

# All information associated with an object is called a member. you can discover the members of an object with the Get-Member cmdlet 
# It also shows the type of an object. In the following example, the object is a string:

Get-Member -InputObject "Codecademy"
# A more common way to use Get-Member is by piping an object to Get-Member like so:
"Codecademy" | Get-Member

# Both approaches produce the same result.

# To discover just the properties of an object, you can add -MemberType Property to the Get-Member cmdlet. Examples:
# Show all properties and methods of the variable $name
$name | Get-Member
# Show only the properties of the variable $name.
$name | Get-Member -MemberType Property
# Use the Length property to get the length of the $name variable.
$name.Length


# ----------
Object Methods
# ----------

# Methods are another piece of what makes up an object. Methods are the actions you can take on an object,
# just like how a circle can grow or shrink, or a car can accelerate or brake.
# When you use Get-Member on a string-type object, you can see several methods available.

Object Method: Contains()
# The Contains() method of a string-type object returns a boolean whether or not a string contains the specified substring.
$my_string = "Codecademy"
$my_string.Contains("Code")
True

Object Method: Replace()
# The Replace() method of a string-type object replaces the specified substring on a string with another specified substring.
# It can also be used to delete a substring by replacing it with an empty string.
$my_string = "Hello, World!"
$my_string.Replace("World", "Codecademy")
Hello, Codecademy!
$my_string.Replace(", World", "")
Hello!

Object Method: GetType()
# The GetType() method gets the type of an object, and therefore it is not exclusive to just string-type.
# It returns an object with several methods and properties, including the name of the type.
# If you want to get the name of the type, you can access the Name property. To print the type of an object, you used GetType().Name.
$num = 4
$num.GetType().Name
Int

# Run Get-Member -MemberType Method on all types of objects and learn about their methods with various useful functionalities.


# ----------
Creating Objects
# ----------

# To create an object, you use the New-Object cmdlet like so:
$dog = New-Object -TypeName PSCustomObject
-TypeName PSCustomObject means the object has the type of PSCustomObject, a class used for creating custom objects

# By default, the new dog custom object has no properties and four methods.

Adding Properties
# With the object created, you can now use the Add-Member cmdlet to add methods and properties.
# You must specify the type of member you wish to add.

# In the case of a property with key-value pair, you use a NoteProperty. Consider the example below.
$dog | Add-Member -MemberType NoteProperty -Name "Name" -Value "Rufus"
$dog | Add-Member -MemberType NoteProperty -Name "Age" -Value 10
# Our custom dog object now has two properties:
    Name with the string value of "Rufus"
    Age with the integer value of 10

Adding Methods
# The syntax for adding a method is very similar to that of properties.
# Hoyouver, for the MemberType parameter, you use ScriptMethod.

$dog | Add-Member -MemberType ScriptMethod -Name "speak" -Value { Write-Host "Woof!"}

Now you can use the newly created method:

$dog.speak()
# outputs: Woof!
# Just like a property, you name the method "speak" using -Name.
# For -Value you enclose a line of code, which outputs the string Woof!.

Example
$person = New-Object -TypeName PSCustomObject
$person | Add-Member -MemberType NoteProperty -Name "FirstName" -Value "Lee"
$person | Add-Member -MemberType ScriptMethod -Name "greeting" -Value {Write-Host "Hello, World!"}
$person.greeting()
1. Create a custom object named $person using the New-Object cmdlet.
2. Use Add-Member cmdlet to add a property to the $person object called FirstName with my name
3. Add a method to the $person object. Name the method "greeting" and have the enclosed line of code output a greeting string using Write-Host
4. Call the newly-added .greeting() method of the $person object.


# ----------
Creating Objects Using Hashtables
# ----------

A newer method of creating a custom object and easily adding properties to it is by using a hashtable.
A hashtable holds multiple key-value pairs enclosed in @{ }. 
We can use these pairs to define properties for our custom object. Consider the following syntax:

$dog = [PSCustomObject]@{
    Name = "Rufus"
    Age = 10
}

The [PSCustomObject] casts a type onto the hashtable, just as we constrain variables.
Creating a custom object this way is identical to the previous object creation process.
It is a little less work and supports more readable code.
