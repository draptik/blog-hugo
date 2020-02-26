---
title: "TDD Money Step-by-Step in C#"
date: 2020-02-25T00:49:53+01:00
categories: ["csharp", "dotnetcore", "tdd"]
draft: false
---
While preparing a TDD workshop, I ported [Kent Beck](https://en.wikipedia.org/wiki/Kent_Beck)'s Money example from the book ["Test-Driven Development by Example"](https://www.amazon.de/Test-Driven-Development-Example-Signature/dp/0321146530)

- to C#
- using .NET Core

I've tried to map **each change** described in the book to a dedicated git commit with a sensible commit message. It turned out being about **100 commits**. The "micro-commits" are for teaching & learning ("step-by-step"). Here's a screenshot:

![img](/images/posts/tdd-money-csharp/git-log-screenshot.png)

The solution includes the "trick" of extracting an "Expression" interface to deal with money operations:

> "[Ward Cunningham](https://en.wikipedia.org/wiki/Ward_Cunningham) came up with the 'trick' a decade ago,and I haven't seen it independently duplicated yet, so it must be a tricky trick."

Kent's solution shows how TDD can lead to well-crafted code. Complying to OO (Object-Oriented) best practices, such as

- Encapsulation (aka information hiding),
- "Tell, don't ask" (aka Hollywood principle),
- SRP (Single Responsibility Principle),
- SLA (Single Level of Abstraction)

just to name a few.

After finishing this exercise, I stumbled upon Mark Seeman's post [https://blog.ploeh.dk/2017/10/16/money-monoid/](https://blog.ploeh.dk/2017/10/16/money-monoid/) which shows that this solution also conforms to Functional Programming (FP) best practices. Money is a Monoid. Which is one of the FP pillars for making things composable.

Feel free to use the code to your liking:

[https://github.com/draptik/tdd-money-csharp](https://github.com/draptik/tdd-money-csharp)
