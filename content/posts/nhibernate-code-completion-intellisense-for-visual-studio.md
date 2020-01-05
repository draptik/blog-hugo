---
date:  2010-12-08T21:47:42
slug: "nhibernate-code-completion-intellisense-for-visual-studio"
aliases: [/blog/2010/12/08/nhibernate-code-completion-intellisense-for-visual-studio]
title: NHibernate Code Completion (IntelliSense) for Visual Studio
categories: ["programming"]
draft: false
---

Enable code completion (IntelliSense) in Visual Studio by copying the XSD files from NHibernate to your Visual Studio's XML folder.

For example (NHibernate 2.0.1):

Files to copy:

`${nhibernate-location}\NHibernate\2.0.1\nhibernate-configuration.xsd
${nhibernate-location}\NHibernate\2.0.1\nhibernate-mapping.xsd
`

Destination:

`C:\Programme\Microsoft Visual Studio 10.0\Xml\Schemas`


