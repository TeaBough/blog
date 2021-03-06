---
layout: post
title: My Ruby Journey &#58; day 1
excerpt: "Variables, modules and the lib folder"
modified: 2014-09-26
tags: [ruby, beginner]
comments: true
---

<section id="table-of-contents" class="toc">
  <header>
    <h3>Overview</h3>
  </header>
<div id="drawer" markdown="1">
*  Auto generated table of contents
{:toc}
</div>
</section><!-- /#table-of-contents -->



# Variables
Local : `firstName`
Instance : `@firstName`
Class : `@@firstName`
Global : `$firstName`

# Module in ruby

## Why do I need a module

Suppose you are developping several class and you have noticed that they a some common behaviour. It's in this case that module come in handy. Modules allows you to implements functions that you will include in other class.
## Example

Here is a module :

{% highlight ruby %}
module MyMod
    def behaviour1
    end
    def behaviour2
    end
end
{% endhighlight %}

Let's now import it in another class :

{% highlight ruby %}
class MyClass
    include MyMod
    # You can now use behaviour1 and behaviour2
end
{% endhighlight %}

# Add libraries (Rails 4)

Classes are not models, controllers or view must be put in lib. For instance a class which handles PDF should be in `/lib`. In order to load the classes in `/lib` you need to add this line in `application.rb` :
{% highlight ruby %}
config.autoload_paths += %W(#{Rails.root}/lib)
{% endhighlight %}
If you have a classe in `/lib/folder/my_class.rb` in order to use it in an other class you have to prefix the instanciation with the namespace :
{% highlight ruby %}
Folder::MyClass.new
{% endhighlight %}

