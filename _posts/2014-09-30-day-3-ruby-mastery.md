---
layout: post
title: My Ruby Journey &#58; day 3
excerpt: "Objects, methods, and local variables"
modified: 2014-09-30
tags: [ruby, beginner]
comments: true
---

In order to have a deeper knowledge of Ruby that I'm using in my current job, I'm currently reading the Well-Grounded Rubyist by David A. Black. Today I've read the second chapter of the book which talk about Object methods, and local variables. And here is what I've learned.

# Classes vs objects in Ruby

You can basically see a class has a layout for the objects. A class contains the common behaviours of the objects that are going to be created from that class (attributes, methods ...).

# Arguments

## Default arguments
{% highlight ruby %}
def my_method(a = 3)
    puts a
end
my_method

# -> 3
{% endhighlight %}
## Random number of arguments
{% highlight ruby %}
def my_method(*a)
    puts a
end
my_method(1,2)

# -> [1,2] 
{% endhighlight %}

`*a` acts like a sponge. It grabs the variables it can. Here is another example :
{% highlight ruby %}
def my_method(a,*b,c)
    puts a
    puts b
    puts c
end
my_method(1,2,3,4)

# -> 1 
# -> [2,3] 
# -> 4 
{% endhighlight %}

# Random facts 

* The last line of a methods is the return value (as in Scala)
* In order to insert the value of a variable in a string you can use `#{}`. Here is an example :
 {% highlight ruby %}
name = "Toto"
puts "Hello my name is #{name}"
 {% endhighlight %}
* For checking the presence of a method in an object you can use `respond_to?`
* Suppose you want to send a message to an object (reminder : saying "send a message to an object" in the Ruby world is equivalent to saying "call that method on that object"). The problem is the message you want to send is in a variable. You can't do `my_object.my_var`. Fortunatly Ruby has a method exactly to do that and it's called `send`. You can use it like this : `my_object.send(my_var)`.

