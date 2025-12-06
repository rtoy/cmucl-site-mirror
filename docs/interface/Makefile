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
CSS=--css-ref=/manual.css
SHOW_TITLEPAGE=-c NO_TOP_NODE_OUTPUT=1

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

%.html : %.texi
	$(TEXIN) $(MAKEINFO) --no-split --html $(TEXIOPTS) $^

toolkit_html/index.html : toolkit.texi
	$(TEXIN) $(MAKEINFO) --html $(TEXIOPTS) $^

internals_html/index.html : internals.texi
	$(TEXIN) $(MAKEINFO) --html $(TEXIOPTS) $^

# Build html, both single-page and multi-page.
html : internals.html toolkit.html internals_html/index.html toolkit_html/index.html

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
