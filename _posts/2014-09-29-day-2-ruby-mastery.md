---
layout: post
title: My Ruby Journey &#58; day 2
excerpt: "Variables, modules and the lib folder"
modified: 2014-09-29
tags: [ruby, beginner]
comments: true
---

# Classes and objects

In ruby, an object can change his behaviour, this is a core element of ruby. For instance in Java it is not possible, once you have instanciated an object, you can't add methods or alter them.

# Some ruby command
## Check syntax

You can use this cw option of the ruby console

{% highlight console %}
$ ruby -cw myfile.rb 
{% endhighlight %}

The c stands for check for syntax errors and the w for a higher level of warnings.

# Difference between print and puts

*puts* add a new line at the end of the string and *print* does not.

# Keyboard and IOs

## Keyboard
{% highlight ruby %}
age = gets
{% endhighlight %}
*gets* allows you to get user input
## Reading from a file
{% highlight ruby %}
File.read("my_file.txt")
{% endhighlight %}

## Writing to a file
{% highlight ruby %}
file = File.new("file.txt","w")
file.puts("HeHe")
file.close
{% endhighlight %}

# Load, require, require_relative
{% highlight ruby %}
load "myfile.rb"
{% endhighlight %}
*load* and *require* are executed during runtime, it will make the source code in myfile.rb available in your current file. The difference between *load* and *require* is that require will load the file only once, and will append ".rb" to the name (require "myfile" -> require "myfile.rb"). And *require_relative* load features by searching in the current directory.

# Useful ruby command options
## -l
{% highlight console %}
$ ruby -l "puts 'prinf '+ newline''"
{% endhighlight %}
This will add automatically a new line at the end of each *print*

## -rNAME
{% highlight console %}
$ ruby -rscanf
{% endhighlight %}
This will call require on its argument (in this case scranf).

## rdoc and ri
rdoc is the tool that analyse and organize comments in your code. ri is the command that allows you to display those informations.
{% highlight console %}
$ ri String#upcase 
{% endhighlight %}


# Random
## Inline
Here is how to run an inline program in ruby : 
{% highlight console %}
$ ruby -e "puts 'Hello'"
{% endhighlight %}

## Display loadpath
Here is how to display the loadpath :
{% highlight console %}
$ ruby -e "puts $:"
{% endhighlight %}
