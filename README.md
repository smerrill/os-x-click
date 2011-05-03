# Attribution

This code is based on an anonymous contribution at http://hints.macworld.com/article.php?story=2008051406323031.

It was updated by Steven Merrill to compile without deprecation warnings on Mac OS X 10.6.

# About

This program is a slightly updated version of the code at http://hints.macworld.com/article.php?story=2008051406323031.

It will build a "click" binary that can be used inside of AppleScripts (and the like) to click the mouse under Mac OS X.

# Building the code

I plan to make a Makefile, but for now, ```gcc -o click click.m -framework ApplicationServices -framework Foundation```.

# Usage

```click -x [x coordinate] -y [y coordinate]```

If no value is specified, 0 will be used.

