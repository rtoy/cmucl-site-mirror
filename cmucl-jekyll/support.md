---
layout: default
title: "Support: mailing list & help for CMUCL users"
nav_active: support
heading_bold: "Support"
heading_rest: "mailing list & help for CMUCL users"
---

CMUCL is supported by a number of **mailing lists** at cons.org, running under
Listar. **Please don't send subscribe requests to the list addresses**, since
they won't be seen by the mailing list software and will only annoy the
subscribers. Always use the appropriate `-request` address.

cmucl-announce
: A low-volume mailing list, reserved for announcements such as new releases,
  new ports, important patches or other resources closely related to CMUCL. No
  discussion should happen on this list. This mailing list will be moderated
  when necessary.

  Send email to <cmucl-announce-request@cons.org> to be added or removed from
  the list (using a subject of `subscribe` or `unsubscribe` and an empty body)
  and to <cmucl-announce-human-request@cons.org> in case the former doesn't work.

cmucl-imp
: A mailing list for technical discussion of implementation-specific issues,
  like ports to new platforms, bug fixes, new features, design of APIs or ports
  of major third-party packages to CMUCL.

  Send email to <cmucl-imp-request@cmucl.cons.org> to be added or removed from
  the list (using a subject of `subscribe` or `unsubscribe` and an empty body)
  and to <cmucl-imp-human-request@cons.org> in case the former didn't work.

cmucl-help
: A mailing list to ask for help in setting up and using CMUCL. Posters should
  read the [*CMUCL User's Manual*](https://cmucl.org/docs/cmu-user/html/index.html)
  prior to using this list. Otherwise it is open to every question related to
  CMUCL. For bug reports, please try out the latest release to see whether your
  problem has been fixed, and please read this guide on
  [How to Report Bugs Effectively](http://www.chiark.greenend.org.uk/~sgtatham/bugs.html),
  if you haven't already done so.

  Help requests related to rebuilding CMUCL and applying patches may be sent to
  *cmucl-imp* also. Problems related to compiler optimization are probably better
  reported to *cmucl-imp*, but please make sure your post is about a specific
  situation with a proper description.

  Experienced CMUCL users are encouraged to join this list and help new users.

  Send mail to <cmucl-help-request@cmucl.cons.org> to be added or removed from
  the list (using a subject of `subscribe` or `unsubscribe` and an empty body)
  and to <cmucl-help-human-request@cons.org> in case the former doesn't work.

cmucl-cvs
: A mailing list that receives notifications of commits to the CMUCL git tree.
  This is intended primarily for developers, but may be of interest to users who
  wish to follow development. There is also an
  [archive](http://common-lisp.net/pipermail/cmucl-cvs/) of the commit messages.
  This archive only has messages starting from Sept, 2010, however.

The *cmucl-help* and *cmucl-imp* mailing lists are available over NNTP, through
the [Gmane mail-to-news gateway](http://news.gmane.io/), respectively as the
groups [gmane.lisp.cmucl.general](news://news.gmane.io/gmane.lisp.cmucl.general)
and [gmane.lisp.cmucl.devel](news://news.gmane.io/gmane.lisp.cmucl.devel).
Gmane also allows you to search the post-2002 archives of these two lists.

To avoid spam reaching the lists, please do not post their addresses to USENET
or public web pages. You can post a link to this URL instead, or reference the
`-request` addresses instead.

If you want to send **MIME attachments** with your message, make sure you use
one of the `text/*` Content-Types (for example `text/plain`), otherwise the
mailing list software will strip out the attachment.

## Commercial support

There is no formal commercial support structure for CMUCL. However, some of the
CMUCL developers may be available on an individual basis for consulting, for
example to implement new features or help in porting a particular application.
Please email the cmucl-imp list with details of your requirements.

## Newsgroups

The USENET newsgroup [comp.lang.lisp](news:comp.lang.lisp) is related to Common
Lisp. You may wish to read its
[current FAQ](http://www-jcsu.jesus.cam.ac.uk/~csr21/lispfaq.html), or its
[older FAQ](http://www.cis.ohio-state.edu/hypertext/faq/bngusenet/comp/lang/lisp/top.html).

## Bug Tracking

To report bugs, you may use [CMUCL Issues](https://gitlab.common-lisp.net/cmucl/cmucl/issues).
Due to spam, you will need to get an account to be able to submit bugs. Sorry
about that. Alternatively, please feel free to submit bug reports to the mailing
lists. However, bug reports won't get lost if you submit them to the issue tracker.
