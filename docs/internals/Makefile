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
#TEXI_INIT=--init-file=../texi2html.init
CSS=--css-ref=/manual.css

# Set up highlighting depending on how the variable HILIITE is set.
# We also set the texi init file that supports the given scheme.
# Eventually, this should all go away so that we only use one scheme
# for highlighting the docs.
#
# See https://www.gnu.org/software/texinfo/manual/texinfo/html_node/Syntax-Highlighting.html
ifeq ($(HILITE),source-highlight)
  # Light mode is the default.  There's a dark mode, but apparently you can't have both.
  HILITE_STYLE=--set-customization-variable HIGHLIGHT_SYNTAX=source-highlight
  TEXIINIT=../texi2html.init
else ifeq ($(HILITE),pygments)
  # Light mode is the default.  There's a dark mode, but apparently
  # you can't have both since the styles are inline, so you can't
  # adjust them.
  HILITE_STYLE=--set-customization-variable HIGHLIGHT_SYNTAX=pygments
  TEXIINIT=../texi2html.init
else ifeq ($(HILITE),custom-pygments)
  # Like pygments, but we can use choose our own CSS settings for the
  # highlighting style.  This allows both light and dark modes.
  HILITE_STYLE=--set-customization-variable HIGHLIGHT_SYNTAX='pygmentize -f html -O classprefix=pyg- -l %l'
  TEXIINIT=../texi2html.init.custom-pygments
else ifeq ($(HILITE),highlight)
  # Light mode is the default.  You can have a dark mode, but not both
  # light and dark.  Styles are inlined.
  HILITE_STYLE=--set-customization-variable HIGHLIGHT_SYNTAX=highlight
  TEXIINIT=../texi2html.init
else
  # If HILITE is not given, we default to using highlightjs.  Both
  # light and dark mode are available.
  HILITE_STYLE=
  TEXIINIT=../texi2html.init.highlightjs
endif

TEXIOPTS= $(WORDS_IN_PAGE) --init-file=$(TEXIINIT) $(SHOW_TITLEPAGE) $(CSS) $(HILITE_STYLE)

design.html : $(SRCS)
	$(TEXIN) $(MAKEINFO) --no-split --html $(TEXIOPTS) design.texi

design_html/index.html :  $(SRCS)
	$(TEXIN) $(MAKEINFO) --html $(TEXIOPTS) design.texi

# Build html, both single-page and multi-page.
html : design_html/index.html design.html

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
