---
date:  2011-03-29T19:58:31
slug: "snippet-for-adding-unknown-filesdirs-to-subversion-command-line"
aliases: [/blog/2011/03/29/snippet-for-adding-unknown-filesdirs-to-subversion-command-line]
title: Snippet for adding unknown files/dirs to Subversion (command line)
categories: ["programming"]
draft: false
---

```
svn add `svn st | grep "^?" | awk '{print $2}'`
```
