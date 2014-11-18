---
layout: post
title: Prevent your API from scrapers with nginx, fail2ban and mailjet
tags: [fail2ban, api, nginx, mailjet]
---

In my current project we need to prevent people from scraping our API. We have a rails API running with nginx. We want to ban an IP 24 hours when it makes more than 50 requests per hour. And we want a shiny email when it happens. We don't want to install a mail server thus we are going to use mailjet.

Once you have installed, fail2ban add those lines at the end of `/etc/fail2ban/jail.conf`

{% highlight INI %}
[http-get-dos]
enabled = true
port = http,https
filter = http-get-dos
logpath = /var/log/nginx/access.log
ignoreip =  127.0.0.1 8.8.8.8
maxretry = 50
# time window (in seconds) where the maxretry times should occur
findtime = 3600   ; 1 hour
#ban for 24 hours
bantime = 86400  ; 1 day
action = iptables-multiport[name=HTTPHTTPS, port="http,https"]
		 mailjet[name=mailjet]
{% endhighlight %}

We now need to specify fail2ban how to parse the nginx access.log and identify the ips that make requests. We add a file named `http-get-dos` in `/etc/fail2ban/filter.d` :


{% highlight INI %}
[Definition]
failregex = <HOST>.*
{% endhighlight %}

The 2 last lines we've added in `jail.conf` contains the action we take when we detect an intrusion. `iptables-multipost` is a default configuration of fail2ban that prevents the ip from requesting our server using http/https.`mailjet` is rule that warns us by email when somebody gets banned, we need to add `mailjet.conf` in `/etc/fail2ban/jail.conf` :


{% highlight INI %}
[Definition]

actionstart =
actionstop =
actioncheck =
actionunban =

actionban = WHOIS=`/usr/bin/whois <ip>`
            EMAIL_SUBJECT="[Fail2Ban] <name>: banned <ip> from `uname -n`"
	        EMAIL_CONTENT=`printf "The IP <ip> has just been banned by Fail2Ban after <failures> attempts against <name>.\n\n Here are more information about <ip>:\n$WHOIS\nRegards,\nFail2Ban"`
            curl -X POST --user <user>  -F from=<from> -F to=<to> -F subject="$EMAIL_SUBJECT" -F text="$EMAIL_CONTENT" <url>


[Init]
url="https://api.mailjet.com/v3/send"
from="YOU@YOU.com"
to="tech@YOU.com"
user="YOUR_MAILJET_APIKEY:YOUR_MAILJET_PRIVATE_KEY"
{% endhighlight %}

You need of course to use your own mailjet credentials and mails in order to use this configuration.

And ... done. You just need to restart fail2ban. Now when someone will make more that 50 requests an hour he'll be ban and you will receice an email warning you of that.

One last comment, if you want to manually unban someone here is the command :

{% highlight console %}
# fail2ban-client set http-get-dos unbanip <IP>
{% endhighlight %}
