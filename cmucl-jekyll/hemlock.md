---
layout: default
title: "Hemlock: the CMUCL editor"
nav_active: hemlock
heading_bold: "Hemlock"
heading_rest: "the CMUCL editor"
---

**Hemlock** is an extensible Emacs-like text editor embedded in CMUCL. It
follows the tradition of the Lisp Machine editor ZWEI and the ITS/TOPS-20
implementation of Emacs. Hemlock is able to display to a terminal, or use
CLX for X11.

Documentation for Hemlock:

- The Hemlock User's Manual:
  - [HTML version all on one page](https://cmucl.org/docs/hem/user/hemlock-user.html) for online browsing
  - [HTML version on multiple pages](https://cmucl.org/docs/hem/user/html/index.html) for online browsing
  - [PDF (US letter size)](https://cmucl.org/docs/hem/user/hemlock-user.pdf) with embedded hyperlinks
  - [Tarball of the info files](https://cmucl.org/docs/hem/user/hemlock-user-info.tar.bz2) for local use with emacs
- The Hemlock Command Implementor's Manual:
  - [HTML version all on one page](https://cmucl.org/docs/hem/cim/cim.html)
  - [HTML version on multiple pages](https://cmucl.org/docs/hem/cim/html/index.html)
  - [PDF (US Letter size)](https://cmucl.org/docs/hem/cim/cim.pdf)
  - [Tarball of the info files](https://cmucl.org/docs/hem/cim/cim-info.tar.bz2) for local use with emacs
- The original Scribe versions (of historical interest):
  - [Hemlock User's Manual (Postscript)](https://cmucl.org/doc/encycmuclopedia/devenv/user.ps)
  - [Hemlock Command Implementor's Manual (Postscript)](https://cmucl.org/doc/encycmuclopedia/devenv/cim.ps)

### Experimenting with Hemlock

To start experimenting with Hemlock, load the CLX and Hemlock subsystems,
then type `(ed)`. This should open an X11 window for the editor.

```common-lisp
* (require :clx)
* (require :hemlock)
* (ed)
```

The keybindings are similar to GNU Emacs: `M-x` enters the minibuffer, and
`C-x C-f` opens a file for editing. Completion in the minibuffer works with
`#\Space`, not `#\Tab`. Command names are of the form `Find File` rather than
`find-file`. Dired mode is available with `M-x Dired`. To quit Hemlock and
return to the listener, type `C-x C-z`.

For further notes on using Hemlock, see
[CLiki:CloserLookAtHemlock](http://www.cliki.net/CloserLookAtHemlock).

For the latest information on Hemlock, see the
[CMUCL GitLab Wiki](https://gitlab.common-lisp.net/cmucl/cmucl/-/wikis/FAQS/Hemlock).
