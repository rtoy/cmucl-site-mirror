---
layout: default
title: "Home: a high-performance, free Common Lisp implementation"
heading_bold: "Home"
heading_rest: "a high-performance, free Common Lisp implementation"
nav_active: home
---

<div class="notice">
Celebrating 30 years of CMUCL! Thirty years ago in June, Paul Werkowski started working on porting
CMUCL to x86. Many thanks to Paul for getting this all started many years ago!
</div>

CMUCL is a free implementation of the Common Lisp programming language which runs on most major
Unix platforms. It mainly conforms to the ANSI Common Lisp standard. Here is a summary of its main
features:

- Support for static arrays that are never moved by GC but are properly removed when no longer referenced.
- Unicode support, including many of the most common external formats such as UTF-8 and support for handling Unix, DOS, and Mac end-of-line schemes.
- Native double-double floats including complex double-double floats and specialized arrays for double-double floats and complex double-double floats that give approximately 106 bits (32 digits) of precision.
- A **sophisticated native-code compiler** which is capable of powerful type inferences, and generates code competitive in speed with C compilers.
- Generational garbage collection and **multiprocessing capability** on the x86 ports.
- A foreign function interface which allows interfacing with C code and system libraries, including shared libraries on most platforms, and direct access to Unix system calls.
- Support for interprocess communication and remote procedure calls.
- An implementation of CLOS, the Common Lisp Object System, which includes multimethods and a metaobject protocol.
- A graphical source-level debugger using a Motif interface, and a code profiler.
- An interface to the X11 Window System (CLX), and a sophisticated graphical widget library (Garnet).
- Programmer-extensible input and output streams.
- An Emacs-like editor implemented in Common Lisp.
- **Freely redistributable**: free, with full source code (most of which is in the public domain) and no strings attached (and no warranty). Like the GNU/Linux and \*BSD operating systems, CMUCL is maintained and improved by a team of volunteers collaborating over the Internet.

## Latest News

For the most up-to-date info and news, see [CMUCL Gitlab Wiki](https://gitlab.common-lisp.net/cmucl/cmucl/wikis/home).
For older news see [News]({{ '/news/index.html' | relative_url }}).
The old [Trac wiki](https://trac.common-lisp.net/cmucl) is still available but is deprecated in favor of the Gitlab wiki.

<dl>
  <dt>CMUCL 21f released</dt>
  <dd><a href="https://cmucl.org/downloads/release/21f/">CMUCL 21f</a> has been released.
  For information on the changes between 21f and 21e, we refer the reader to the
  <a href="https://gitlab.common-lisp.net/cmucl/cmucl/-/releases/21f">21f release notes</a>.</dd>

  <dt>CMUCL 21e released</dt>
  <dd><a href="https://cmucl.org/downloads/release/21e/">CMUCL 21e</a> has been released.
  For information on the changes between 21e and 21d, we refer the reader to the
  <a href="https://gitlab.common-lisp.net/cmucl/cmucl/-/releases/21e">21e release notes</a>.</dd>

  <dt>CMUCL 21d released</dt>
  <dd><a href="https://cmucl.org/downloads/release/21d/">CMUCL 21d</a> has been released.
  For information on the changes between 21d and 21c, we refer the reader to the
  <a href="https://gitlab.common-lisp.net/cmucl/cmucl/blob/master/src/general-info/release-21d.md">21d release notes</a>.</dd>

  <dt>CMUCL 21c released</dt>
  <dd><a href="https://cmucl.org/downloads/release/21c/">CMUCL 21c</a> has been released.
  For information on the changes between 21c and 21b, we refer the reader to the
  <a href="https://gitlab.common-lisp.net/cmucl/cmucl/blob/master/src/general-info/release-21c.md">21c release notes</a>.</dd>

  <dt>CMUCL 21b released</dt>
  <dd><a href="https://cmucl.org/downloads/release/21b/">CMUCL 21b</a> has been released.
  For information on the changes between 21b and 21a, we refer the reader to the
  <a href="https://gitlab.common-lisp.net/cmucl/cmucl/wikis/Release21b">21b release notes</a>.</dd>

  <dt>CMUCL 21a released</dt>
  <dd><a href="https://cmucl.org/downloads/release/21a/">CMUCL 21a</a> has been released.
  For information on the changes between 21a and 20f, we refer the reader to the
  <a href="https://gitlab.common-lisp.net/cmucl/cmucl/wikis/Release21a">21a release notes</a>.
  Because of the release, there will not be a 2014-10 snapshot.</dd>

  <dt>CMUCL 20f released</dt>
  <dd><a href="https://cmucl.org/downloads/release/20f/">CMUCL 20f</a> has been released.
  For information on the changes between 20f and 20e, we refer the reader to the
  <a href="https://trac.common-lisp.net/cmucl/wiki/Release20f">20f release notes</a>.
  Because of the release, there will not be a 2014-10 snapshot.</dd>

  <dt>CMUCL moves to Gitlab from Trac</dt>
  <dd><a href="https://common-lisp.net">common-lisp.net</a> announced that
  <a href="https://about.gitlab.org">Gitlab</a> would replace the current
  <a href="https://trac.edgewall.org">Trac</a> system. The pages from Trac are slowly being
  migrated to CMUCL's gitlab page.</dd>

  <dt>CMUCL 20e released</dt>
  <dd><a href="https://cmucl.org/downloads/release/20e/">CMUCL 20e</a> has been released.
  For information on the changes between 20e and 20d, we refer the reader to the
  <a href="https://trac.common-lisp.net/cmucl/wiki/Release20e">20e release notes</a>.
  Because of the release, there will not be a 2013-10 snapshot.</dd>
</dl>

## What is Common Lisp?

Common Lisp is well suited to large programming projects and *explorative programming*. The language
has a dynamic semantics which distinguishes it from languages such as C and Ada. It features
automatic memory management, an interactive incremental development environment, a module system, a
large number of powerful data structures, a large standard library of useful functions, a
sophisticated object system supporting multiple inheritance and generic functions, an exception
system, user-defined types and a macro system which allows programmers to extend the language.

> Pascal is for building pyramids -- imposing, breathtaking structures built by armies pushing heavy
> blocks into place. Lisp is for building organisms ...
>
> *Alan Perlis*
