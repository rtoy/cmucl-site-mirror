# Various common items for building the docs

# Options for the split HTML version
#
# WORDS_IN_PAGE: smaller so the bottom navbar shows up more often on
#   short pages.  Useful for mobile devices.  (Value experimentally
#   determined by looking at short pages on mobile device.)
#
# TEXI_INIT: Init file for texinfo for setting up the html pages.
#
# CSS: CSS file for managing the styling to use for the html pages.
#
# SITE: Variable to set the root of the website.  Defaults to "" which
#       is suitable for cmucl.common-lisp.dev and cmucl.org.  This can
#       be set from the command line for other websites.

WORDS_IN_PAGE=--set-customization-variable WORDS_IN_PAGE=200
SITE=""
CSS=--css-ref=$(SITE)/manual.css
SHOW_TITLEPAGE=-c NO_TOP_NODE_OUTPUT=1

# Set up highlighting depending on how the variable HILIITE is set.
# We also set the texi init file that supports the given scheme.
# Eventually, this should all go away so that we only use one scheme
# for highlighting the docs.
#
# Reconized values are
#  * source-highlight - GNU source highlight
#  * pygments         - pygments
#  * custom-pygments  - pygments, but supports custom highlighting styles
#  * highlight        - texinfo highlight
#
# If not given, defaults to highlightjs.
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
  CSS=--css-ref=$(SITE)/manual-custom-pygments.css
  TEXIINIT=../texi2html.init
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

