---
date:  2010-08-20T00:08:36
slug: "using-nunit-with-visual-studio-express"
aliases: [/blog/2010/08/20/using-nunit-with-visual-studio-express]
title: Using NUnit with Visual Studio Express
categories: ["programming"]
draft: false
---

Since Microsoft's **Visual Studio Express** edition does not allow installation of any plugins anymore (f.ex. [TestDriven.Net](http://www.testdriven.net/)), here is a quick workaround to get [NUnit](http://www.nunit.org/)-GUI working. Add this to your Post-Build section of your Project settings:

`
copy /Y "$(ProjectDir)App.config" "$(TargetDir)$(TargetFileName).config"
`

For more details please consult [http://codebetter.com/blogs/darrell.norton/archive/2005/05/13/63169.aspx](http://codebetter.com/blogs/darrell.norton/archive/2005/05/13/63169.aspx)
