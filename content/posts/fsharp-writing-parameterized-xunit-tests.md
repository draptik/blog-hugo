---
title: "Parameterized xUnit Tests with F#"
slug: "fsharp-writing-parameterized-xunit-tests"
date: 2022-01-12T16:56:10Z
categories: ["fsharp", "testing", "xunit", ".NET", "test"]
draft: false
---

This posts showcases different ways of writing parameterized tests with [xUnit](https://xunit.net/) using F#.

I'm assuming you

- have a basic knowledge of F#
- are familiar with the concept of parameterized tests
- are familiar with parameterized tests with C#/xUnit

## TL/DR

```fsharp
type Somebody = { Name : string }
let samplesTLDR : obj[] list =
    [
        [| { Name = "Homer" }; "Homer" |]
        [| { Name = "Marge" }; "Marge" |]
    ]
    
[<Theory>]
[<MemberData(nameof(samplesTLDR))>]
let ``test TLDR`` someBody expected =
    Assert.Equal(expected, someBody.Name)
```

## InlineData

The simplest way to write a parameterized test with xUnit is using the `InlineData` attribute:

```fsharp
[<Theory>]
[<InlineData(1, 42, 43)>]
[<InlineData(1,  2,  3)>]
let ``inlinedata hello world`` (a : int) (b : int) (expected : int) =
    let actual = a + b
    Assert.Equal(expected, actual)
```

Executing this test will run the test twice: First, using the values 1, 42, and 43, and then a second time, using the values 1, 2, and 3.
The values are passed to the test method's input parameters (`a`, `b`, and `expected`) and can then be used inside the test. We can use as many `InlineData`s as we like.

`InlineData` has a limitation though: It only accepts basic data types (string, int, bool, etc).
It can't deal with collections or custom types.

This is where xUnit's `MemberData` attribute comes into play.

## MemberData - Intro

We create a function `sampleNumbers` which returns a list of object arrays (`obj[] list`).

BTW: `obj` is an F# alias for C#'s `Object`.

```fsharp
// Return signature: obj [] list
let sampleNumbers : obj [] list =
    [
        [| 1 |]
        [| 2 |]
        [| 3 |]
    ]

// Theory with MemberData: simple example
[<Theory>]
[<MemberData(nameof(sampleNumbers))>]
let ``xunit memberData hello world`` number =
    Assert.True(number > 0)
```

This function can then be referenced by the `MemberData` attribute.
In this example each object array only contains a single number, which is then passed to the test methods input parameter `number`.

## Sample Data

Next, we will create a custom type which we can use as input data for testing:

```fsharp
type Person = { Name: string; Incidents: int; Age: int }

let lisa = { Name = "Lisa"; Incidents = 0; Age = 6 }
let marge = { Name = "Marge"; Incidents = 0; Age = 39 }
let homer = { Name = "Homer"; Incidents = 10; Age = 42 }
let bart = { Name = "Bart"; Incidents = 42; Age = 8 }
```

## MemberData - inferred return type

A simple function providing this data:

```fsharp
// Return type is inferred as `Person[] list`
let samplePeople =
    [
        [| homer |]
        [| marge |]
        [| lisa |]
        [| bart |]
    ]
```

Note that this time we are not defining the return type and the compiler will infer `Person[] list`.
This will only work because we are dealing with a single type:

```fsharp
[<Theory>]
[<MemberData(nameof(samplePeople))>]
let ``xunit memberData with single type`` person =
    Assert.True(person.Age > 0)
```

## MemberData - sequence instead of list

Xunit's `MemberData` also tolerates using a sequence ([`seq`](https://docs.microsoft.com/en-us/dotnet/fsharp/language-reference/sequences)) instead of a [`list`](https://docs.microsoft.com/en-us/dotnet/fsharp/language-reference/lists), but in this case we must `yield` the result.
Since the inner collection is of type `obj[]` we are free to mix different types.

```fsharp
// When mixing different data types (here: Person and string) 
// ensure that the returned collection is `obj[] seq`
let sampleDataWithExpected : obj[] seq =
    seq {
        yield [| homer; "Homer" |]
        yield [| marge; "Marge" |]
    }

[<Theory>]
[<MemberData(nameof(sampleDataWithExpected))>]
let ``different types and return signature seq`` person name =
    Assert.Equal(name, person.Name)
```

## MemberData - inferred type with boxing

Another way of ensuring that the inner collection is of type `obj[]` is to use F#'s [`box`](https://fsharp.github.io/fsharp-core-docs/reference/fsharp-core-operators.html#box) function:

```fsharp
// No return signature -> boxing
// Only the first element of the first collection has to be boxed    
let sampleData2WithExpected =
    seq {
        yield [| box homer; "Homer" |]
        yield [| marge; "Marge" |]
    }

[<Theory>]
[<MemberData(nameof(sampleData2WithExpected))>]
let ``different types and no return signature/boxing`` person name =
    Assert.Equal(name, person.Name)
```

`box` converts a strongly typed value into an `obj`. 
After some experimenting it seems that only the first entry of the first collection has to be `box`ed.
All other values will have the same type as the first value.

## MemberData - inferred type with upcasting

A similar approach to `box`ing is to upcast the value to `Object` using the [`:>`](https://docs.microsoft.com/en-us/dotnet/fsharp/language-reference/casting-and-conversions#upcasting) operator:

```fsharp
// No return signature -> casting to object
// Only the first element of the first collection has to be casted    
let sampleData3WithExpected =
    seq {
        yield [| homer :> Object; "Homer" |]
        yield [| marge; "Marge" |]
    }

[<Theory>]
[<MemberData(nameof(sampleData3WithExpected))>]
let ``different types and no return signature/upcasting`` person name =
    Assert.Equal(name, person.Name)
```

Just like `box`ing, only the first entry of the first collection seems to need this.
BTW: If your first reaction is "upcasting is evil": Same here, just showing possible options...

## Summary

The shortest variant, and the most readable IMHO, is still manually defining the return type in the data generating function:

```fsharp
// Shortest variant
let samplePeopleWithResult : obj[] list =
    [
        [| homer; "Homer" |]
        [| marge; "Marge" |]
        [| lisa; "Lisa" |]
        [| bart; "Bart" |]
    ]
    
[<Theory>]
[<MemberData(nameof(samplePeopleWithResult))>]
let ``different types and return signature list`` person name =
    Assert.Equal(name, person.Name)
```

## Resources

I found these references useful while learning about this topic:

- [Using xUnit Theory Member Data with F#](https://www.jessesquire.com/articles/2018/02/17/xunit-memberdata-with-fsharp/)
- [SO: In F# how do you pass a collection to xUnit's InlineData attribute](https://stackoverflow.com/questions/35026735/in-f-how-do-you-pass-a-collection-to-xunits-inlinedata-attribute)
- My C# reference on this subject: [Creating parameterised tests in xUnit with [InlineData], [ClassData], and [MemberData]](https://andrewlock.net/creating-parameterised-tests-in-xunit-with-inlinedata-classdata-and-memberdata/)

An accompanying GitHub repository to this post can be found here: [https://github.com/draptik/fsharp-xunit-parameterized-tests](https://github.com/draptik/fsharp-xunit-parameterized-tests).
