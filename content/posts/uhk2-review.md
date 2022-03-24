---
title: "UHK2 Review"
date: 2022-03-24T19:34:32Z
draft: false
---

## TLDR

Great keyboard, but maybe not for everybody.

pros:

- great hardware
- ergonomic split design
- very easy re-programmable from any os (win/mac/linux)

cons:

- very expensive
- relearn some keys

## Motivation

As a software developer, I have always found the numpad on keyboards useless.
In addition, the numpad makes it harder to reach the mouse.
Welcome to the world of Ten-Key-Less (TKL) keyboards!
Once you start researching TKL keyboards, you will stumble upon the term "ergonomic keyboards" and
"split keyboards".
Most ergonomic split keyboards are custom-made DYI projects. And are expensive.

Only few companies provide ready-to-use keyboards in this market segment.

I picked the UHK because I didn't want to relearn every key. And I didn't want to Do-It-Myself.

Also the "reprogramming software" works on Windows/Linux/Mac, and is
very easy to use. The software works flawlessly with X11 and
Wayland. It's called
[agent](https://github.com/UltimateHackingKeyboard/agent). The
configuration is stored as a plain text JSON file.

And this review: [MECHANICAL KEYBOARD REVIEW - UHK V1, MISTEL BAROCCO
MD770, DROP ALT
CAPTAIN](https://developerlife.com/2021/03/09/mechanical-keyboard-review/)

## Shipping

So, I bought the UHK at https://ultimatehackingkeyboard.com/.

From ordering, until having on my desk: more than 12 months
passed. But this was clear from the get-go, so it's ok.

## Cool default features

Others have written detailed reviews about this keyboard. I just want to highlight some features which stood out to me.

There is a new key: **Mod**. It's located at the right thumb position (used to be where I pressed spacebar)

### Browser features

Simple, easy to use:

- previous tab: `Mod+w`
- next tab: `Mod+r`
- close tab: `Mod+c`
- new tab: `Mod+e`

### Esq

Even if your not a VIM user: `Esq` is the key to abort most stuff: closing a popup in just about any
application (not just within a browser).

Default: `Mod+q`

Really convenient!

### Alt Tab

Alternative to `Alt+Tab`: `Mod+d`. Often used, easier to type.

## Relearning - less keys

Missing keys are accessed by different modifier keys (similar to shift, alt, control).
The UHK introduces a new **Mod** key.

### Space on right thumb

Took me a couple of weeks, but is fine.

### No numpad

Obviously this was the easiest, since I never used these keys.

### Missing F-Keys

Also not a problem. The **Mod**-Key plus number is easy to learn and easy to use.
I mostly use these keys in the IDE/browser for debugging (debug, step-into, step-out).
Also no problem with Shift modifier (i.e. Shift-F11).

### Missing pgUp/pgDown

I don't need these keys often: No problem. (`Mod+y`/`Mod+h` default: if you're wondering)

### Missing print

I don't need this key often: No problem. (`Mod+[` default: if you're wondering)

### Missing arrow keys and ins/del/home/del

Not having arrow keys and ins/del/home/del is my main painpoint.

Having to press a modifier key to use these keys is ok when only navigating the cursor.
It becomes a pain when trying to **Shift+Alt+Ctrl** **selecting**.

I'll explain my workaround below.

## My customizations

I try to keep customizations to a minimum, because I work with different keyboards.

### Arrow keys 1/2

Since I never use the **bottom right modifier keys** on any keyboard, I remapped them to the arrow keys.

- `Fn` -> left
- `Alt` -> down
- `Super` -> up
- `Ctrl` -> right

This way I can use muscle memory when using `Ctrl+Shift+arrow left/down/up/right`

The default arrow navigation from UHK is still in place.

### Arrow keys 2/2

Another workaround for using the arrow keys: **Double tap the Mod key** to activate the mod-layer: This
way I don't have to keep the mod-key pressed during Ctrl+Shift+arrow left/down/up/right.

Once Double-Tap for the Mod-Key is activated, it is also indicated on the keyboard, which is nice!

Surprisingly, this is easier to use than the previouse solution.

### Mouse (Caps Lock)

By default, the Caps-Lock key is the Mouse Modifier.

Being able to control the mouse using the keyboard is a nice feature.
But, I don't need it.

I duplicated the `Super` key (aka Windows-Key) to the `Mouse` key.
And moved the `Mouse` function to the right `Shift` key, because I have never used that key.

Having the tabs-lock aka `Mouse` key behave like the `Super` key is great when working with a tiling
window manager like [i3wm](https://i3wm.org/) or [swaywm](https://swaywm.org/).

## Summary

I am 100% satisfied with this keyboard.

The defaults are great, and the leftover painpoints will be mapped somehow!

If you have the chance: go for it!

And if you have any tipps for me: I'm all ears!

You can find my the configs described in this post at:
https://github.com/draptik/dotfiles/tree/master/uhk-configs

