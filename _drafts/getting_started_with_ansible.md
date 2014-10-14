---
layout: post
title: First steps with Ansible 
excerpt: "First steps with Ansible"
modified: 2014-09-26
tags: [devops, ansible, boostrap]
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

I've used Puppet as my automation solution system for my laptop configuration and I've used Chef in one of my previous 
professional experience. Lately I've heard a lot of good things about [Ansible](http://www.ansible.com/home), thus I've decided to give it a try.

# What ?!? Nothing needs to get install on the server ?

The first thing that really surprised me was the fact that you only need to install Ansible on your local machine and you
are done. It's because Ansible doesn't use agent, it only uses ssh to configure the distant machine.

# Create a simple project
 
 Let's try to create a simple project that will only create a user on the distant machine. I suppose you have Ansible installed on your machine. 

## Configure the host
Let's start by create a file called `hosts` with this content :
{% highligth yaml %}
45.245.26.35:2348
{% endhighligth %}

In this file we define the machines that will be configured (45.245.26.35) and the port (2348).
 
## Create the first role and task

We start by creating a new folder `roles` that will host our role. In this folder we create another one which is by convention
the name of the role we define `users`. Finally we create another folder `tasks` that will host the directives for the role `users`.

{% highlight console %}
$ mkdir -p roles/users/tasks
{% endhighligth %}

In tasks we create a file called `main.yml` with this content which is straightforward :

{% highligth yaml %}
- user: name=teabough 
{% endhighligth %}

## Link our role with our host
Let's create `site.yml` which is here again straightforward :

{% highligth yaml %}
- hosts: all
  roles:
   - role: users
{% endhighligth %}

## And then run it ...

{% highlight console %}
$ ansible-playbook site.yml -i hosts
{% endhighligth %}

And you are done

# Conclusion

My first impression are really good. You can do some much in only a couple of hours. I'll continue to play with Ansible, that's for sure !







