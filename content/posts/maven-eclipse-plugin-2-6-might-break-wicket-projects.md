---
date:  2009-06-13T17:59:16
slug: "maven-eclipse-plugin-2-6-might-break-wicket-projects"
aliases: [/blog/2009/06/13/maven-eclipse-plugin-2-6-might-break-wicket-projects]
title: Maven-eclipse-plugin 2.6 might break wicket projects
categories: ["programming"]
draft: false
---
Took me a while to find this, so I thought I'll post it: [Maven's eclipse plugin version 2.6](http://maven.apache.org/plugins/maven-eclipse-plugin/) does not work well with [Wicket](http://wicket.apache.org/) projects.

The problem with version 2.6 is that the Maven's folder structure does not conform to Wicket's folder structure. This seems to be fixed in version 2.7. Alternatively, you can use Maven-eclipse-plugin version 2.5.1.

See [Martijn Dashorst's blog](http://martijndashorst.com/blog/2009/05/29/maven-eclipse-plugin-woes-fixed/) and [this thread](http://www.nabble.com/maven-eclipse-plugin-2.6-will-break-your-wicket-projects-tt22844953.html#a22844953) on the wicket-user mailing list for details.


In short: If your `pom.xml` file contains


``` xml
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-eclipse-plugin</artifactId>
    <version>2.6</version>
</plugin>
```

replace it with this

``` xml
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-eclipse-plugin</artifactId>
    <version>2.5.1</version>
</plugin>
```
