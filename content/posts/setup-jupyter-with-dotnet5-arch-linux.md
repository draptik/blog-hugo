---
title: "How to setup Jupyter with dotnet 5 on Arch Linux in 2021"
date: 2021-02-26T22:02:59Z
draft: false
---

Jupyter "Notebooks" are an interesting way of documenting / teaching code interactively. Jupyter has
extended their plattform for other languages (it was originally conceived for Python).
See [this microsoft anouncement from 2020-06 for dotnet core integration](https://devblogs.microsoft.com/dotnet/f-5-and-f-tools-update-for-june/).

This posts describes how to setup JupyterLab on Arch Linux for usage with F#.

Terminology: "JupyterLab" seems to be the successor of "Jupyter Notebooks". See https://stackoverflow.com/questions/50982686/what-is-the-difference-between-jupyter-notebook-and-jupyterlab for details.

## Setup

I use [`yay`](https://github.com/Jguer/yay) as `pacman` wrapper. It also installs AUR packages.

- install Jupyter Lab: `yay -S jupyterlab`
    - check that jupyter is installed correctly: `jupyter kernelspec list` should output 
        `python3 <some-path>/python3`
- install dotnet-interactive
    - `dotnet tool install --global Microsoft.dotnet-interactive`
    - `dotnet interactive jupyter install`
    - start Jupyter Lab: `jupyter lab`. You should see the newly added .NET plugins (called "kernels" in the Jupyter context) available:
      ![launcher dashboard showing dotnet in notebook and console section](/images/posts/jupyter-setup/jupyter-with-dotnet5.png)

## Simple test

Kill any previously running sessions with `Ctrl-C`. And switch to a newly created folder (for example
`~/tmp/demo`. Now restart `jupyter lab`.

I'll skip the "click here, then there" part...

![click on dotnet f#](/images/posts/jupyter-setup/step1.png)
![display empty notebook](/images/posts/jupyter-setup/step2.png)
![enter simple f# assingment](/images/posts/jupyter-setup/step3.png)
![highlight execute current block](/images/posts/jupyter-setup/step4.png)
![show result](/images/posts/jupyter-setup/step5.png)

We are all set for jupyter with F#!


