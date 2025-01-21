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

# All information associated with an object is called a member. We can discover the members of an object with the Get-Member cmdlet. 
# It also shows the type of an object. In the following example, the object is a string:

Get-Member -InputObject "Codecademy"
# A more common way to use Get-Member is by piping an object to Get-Member like so:
"Codecademy" | Get-Member

# Both approaches produce the same result.

# To discover just the properties of an object, we can add -MemberType Property to the Get-Member cmdlet. Examples:
# Show all properties and methods of the variable $name
$name | Get-Member

# Show only the properties of the variable $name.
$name | Get-Member -MemberType Property

# Use the Length property to get the length of the $name variable.
$name.Length
