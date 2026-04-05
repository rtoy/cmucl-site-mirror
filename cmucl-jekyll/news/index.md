---
layout: default
title: "News"
heading_bold: "News"
heading_rest: ""
nav_active: news
---

For the latest and most up-to-date news, also look at [CMUCL Wiki](https://gitlab.common-lisp.net/cmucl/cmucl/wikis/home).

**Snapshot 2012-10**
: The [2012-10 snapshot](https://cmucl.org/downloads/snapshots/2012/10/)
  has been released. See the [release notes](https://cmucl.org/downloads/snapshots/2012/10/release-20d.txt)
  for details, but here is a quick summary of the changes between this
  snapshot and the previous snapshot.

  - `READ-CYCLE-COUNTER` no longer destroys any live values in the `EDX` or `ECX` registers.
  - Add `VM::WITH-CYCLE-COUNTER` to return the number of ticks elapsed when
    executing the body. The number of ticks is the number of CPU cycles, except
    for ppc/darwin.

**Snapshot 2012-09**
: The [2012-09 snapshot](https://cmucl.org/downloads/snapshots/2012/09/)
  has been released. See the [release notes](https://cmucl.org/downloads/snapshots/2012/09/release-20d.txt)
  for details, but here is a quick summary of the changes between this
  snapshot and the previous snapshot.

  - ASDF2 updated to version 2.24.
  - Add microoptimization of `2*x` and `x/(2^n)` when `x` is a float and `n` is an integer.
  - Fixed a minor build issue in the CLM debugger.

Snapshot 2012-08
: The [2012-08 snapshot](https://cmucl.org/downloads/snapshots/2012/08/)
  has been released. See the [release notes](https://cmucl.org/downloads/snapshots/2012/08/release-20d.txt)
  for details, but here is a quick summary of the changes between this
  snapshot and the previous snapshot.

  - ASDF2 updated to version 2.23.
  - CMUCL can now be compiled correctly with clang.
  - Fixed a possible stack corruption bug on x86 when calling from C into lisp.
  - Support for Mac OSX 10.4 and earlier has been dropped. (Lack of developer
    access to such machines.)

Snapshot 2012-07
: The 2012-07 snapshot has been released. See the [release notes](https://cmucl.org/downloads/snapshots/2012/07/release-20d.txt)
  for details, but here is a quick summary of the changes between this
  snapshot and the previous snapshot.

  - ASDF2 updated to version 2.22.
  - Minor internal changes to support building with clang, which doesn't yet
    work as expected.

Snapshot 2012-06
: The 2012-06 snapshot has been released. See the [release notes](https://cmucl.org/downloads/snapshots/2012/06/release-20d.txt)
  for details, but here is a quick summary of the changes between this
  snapshot and the previous snapshot.

  - Implement faster `LOGCOUNT` function on x86, if `:SSE3` feature is available.
  - On x86, `SET-FLOATING-POINT-MODES` clears any current and accrued exceptions
    that match exceptions in `:TRAPS`. This now matches how ppc and sparc behave.

Snapshot 2012-05
: The 2012-05 snapshot has been released. See the release notes for details,
  but here is a quick summary of the changes between this snapshot and the
  previous snapshot.

  - ASDF2 updated to version 2.21.
  - Many additional aliases for external formats added that match the glibc iconv aliases.
  - External format for UTF-32 was generating an error when converting octets to a string.
  - The UTF-16-BE and UTF-16-LE external formats were returning the incorrect number
    of octets when surrogate pairs were decoded.
  - Fix typo in ISO8859-2 external format that caused it not to work correctly.
  - Fix [ticket:58](http://trac.common-lisp.net/cmucl/ticket/58): UTF-16 buffering problem.

Snapshot 2012-04
: The 2012-04 snapshot has been released. See the [release notes](https://cmucl.org/downloads/snapshots/2012/04/release-20d.txt)
  for details, but here is a quick summary of the changes between this
  snapshot and the 20c release.

  - Added a new contrib, `contrib-packed-sse2` to allow packed SSE2 operations.
  - Some VOP costs were incorrect which prevented the fast complex double-float
    multiplier from being used when sse3 is available.
  - Add micro-optimization for x86 where `(logand <signed-byte 32> #xffffffff)`
    generates a register move instead of and'ing with #xffffffff.
  - Updated to Unicode 6.1.0.
  - `LISP:UNICODE-COMPLETE` no longer signals an error if the prefix isn't a
    prefix of the name of any Unicode character.
  - Add `-R` option to build.sh to force recompiling the C runtime.
  - UTF-8 is now built into the core and always available.
  - A bug in `UNICODE-COMPLETE-NAME` has been fixed.
  - An issue with blocked signals after an interrupt has been fixed.
  - The ppc port has been revived; only a Unicode version is currently available.
  - CMUCL was not printing pathnames like `(make-pathname :directory '(:absolute "tmp" "" "/"))`
    correctly. This is now printed using `#P(...)`.
  - The directory structure has been changed.
  - ASDF2 updated to version 2.019.
  - Behavior of `STRING-TO-OCTETS` has changed. This is an incompatible change
    but should be more useful when a buffer is given which is not large enough
    to hold all the octets for the given string. See docstring for more details.
  - `DECODE-FLOAT` was not correctly declared and could not be compiled to handle
    double-double-floats.

**20c released**
: CMUCL 20c has been released. For information on the changes between 20c and
  20b, we refer the reader to the [20c release notes](http://trac.common-lisp.net/cmucl/wiki/ReleaseNotes20c).
  Because of the release, there will not be a 2011-11 snapshot.

2011-09-20
: The CMUCL CVS repository has been converted to git and is now available.
  You can [browse the source](http://trac.common-lisp.net/cmucl/browser), or
  visit [CMUCL gitweb](http://common-lisp.net/gitweb?p=projects/cmucl/cmucl.git;a=summary;js=1)
  for a different view.

  Git is integrated with Trac so commit messages can refer to and close Trac
  tickets using text like `close #1`, `fix #1, #2`, or `refs ticket:1`.

  The available commands (not case-sensitive) are:

  - **close, closed, closes, fix, fixed, fixes** — the specified issues are
    closed with the commit message added to them.
  - **references, refs, addresses, re, see** — the specified issues are left
    in their current status but the commit message is added to their notes.

Snapshot 2011-09
: The 2011-09 snapshot has been released. See the release notes for details,
  but here is a quick summary of the changes between this snapshot and the
  previous snapshot.

  - ASDF2 updated to version 2.017.
  - Improve type propagation for `LOAD-TIME-VALUE`.
  - Getting documentation of a structure via `DOCUMENTATION` no longer signals an error.
  - Reduce unnecessary consing of `SAP`s in `ROOM`.
  - Make stack overflow checking actually work on Mac OS X.
  - Fix rounding of numbers larger than a fixnum.

Snapshot 2011-07
: The 2011-07 snapshot has been released. See the release notes for details,
  but here is a quick summary of the changes between this snapshot and the
  previous snapshot.

  - Unicode database updated to Unicode 6.0.0.
  - ASDF2 updated to version 2.016.1.
  - Add `LISP:LOAD-ALL-UNICODE-DATA` to load all the unicode information into
    core. Useful for creating an executable image that does not need unidata.bin.
  - CMUCL no longer exits if you specify a core file with an executable image.
    A warning is printed instead and the core file is used.
  - [Trac #43](http://trac.common-lisp.net/cmucl/ticket/43) has been fixed in
    a better way. The previous fix was incorrect and caused some Unicode tests to fail.

Snapshot 2011-06
: The 2011-06 snapshot has been released. See the release notes for details,
  but here is a quick summary of the changes between this snapshot and the
  previous snapshot.

  - `:CMUCL` is now in `*FEATURES*`.
  - Added command line option `-unidata` to allow user to specify the location
    and name of the unidata.bin file.
  - Opening a file with `:IF-EXISTS :NEW-VERSION` no longer causes an error if
    the file name contains `[`.

Snapshot 2011-05
: Due to the upgrade on common-lisp.net, no snapshot is available for this month.

Snapshot 2011-04
: The 2011-04 snapshot has been released. See the release notes for details,
  but here is a quick summary of the changes between this snapshot and the
  previous snapshot.

  - In `COMPILE-FILE`, the second return value is now non-nil if there are
    style warnings. Previously, style warnings were erroneously ignored.
  - ASDF has been updated to version 2.014.1.

Snapshot 2011-03
: The 2011-03 snapshot has been released. See the release notes for details,
  but here is a quick summary of the changes between this snapshot and the
  previous snapshot.

  - In `COMPILE-FILE`, the `:OUTPUT-FILE` can also be a stream.
    CMUCL was erroneously signaling an error.
  - `(OPEN f :DIRECTION :IO :IF-DOES-NOT-EXIST NIL)` no longer signals an
    error if the file `f` does not exist. It returns `NIL` now.
  - In some situations the compiler could not constant fold `SQRT` calls
    because `KERNEL:%SQRT` was not defined on x86 with SSE2. This is fixed.
  - A bug was introduced where cmucl could no longer read
    `#\latin_small_letter_a`. This is fixed in this version.

Snapshot 2011-02
: The 2011-02 snapshot has been released. See the release notes for details,
  but here is a quick summary of the changes between this snapshot and the
  previous snapshot.

  - `EXT::DESCRIBE-EXTERNAL-FORMAT` was not exported.
  - `TRACE` was erroneously allowing encapsulation when tracing local
    flet/labels functions. An error is now signaled in this case. You can
    specify `:ENCAPSULATE NIL` to disable encapsulation.

Snapshot 2011-01
: The 2011-01 snapshot has been released. See the release notes for details,
  but here is a quick summary of the changes between this snapshot and the
  previous snapshot.

  - Initial support for Solaris/x86.
  - `UNINTERN` no longer removes the wrong symbol.
  - `DEFSTRUCT` allows multiple keyword constructors as required by the spec.
  - `SUBSEQ` with an end index less than the start index now signals an error.
  - Localization support was causing many calls to stat trying to find
    non-existent translation files. This has been fixed so that the results
    are cached. This change cuts building time by half on Solaris/sparc.
  - On NetBSD, function-end breakpoints, especially for tail-recursive
    functions, are working now.
  - On NetBSD, display of FP numbers (sse2 and x87) during tracing has been
    corrected. Previously, random values were displayed.
  - Executable images can now be created on NetBSD again.

**20b patch 000**
: A critical bug in `REALPART` and `IMAGPART` has been fixed in the 2010-11
  snapshot. A [patch](https://cmucl.org/downloads/release/20b/patches/cmucl-20b-patch-000.tar.gz)
  is provided to fix this issue in the 20b release.
  [Installation](https://cmucl.org/news/install.html) instructions are available.

**CMUCL 20b released**
: CMUCL 20b has been released. For information on the changes between 20b and
  20a, we refer the reader to the [20b release notes](https://cmucl.org/news/news/release-20b.txt).

Also see older news:

- [news items from 2011]({{ '/news/2011.html' | relative_url }})
- [news items from 2010]({{ '/news/2010.html' | relative_url }})
- [news items from 2009]({{ '/news/2009.html' | relative_url }})
- [news items from 2008]({{ '/news/2008.html' | relative_url }})
- [news items from 2007]({{ '/news/2007.html' | relative_url }})
- [news items from 2006]({{ '/news/2006.html' | relative_url }})
- [news items from 2005]({{ '/news/2005.html' | relative_url }})
- [news items from 2004]({{ '/news/2004.html' | relative_url }})
- [news items from 2003]({{ '/news/2003.html' | relative_url }})
- [news items from 2002]({{ '/news/2002.html' | relative_url }})
- [news items from 2001]({{ '/news/2001.html' | relative_url }})
