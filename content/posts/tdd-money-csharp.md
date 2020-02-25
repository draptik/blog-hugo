---
title: "TDD Money Step-by-Step in C#"
date: 2020-02-25T00:49:53+01:00
categories: ["csharp", "tdd"]
draft: true
---

[Kent Beck](https://en.wikipedia.org/wiki/Kent_Beck)'s Money example from the book ["Test-Driven Development by Example"](https://www.amazon.de/Test-Driven-Development-Example-Signature/dp/0321146530).

- in C#
- using .NET Core

Source:

[https://github.com/draptik/tdd-money-csharp](https://github.com/draptik/tdd-money-csharp)

I've tried to map each change described in the book to a dedicated git commit with a sensible commit message. It turned out being about 100 commits.

The solution includes the "trick" of extracting an "Expression" interface to deal with money operations:

> "[Ward Cunningham](https://en.wikipedia.org/wiki/Ward_Cunningham) came up with the 'trick' a decade ago,and I haven't seen it independently duplicated yet, so it must be a tricky trick."
