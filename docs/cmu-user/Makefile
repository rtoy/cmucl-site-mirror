SRCS = aliens.texi \
	cmu-user.texi \
	compiler-hint.texi \
	compiler.texi \
	cross-referencing.texi \
	debug-internals.texi \
	debugger.texi \
	extensions.texi \
	hierarchical-packages.texi \
	internet.texi \
	introduction.texi \
	ipc.texi \
	package-locks.texi \
	serve-event.texi \
	simple-streams.texi \
	unicode.texi \
	unix.texi

# Assuming this is GNU tar
TAR ?= tar

# We're assuming this is GNU sed
SED ?= sed
TEXINDEX ?= texindex

# Where to find our texinfo.tex file
TEXIN = TEXINPUTS=..:$$TEXINPUTS

cmu-user.pdf : ${SRCS}
	$(TEXIN) $(MAKEINFO) --pdf cmu-user.texi
	$(TEXINDEX) cmu-user.??
	$(TEXIN) $(MAKEINFO) --pdf cmu-user.texi

cmu-user.info : ${SRCS}
	$(TEXIN) $(MAKEINFO) --info cmu-user.texi

cmu-user-info.tar.bz2 : cmu-user.info
	$(TAR) cjf cmu-user-info.tar.bz2 cmu-user.info*

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
CSS=--css-ref=../manual.css
SHOW_TITLEPAGE=-c NO_TOP_NODE_OUTPUT=1

# Set up highlighting depending on how the variable HILIITE is set.
# Eventually, this should all go away so that we only use one scheme
# for highlighting the docs.
ifeq ($(HILITE),source-highlight)
  HILITE_STYLE==--set-customization-variable HIGHLIGHT_SYNTAX=source-highlight
endif
ifeq ($(HILITE),pygments)
  HILITE_STYLE=--set-customization-variable HIGHLIGHT_SYNTAX=pygments
endif
ifeq ($(HILITE),custom-pygments)
  HILITE_STYLE=--set-customization-variable HIGHLIGHT_SYNTAX='pygmentize -f html -O classprefix=pyg- -l %l'
endif
ifeq ($(HILITE),highlight)
  HILITE_STYLE=--set-customization-variable HIGHLIGHT_SYNTAX=highlight
endif

TEXIOPTS= $(WORDS_IN_PAGE) $(TEXI_INIT) $(SHOW_TITLEPAGE) $(CSS) $(HILITE_STYLE)

cmu-user.html : ${SRCS} ../texi2html.init
	$(TEXIN) $(MAKEINFO) --no-split --html $(TEXIOPTS) cmu-user.texi

cmu-user_html/index.html : ${SRCS} ../texi2html.init
	$(TEXIN) $(MAKEINFO) --html $(TEXIOPTS) cmu-user.texi

cmu-user-html.tar.bz2 : cmu-user_html/index.html
	$(TAR) cjf cmu-user-html.tar.bz2 cmu-user_html


all : cmu-user-info.tar.bz2 cmu-user.pdf cmu-user.html cmu-user_html/index.html cmu-user-html.tar.bz2

PUBUSER = ../../gen/docs/cmu-user

$(PUBUSER) :
	mkdir -p $@

$(PUBUSER)/html :
	mkdir -p $@

install : all $(PUBUSER) $(PUBUSER)/html
	cp cmu-user-info.tar.bz2 $(PUBUSER)
	cp cmu-user.html $(PUBUSER)
	cp cmu-user.pdf $(PUBUSER)
	cp -r cmu-user_html/* $(PUBUSER)/html
	cp cmu-user-html.tar.bz2 $(PUBUSER)

clean :
	$(RM) -rf cmu-user.html cmu-user_html
	$(RM) cmu-user.pdf cmu-user.info*
	$(RM) cmu-user.?? cmu-user.??s
