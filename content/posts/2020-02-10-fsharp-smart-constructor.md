---
title: "F# Smart Constructor"
slug: "Fsharp: Smart Constructor"
date: 2020-02-10T22:20:01+01:00
categories: ["fsharp", "domain-driven-design", "value object"]
draft: false
---

The "Smart Constructor" pattern allows us to create a type with F#. **With validation**.

## TL/DR

Here is the F# boiler plate needed to implement the [Value Object](https://en.wikipedia.org/wiki/Value_object) pattern.

``` fsharp
type UserName = private UserName of string

module UserName =
    let isValid s = // ...

    // smart ctor
    let create (str: string) =
        if isValid str then
            Some UserName str
        else
            None

    // helper function extracting value
    let value (UserName s) = s
```

Usage:

``` fsharp
let workingWithSmartCtor name =
    let maybeValidUserName = UserName.create name
    match maybeValidUserName with
    | Some validName -> validName |> UserName.value
    | None -> "invalid UserName"

workingWithSmartCtor ""     // -> "invalid UserName"
workingWithSmartCtor "lisa" // -> "lisa"
```

## Example

### Step 1

Let's start with a type `Person`:

``` fsharp
type Person = {
    FirstName: string
    LastName: string
    UserName: string
}

let homer = {
    FirstName = "Homer"
    LastName = "Simpson"
    UserName = "Homer Simpson"
}
```

Note that F#'s record types are immutable by default. `homer` can't be modified.

Imagine a `FormatName` function expecting `FirstName` and `LastName`. A naive C# method signature would look like this:

``` csharp
public string FormatName(string firstName, string LastName) => // ...
```

A naive F# function signature would look the same way (with less boiler plate):

``` fsharp
let FormatName firstName lastName = // ...
```

What will happen? Consumers of this C# method/F# function will mix up the order of the input parameters, because both are strings.

### Step 2

Since F# provides a type system, let's use it:

``` fsharp
type FirstName = FirstName of string
type LastName = LastName of string
type UserNameSimple = UserNameSimple of string

type PersonWithSimpleTypes = {
    FirstName: FirstName
    LastName: LastName
    UserName: UserNameSimple
}

let bart = {
    FirstName = FirstName "Bart"
    LastName = LastName "Simpson"
    UserName = UserNameSimple "Bart Simpson"
}
```

This step removes the ["Primitive Obsession Smell"](https://enterprisecraftsmanship.com/posts/functional-c-primitive-obsession/).

### Step 3

Now we suddenly have new requirements:

- `FirstName` is optional
- `LastName` is optional
- `UserName` is required, must not be empty, and must have less than 50 characters

Making `FirstName` and `LastName` optional is easy in F# (using the `option` type).

``` fsharp
type ValidPerson = {
    FirstName: FirstName option
    LastName: LastName option
    UserName: // ??
}
```

But how to guarantee a valid `UserName`?

This is where the Smart Constructor pattern comes into play:

``` fsharp
// type is private
type UserName = private UserName of string

module UserName =
    let isValid s = not (String.IsNullOrEmpty(s)) && s.Length < 50

    // smart constructor
    let create (str: string) =
        if isValid str then
            Some (UserName str)
        else
            None

    // helper function to extract the string
    let value (UserName str) = str
```

Side note: The Smart Constructor's `create` function doesn't have to return an `option` type (like in this example): It could also return a `Result` type, or throw an exception, or do something completely different.

Here, the `UserName.create` function returns `None` for invalid user names. We can pattern match the `option` to a string:

``` fsharp
match UserName.create someString with
| Some validName -> validName |> UserName.value
| None -> "invalid UserName"
```


We can now decide if we want to create another Smart Constructor for the `ValidPerson` type or some other type of pipeline (f.ex. "applicative validation") or a combination of these strategies.

But we have ensured that the type `UserName` **is always valid, so we don't ever have to check it again**.

UPDATE 2022-05-13: Fix syntax error (replace `let` with `type`).Thanks Alex!
