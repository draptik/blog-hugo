---
date:  2012-03-27T20:33:18
slug: "gnuemacs-desktop-save-with-lazy-loading"
aliases: [/blog/2012/03/27/gnuemacs-desktop-save-with-lazy-loading]
title: 'GNU/Emacs: Desktop Save with "Lazy Loading"'
categories: ["linux"]
draft: false
---

When using [desktop-save-mode](http://www.gnu.org/software/emacs/manual/html_node/emacs/Saving-Emacs-Sessions.html) using `desktop-restore-eager` is a must:

``` scheme
(custom-set-variables
	'(desktop-save-mode t)
	'(desktop-restore-eager 5))
```

`desktop-save-mode` will load your last session. Setting `desktop-restore-eager` to 5 will only try to load and render the last 5 buffers while loading your saved buffers.
