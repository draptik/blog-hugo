---
date:  2009-05-26T20:50:47
slug: "problem-upgrading-vmware-tools-because-of-jit-debugger-solved"
aliases: [/blog/2009/05/26/problem-upgrading-vmware-tools-because-of-jit-debugger-solved]
title: Problem upgrading VMware Tools (because of JIT-Debugger) solved
categories: ["linux"]
draft: false
---

After resurrecting an old VMware installation (I started with the first freely available version of VMware.. version 1) and upgrading successfully (see this [post](http://draptik.wordpress.com/2009/05/26/ubuntu-9-04-with-vmware-server-2-0-1-156745/)), I was not able to update Vmware Tools within my guest OS (Windows XP SP3). I tried the automatic update option as well as the interactive update option. Both resulted in Visual Studio's JIT (Just-In-Time) Debugger complaining and aborting the upgrade (on the guest OS).

**Solution**: Within the guest OS (WindowsXP in my case), uninstall VMware Tools and restart the guest OS. After restarting the guest OS the VMware UI "VMware Tools"-section will have changed from "Upgrade VMware Tools" to "Install VMware Tools". Clicking the latter installed a fresh version of VMware tools without any problems.

This worked with VMware-server-2.0.1-156745 in combination with host OS Ubuntu 9.04 and guest OS Windows XP SP3.
