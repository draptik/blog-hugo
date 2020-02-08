---
title: "F#: Function Signature"
slug: "Fsharp: Function Signature"
date: 2020-02-05T08:54:33+01:00
categories: ["fsharp", "domain-driven-design", "haskell"]
draft: false
---

I always forget how to write Haskell-like function signatures in F#.

``` fsharp
type AddOne = int -> int
let addOne : AddOne =
    fun i ->
        i + 1
```

![screenshot with signature2](/images/posts/fsharp-domain-signature/ide-example3.png)

You can think of `AddOne` as an interface in OO-languages, for functions.
Basically, it's a (C#) delegate, with less boilerplate.

The beauty of it: I can model my domain with `AddOne`, without caring about the implementation of `addOne`.
