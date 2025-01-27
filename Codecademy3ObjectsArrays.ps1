# ----------
Objects
# ----------
Everything in PowerShell is an object. Object properties are characteristics that describe the object.
Object methods describe how to use the object or actions an object can take.
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
# 1. Create a custom object named $person using the New-Object cmdlet.
# 2. Use Add-Member cmdlet to add a property to the $person object called FirstName with my name
# 3. Add a method to the $person object. Name the method "greeting" and have the enclosed line of code output a greeting string using Write-Host
# 4. Call the newly-added .greeting() method of the $person object.
$person = New-Object -TypeName PSCustomObject
$person | Add-Member -MemberType NoteProperty -Name "FirstName" -Value "Lee"
$person | Add-Member -MemberType ScriptMethod -Name "greeting" -Value {Write-Host "Hello, World!"}
$person.greeting()


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


# ----------
Arrays
# ----------

Arrays are a data structure that holds a collection of items. Items can be of the same type or multiple types.
Think of arrays as a variable that can hold more than one value. Consider the example below:

$my_arr = 25, "Codecademy", 1, $False

my_arr is an array that holds the integer 25, the string Codecademy,
the integer 1, and the boolean False – in that order. 
Referencing the variable will output each item one at a time.
PS > $my_arr
25
Codecademy
1
False

Separating items by commas is the simplest way to create an array, but it’s not the only way.
Another way is to use the array subexpression operator @( ).
Anything placed within the parentheses is treated as an item of the array. 
It can be anything from a single element to output from commands. The following examples best illustrate its usage.

$arr_1 = @($True, 5, (Get-Date).DateTime) # 3 elements
$arr_2 = @( )                             # Empty Array
$arr_3 = @(                               # Multi-line Array
    "Uno"
    "Dos"
    "Tres"
) 


# ----------
Accessing Array items
# ----------

Indexing
The easiest way to access an item from an array is to use its index number.
An index is the position number of an item. Consider the example below:

$colors = "red", "yellow", "black", "blue"
#.          0       1         2       3

The numbers underneath the items represent their indices. An array’s indices always start at 0.
If we want to access black, for example, we must offset – or skip – 2 times.

$colors[2]
black

Each array object has a Length property that gives us the number of items in that array.
The property Count will return the same value.

Updating Items

We can also update items by utilizing indices. To change the color yellow to brown, for example:
PS > $colors[1] = "brown"


Special Index Tricks
PowerShell offers much more flexibility when indexing items such as

Multiple indices: separate indices with commas to print multiple items:
$colors[0,2]
red
black
The example above displays the values at index 0 and 2.

Range operator ..: print all items between two indices:
$colors[1..3]
brown
black
blue
The above example displays the values from index 1 to index 3.

Reverse range: use range operator from a higher index to a lower index to print items in reverse order (inclusive)
PS > $colors[2..1]
black
brown
The above example displays the values from index 2 to index 1.

Negative indices: items are referenced in reverse order where the last item has index -1
PS > $colors[-1]
blue
The above example displays the value in the last index, 3.


Iteration

Each array object has a method called ForEach that allows us to perform the same action on each array item.
We can use the variable PSItem or underscore _ to refer to each item in the array.

PS > $colors.ForEach({ $PSItem.Length })
3
5
5
4

The example above is printing the length of each string of our colors array.
red has a length of 3, brown is 5, and so on.


Operators for Arrays

Some of the operators that work on variables also work on arrays.

Adding Arrays
The addition operator + concatenates – or combines – two arrays.

PS > $fibonacci = 0, 1, 1, 2, 3, 5
PS > $fib_2 = 8, 13, 21, 34
PS > $fibonacci + $fib_2
0
1
1
2
3
5
8
13
21
34

Multiplying Arrays
The multiplication operator * copies the array a specified number of times.

PS > $fib_2 * 2
8
13
21
34
8
13
21
34

We could also use the addition += or multiplication *= assignment operators to assign the resulting array
back to the main array. 


Containment Operators
Containment operators check whether or not an item is in an array and returns a boolean. There are four operators:
    -contains: <array> -contains <item>
    -notcontains: <array> -notcontains <item>
    -in: <item> -in <array>
    -notin: <item> -notin <array>

Examples:
PS > $fibonacci -contains 4
False
PS > 5 -in $fibonacci
True

The -contains and -in operators do not differ in functionality, only the order of the operands.

-join
The -join operator combines the items in an array into a string separated by a character or a string.
Example:
PS > $fibonacci = 0, 1, 1, 2, 3, 5
PS > $fibonacci = $fibonacci -join "->"
PS > $fibonacci
0->1->1->2->3->5
PS > $fibonacci.GetType().Name
String


Strongly Typed Arrays

Similar to how we can force a type on a variable to create constrained variables. 
We can force a type onto an array so that each item has to adhere to that type.
For example, if we wanted to force an array only to have strings, we can use the following notation:

PS > [String[]]$fruits = "apple", "banana", "kiwi"

Arrays of Objects

Arrays can hold objects too. Consider the following array:
$dogs_arr = @(
    [PSCustomObject]@{Name = 'Rufus'; Age = 10}
    [PSCustomObject]@{Name = 'Miku'; Age = 2}
)

We utilize the multiline format of creating an array and hashtables to populate the array with dog objects.
We can then access objects individually, including their properties and methods.

PS > $dogs_arr.ForEach({ $_.Name + " is " + $_.Age + " years old."})
Rufus is 10 years old.
Miku is 2 years old.
