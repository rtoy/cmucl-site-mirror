---
layout: default
title: "Projects: improvements to CMUCL"
nav_active: projects
heading_bold: "Projects"
heading_rest: "improvements to CMUCL"
---

Here is a (partial) list of projects which are either underway, or would be
useful to CMUCL users. Please join the cmucl-imp
[mailing list]({{ '/support.html' | relative_url }}) if you are interested
in contributing to one of these projects. For the most current list, see the
[CMUCL GitLab Wiki](https://gitlab.common-lisp.net/cmucl/cmucl/-/wikis/projects).

- Searching for, and resolving, any remaining divergences from the ANSI Common
  Lisp specification. The ansi-test suite in [CLOCC](http://clocc.sf.net/), and
  the test suite included with the GCL source code, are useful for this.
- Peter Van Eynde is working on changing CMUCL's memory management so that it
  can allocate memory lazily, thus overcoming the overcommiting problem on
  recent linux kernels.
- Cross-compile from an ANSI Common Lisp: Bill Newman has developed a
  derivative of CMUCL called
  [Steel Bank Common Lisp](http://sbcl.sourceforge.net/) which is able to
  cross-compile itself from an arbitrary Common Lisp implementation.
- Reviving the HPPA port.
- **win32 port**: a few people investigated the possibility of using the POSIX
  emulation layer provided by the cygwin32 tools to port CMUCL to win32. A
  native port would be more useful. The primary issues to resolve are memory
  management and signal handling.
- Add 64-bit support. CMUCL currently only works with 32 bit addresses, even
  on platforms like UltraSPARC which could support 64-bit applications.
  Raymond Toy is thinking about how to approach this problem.
- Add a peephole optimizer to the CMUCL assembler, to remove useless bits of
  the instruction stream.
- Porting multiprocessing to other platforms than x86. This requires knowledge
  of assembly and of the internals of CMUCL.
- Write a soft-real-time garbage collector for CMUCL, for applications such as
  games where bounded response time is very important.
- Improving Garnet: the Garnet user-interface toolkit is no longer maintained
  by the CMU Interfaces group which developed it. Fred Gilham is looking after
  this.
- Allow PCL to emit LAP bytecode, instead of calling the compiler at runtime.
  This would allow small CLOS-enabled CMUCL images to be built.
- The [McCLIM project](http://mcclim.cliki.net/) aims to produce a free version
  of the CLIM user-interface specification.
- A port to the [Flux OSKit](http://www.cs.utah.edu/flux/oskit/), to produce
  CMUCL-OS.
