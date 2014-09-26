---
layout: post
title: Play 2 with heroku PostgreSQL DB and Slick
---

I have struggled almost a day in order to be able to connect to my fresh PostgreSQL DB hosted on Heroku with my Play!2 application. I kept having those two errors :

> No suitable driver found
> FATAL: no pg_hba.conf entry for host « XXX.XXX.XXX.XXX »

Here is how I managed to get it work.

First of all, I use Play 2.2.3.

You need to add the correct PostgreSQL driver, so here is my buid.sbt :
{% highlight scala %}
libraryDependencies ++= Seq(
  jdbc,
  "com.typesafe.slick" %% "slick" % "2.0.1",
  "org.postgresql" % "postgresql" % "9.3-1100-jdbc4"
)
{% endhighlight %}
And now here is the line that interest you in application.conf :

{% highlight INI %}
db.default.url="postgres://LOGIN:PASSWORD@HOST:PORT/DBNAME?ssl=true&sslfactory=org.postgresql.ssl.NonValidatingFactory"
{% endhighlight %}

And in order for Slick to use this configuration :

{% highlight scala %}
import play.api.db.DB
import play.api.Play.current

Database.forDataSource(DB.getDataSource()).withSession { 
// YOUR CODE
}
{% endhighlight %}
And you should be good to go …
