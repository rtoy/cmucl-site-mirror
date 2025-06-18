# Where to find our texinfo.tex file
TEXIN = TEXINPUTS=..:$$TEXINPUTS

%.pdf : %.texi
	$(TEXIN) $(MAKEINFO) --pdf $^

%.info : %.texi
	$(TEXIN) $(MAKEINFO) --info $^

# Options for the HTML versions
#
# WORDS_IN_PAGE: smaller so the bottom navbar shows up more often on
#   short pages.  Useful for mobile devices.  (Value experimentally
#   determined by looking at short pages on mobile device.)
#
# TEXI_INIT: For the html files, use ../texi2html.init to enable
# syntax highlighting of the lisp examples.
# CSS: CSS file to highlight example blocks nicely.
#
WORDS_IN_PAGE=--set-customization-variable WORDS_IN_PAGE=200
TEXI_INIT=--init-file=../texi2html.init
CSS=--css-include=../manual.css

TEXIOPTS= $(WORDS_IN_PAGE) $(TEXI_INIT) $(CSS)

%.html : %.texi
	$(TEXIN) $(MAKEINFO) --no-split --html $(TEXIOPTS) $^

toolkit_html/index.html : toolkit.texi
	$(TEXIN) $(MAKEINFO) --html $(TEXIOPTS) $^

internals_html/index.html : internals.texi
	$(TEXIN) $(MAKEINFO) --html $(TEXIOPTS) $^

PUBDIR = ../../gen/docs/interface

$(PUBDIR)/internals :
	mkdir -p $@

$(PUBDIR)/internals/html :
	mkdir -p $@

$(PUBDIR)/toolkit :
	mkdir -p $@

$(PUBDIR)/toolkit/html :
	mkdir -p $@

all: toolkit-all internals-all

toolkit-all : toolkit.pdf toolkit.info toolkit.html toolkit_html/index.html

internals-all : internals.pdf internals.info internals.html internals_html/index.html

install-toolkit : $(PUBDIR)/toolkit $(PUBDIR)/toolkit/html toolkit-all
	cp -r toolkit.info* $(PUBDIR)/toolkit
	cp -r toolkit_html/* $(PUBDIR)/toolkit/html
	cp toolkit.pdf $(PUBDIR)/toolkit
	cp toolkit.html $(PUBDIR)/toolkit

install-internals : $(PUBDIR)/internals $(PUBDIR)/internals/html internals-all
	cp -r internals.info* $(PUBDIR)/internals
	cp -r internals_html/* $(PUBDIR)/internals/html
	cp internals.pdf $(PUBDIR)/internals
	cp internals.html $(PUBDIR)/internals

install : install-toolkit install-internals

clean :
	$(RM) internals.info* internals.pdf internals.html internals.?? internals.??s
	$(RM) -r internals_html
	$(RM) toolkit.info* toolkit.pdf toolkit.html toolkit.?? toolkit.??s
	$(RM) -r toolkit_html
