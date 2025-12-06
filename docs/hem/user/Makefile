SRCS = hemlock-user.texi \
	intro.texi \
	commands.texi \
	special-modes.texi \
	lisp.texi \
	mail.texi \
	netnews.texi
# Assuming this is GNU tar
TAR ?= tar

TEXINDEX ?= texindex

all : hemlock-user-info.tar.bz2 hemlock-user.pdf hemlock-user.html hemlock-user_html/index.html hemlock-user-html.tar.bz2


# Where to find our texinfo.tex file
#TEXIN = TEXINPUTS=..:$$TEXINPUTS

hemlock-user.pdf : ${SRCS}
	${TEXIN} ${MAKEINFO} --pdf hemlock-user.texi
	$(TEXINDEX) hemlock-user.??
	$(TEXIN) $(MAKEINFO) --pdf hemlock-user.texi

hemlock-user.info : ${SRCS}
	$(TEXIN) $(MAKEINFO) --info hemlock-user.texi

hemlock-user-info.tar.bz2 : hemlock-user.info
	${TAR} cjf $@ hemlock-user.info*

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
#TEXI_INIT=--init-file=../../texi2html.init
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

hemlock-user.html : ${SRCS}
	$(TEXIN) $(MAKEINFO) --no-split --html $(TEXIOPTS) hemlock-user.texi

hemlock-user_html/index.html : ${SRCS}
	$(TEXIN) $(MAKEINFO) --html $(TEXIOPTS) hemlock-user.texi

html : hemlock-user.html hemlock-user_html/index.html

hemlock-user-html.tar.bz2 : hemlock-user_html/index.html
	$(TAR) cjf $@ hemlock-user_html

PUBUSER = ../../../gen/docs/hem/user

$(PUBUSER) :
	mkdir -p $@

$(PUBUSER)/html :
	mkdir -p $@

install : all $(PUBUSER) $(PUBUSER)/html
	cp hemlock-user-info.tar.bz2 $(PUBUSER)
	cp hemlock-user.html $(PUBUSER)
	cp hemlock-user.pdf $(PUBUSER)
	cp -r hemlock-user_html/* $(PUBUSER)/html
	cp hemlock-user-html.tar.bz2 $(PUBUSER)

clean :
	$(RM) -rf hemlock-user_html
	$(RM) hemlock-user.pdf hemlock-user.info*
	$(RM) hemlock-user.?? hemlock-user.??s
