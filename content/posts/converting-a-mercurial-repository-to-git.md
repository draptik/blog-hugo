---
date:  2012-02-07T00:40:01
slug: "converting-a-mercurial-repository-to-git"
aliases: [/blog/2012/02/07/converting-a-mercurial-repository-to-git]
title: Converting a Mercurial repository to Git
categories: ["programming"]
draft: false
---

Note to self:

Converting Hg repos to git using hg-fast-export.

Installation:

`
$ sudo aptitude install hg-fast-export
`

Usage:

``` sh
$ cd new_git_dir

$ git init

$ hg-fast-export -r <hg-repo>
```

Works with:

git version 1.7.5.4

hg version 2.1
