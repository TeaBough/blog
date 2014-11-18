---
layout: post
title: Load test your api with Gatling in 10 minutes
tags: [gatling, performance]
---

Gatling is an open-source load testing framework based on in Scala. It's very simple to use even if you don't know Scala.

## 0 - Prerequisite

You have on your machine : a jdk and sbt.

## 1 - Install Gatling

Unzip the (lastest)[http://gatling.io/download/] release. There is two interesting folder for now. `./bin` and `./user-files`. It's in the lastest folder that we'll develop our scenario.

## 2 - Configure sbt

In the base directory add this build.sbt file : 
{% highlight scala%}
name := "my-project"

version := "0.1"

scalaVersion := "2.11.4"

scalaSource in Compile := file("./user-files/simulations/")
{% endhighlight %}

After that I usually run sbt-gen idea in order to open it with Intellij.

## 3 - Add your first test
{% highlight scala%}
package basic

import io.gatling.core.Predef._
import io.gatling.http.Predef._

class MySimulation extends Simulation {

  val scn = scenario("My scenario").repeat(5) {
    exec(
      http("My Request")
        .get("https://my-url/test")
        .check(status.is(200))
    )
  }
  setUp(scn.inject(atOnceUsers(4)))
}
{% endhighlight %}

The code is pretty straighforward. It creates a scenario called "My scenario" that each user will run 5 times. We check for a status code of 200. The last line add that we want 4 simultaneous users.


## 4 - Launch and get the results

