[![pipeline status](https://gitlab.common-lisp.net/cmucl/cmucl-site/badges/master/pipeline.svg)](https://gitlab.common-lisp.net/cmucl/cmucl-site/commits/master)

This repository holds the CMUCL web site at
[common-lisp.net/project/cmucl](http://common-lisp.net/project/cmucl),
which is also mirrored at [www.cmucl.org](http://www.cmucl.org) and at
[www.cons.org/cmucl](http://www.cons.org/cmucl).  .

## How to Update

When changes are committed, the CI pipeline will automatically update
all of the html pages and the documentation.  The html pages are
available at
[https://common-lisp.net/project/cmucl](https://common-lisp.net/project/cmucl).
From here, cron jobs on www.cmucl.org and www.cons.org run a
periodic rsync to update the web pages with these pages.  The updated
pages should be available in 15 minutes or so (cmucl.org) and no more
than a day (cons.org).  This includes the user manuals.

However, if you want to preview the changes before committing them,
first, check out the cmucl-site repo.  Edit the desired pages, and
either use a web server to serve the pages or just load up the html
file directly in a browser.

To update the user manuals, run `make all` in one of the directories
in `docs` to create the pdf version, the html version and the texinfo
version.
