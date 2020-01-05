---
date:  2010-11-02T23:59:09
slug: "emacs-murrine_style_draw_box-assertion-height-1-failed"
aliases: [/blog/2010/11/02/emacs-murrine_style_draw_box-assertion-height-1-failed]
title: 'Emacs: murrine_style_draw_box: assertion `height >= -1'' failed'
categories: ["linux"]
draft: false
---

This nasty bug has been around for over a year: Calling Emacs on Ubuntu from the console outputs

`murrine_style_draw_box: assertion `height >= -1' failed`

after _every action_ within Emacs.

The solution is simple, but has not been integrated in the Ubuntu repository yet.

Here it is:

In the file

`/usr/share/themes/Ambiance/gtk-2.0/gtkrc`

change

`GtkRange::trough-under-steppers = 0`

to

`GtkRange::trough-under-steppers = 1`

For details see [Bug #538541](https://bugs.launchpad.net/ubuntu/+source/emacs23/+bug/538541), [Bug #550532](https://bugs.launchpad.net/ubuntu/+source/emacs-snapshot/+bug/550532) and ﻿[Resolving "murrine_style_draw_box: assertion `height >= -1'"](http://thehacklist.blogspot.com/2010/06/resolving-murrinestyledrawbox-assertion.html)
