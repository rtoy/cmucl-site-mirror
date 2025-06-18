SRCS = architecture.texi \
	back.texi \
	compiler-overview.texi \
	compiler.texi \
	debugger.texi \
	design.texi \
	environment.texi \
	fasl.texi \
	front.texi \
	glossary.texi \
	interface.texi \
	interpreter.texi \
	lowlev.texi \
	middle.texi \
	object.texi \
	retargeting.texi \
	run-time.texi

# Where to find our texinfo.tex file
TEXIN = TEXINPUTS=..:$$TEXINPUTS

design.pdf : $(SRCS)
	$(TEXIN) $(MAKEINFO) --pdf design.texi

design.info : $(SRCS)
	$(TEXIN) $(MAKEINFO) --info design.texi

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

design.html : $(SRCS)
	$(TEXIN) $(MAKEINFO) --no-split --html $(TEXIOPTS) design.texi

design_html/index.html :  $(SRCS)
	$(TEXIN) $(MAKEINFO) --html $(TEXIOPTS) design.texi

PUBDIR = ../../gen/docs/internals

$(PUBDIR) :
	mkdir -p $@

$(PUBDIR)/html :
	mkdir -p $@

all : design.pdf design.info design.html design_html/index.html

install : all $(PUBDIR) $(PUBDIR)/html
	cp -r design.info* $(PUBDIR)
	cp -r design_html/* $(PUBDIR)/html
	cp design.pdf $(PUBDIR)
	cp design.html $(PUBDIR)

clean : 
	$(RM) design.info* design.pdf design.html design.?? design.??s
	$(RM) -r design_html
