---
layout: default
title: "Benchmarks: CMUCL performance"
nav_active: benchmarks
heading_bold: "Benchmarks"
heading_rest: "CMUCL performance"
---

CMUCL features a sophisticated native-code compiler which is capable of
powerful type inferences, and generates code competitive in speed with C
compilers. Its generational garbage collector and multiprocessing capability
on x86 ports contribute to its high performance profile.

For current benchmark comparisons with other Common Lisp implementations,
please see the
[CMUCL wiki](https://gitlab.common-lisp.net/cmucl/cmucl/-/wikis/Benchmarks).

Some general points about CMUCL performance:

- CMUCL compiles to native machine code, making it an order of magnitude
  faster than bytecode-based implementations such as CLISP on most applications.
- The Python compiler performs extensive type inference, allowing it to generate
  tight, efficient code when type declarations are provided.
- Compared with [SBCL](https://sbcl.sf.net/), CMUCL has a faster compiler,
  but compiled code runs at a similar or sometimes slower speed.
- The mathematical primitives in CLISP are very fast, in particular its bignum
  operations, which may outperform CMUCL in numeric-intensive code.
- CMUCL supports native double-double floats giving approximately 106 bits
  (32 digits) of precision, which is useful for high-precision arithmetic.

Further information:

- [Chapter 5.16 of the *CMUCL User's Manual*](https://cmucl.org/docs/cmu-user/html/Profiling.html#Profiling)
  on timing and benchmarking.
- [Ken Anderson's performance page](http://openmap.bbn.com/~kanderso/performance/).
- [Benchmarking Implementations of Functional Languages with Pseudoknot](http://citeseer.nj.nec.com/4555.html).
