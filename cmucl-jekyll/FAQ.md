---
layout: default
title: "FAQ: Questions and Answers"
nav_active: FAQ
heading_bold: "FAQ"
heading_rest: "Questions and Answers"
---

Please read these before asking questions on the cmucl-help and
cmucl-imp mailing lists. Additional questions and answers can be sent
to the webmasters (see email address in footer).

1. **Q**: How do I turn off these GC messages?

   ```
   [GC threshold exceeded with 10,411,328 bytes in use.  Commencing GC.]
   [GC completed with 990,320 bytes retained and 9,421,008 bytes freed.]
   [GC will next occur when at least 8,990,320 bytes are in use.]
   ```

   **A**: Add `(setq ext:*gc-verbose* nil)` to your `~/.cmucl-init`
   initialization file. See the *CMUCL User's Manual* for more information
   on tuning the garbage collector.

2. **Q**: Why does CMUCL say `Warning: Declaring foo special`?

   **A**: This happens when you have used `SETQ` on an undeclared variable
   at the top level. The default behaviour of CMUCL in this situation is to
   [declare the variable special](http://www.lispworks.com/documentation/HyperSpec/Body/d_specia.htm)
   (transforming it from a lexically bound variable to a dynamically bound
   variable). The variable `ext:*top-level-auto-declare*` allows you to
   control this behaviour.

3. **Q**: How do I compile my Lisp program to an executable?

   **A**: CMUCL does not, in general, support delivery as an executable.
   The standard way of delivering a Common Lisp application with CMUCL is
   to dump an image containing all your application code (see the
   [*CMUCL User's Manual*](https://cmucl.org/docs/cmu-user/html/index.html)
   for details), and deliver a tarball containing this image, the lisp
   runtime, and a shell script which launches the runtime with your image
   (see the `sample-wrapper` distributed with CMUCL for guidance).
   Also see the following [hint on making Lisp files executable](https://cmucl.org/doc/executable.html).

   However, on Linux and FreeBSD x86 platforms, CMUCL can actually produce
   an executable. This is done by specifying `:executable t` option for
   `save-lisp`. The executable file contains the current entire core image
   and runtime. See the section *Saving a Core Image* in the
   [*CMUCL User's Manual*](https://cmucl.org/docs/cmu-user/html/index.html)
   for more information.

4. **Q**: Why does CMUCL say it's called Python 1.1 when it starts up?
   Isn't that the name of a scripting language?

   **A**: The CMUCL native code compiler is called Python. This use of the
   name predates the existence of that other scripting language.

   On the history of the name, Rob MacLachlan says:

   > Scott Fahlman said that he wanted a really smart compiler that would
   > digest your program the way a Python digests a pig...

   Scott Fahlman says he:

   > thought Python was a good name because a compiler is a long pipeline.
   > A pig goes in one end, the snake goes off to rest under a bush for a
   > surprisingly long time, the pipeline does its thing, and a compact
   > little pellet eventually comes out the other end.

5. **Q**: How do I report a bug in CMUCL?

   **A**: Send an email describing the problem to the cmucl-help or
   cmucl-imp mailing lists (see the [Support page]({{ '/support.html' | relative_url }})
   for more information). Make sure you include the version of CMUCL you
   are using, the platform, and your `*features*`. Try to find the smallest
   input file that provokes the problem.

6. **Q**: How does CMUCL compare with other Common Lisp implementations?

   **A**: Compared with the various commercial implementations, CMUCL is
   free with a very liberal license. Compared with
   [CLISP](https://clisp.cons.org/), CMUCL runs on fewer platforms but is
   an order of magnitude faster on most applications since it compiles to
   native code. Compared with [SBCL](https://sbcl.sf.net/) (a fork from
   CMUCL), CMUCL has a faster compiler but compiled code runs at similar or
   slower speed.

7. **Q**: What user interface do you use with CMUCL?

   **A**: Many people like to use [SLIME](https://common-lisp.net/project/slime/) in Emacs.

8. **Q**: How difficult is it to port CMUCL to a new platform?

   **A**: Short answer: fairly difficult. There are two aspects to porting:
   writing a backend for the new CPU architecture, and handling the
   runtime's interaction with the operating system.

9. **Q**: The garbage collector doesn't want to collect my big object!

   **A**: The read-eval-print-loop maintains variables called `*`, `**` and
   `***` that reference the values of the last three forms evaluated. Try
   evaluating a few other forms (like `1`), then call the garbage collector
   again.

10. **Q**: Where can I hang out with CMUCL folks on IRC?

    **A**: Try the `#lisp` channel on the [freenode network](https://freenode.net/).

11. **Q**: CMUCL leaks too much stuff from the compile-time environment
    to the evaluation environment!

    **A**: You may encounter this problem when porting code written for
    CMUCL to another Common Lisp implementation. The portable way to write
    compile-time constants is:

    ```common-lisp
    (eval-when (:compile-toplevel :load-toplevel)
      (defconstant +foo+ #\a))
    (defun foo ()
      #.(char-code +foo+))
    ```

12. **Q**: What is the meaning of the error message I see when tracing
    functions: `:FUNCTION-END breakpoints are currently unsupported for
    the known return convention`?

    **A**: This is a deficiency in the tracing support that has been fixed.
    A simple workaround is to use:

    ```common-lisp
    USER> (trace my-function :encapsulate t)
    ```

13. **Q**: On my Linux machine, CMUCL dies on startup saying

    ```
    Error in allocating memory, please do "echo 1 > /proc/sys/vm/overcommit_memory"
    or get more memory+swap.
    ```

    **A**: CMUCL reserves a large address space when it starts up. You can
    either increase the amount of swap available (see the `mkswap` command),
    or change the kernel's overcommit policy using (as root) the command
    quoted above.
