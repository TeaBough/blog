---
layout: post
title: Set up nginx in 2 minutes for Jekyll on Archlinux 
tags: [nginx]
---

This is a reminder. The purpose here is to simply tell nginx to redirect requests coming to the server to the port 4000 which corresponds to Jekyll.

{% highlight console %}
# pacman -S nginx
# systemctl enable nginx
# systemctl start nginx
{% endhighlight %}

Add this snippet in /etc/nginx/nginx.conf
{% highlight nginx%}
server {
        listen       80;
        location / {
            proxy_pass http://0.0.0.0:4000;
        }
}
{% endhighlight %}

{% highlight console %}
# systemctl restart nginx 
{% endhighlight %}

And you are good to go.
