SRCS = hemlock-user.texi \
	intro.texi \
	commands.texi \
	special-modes.texi \
	lisp.texi \
	mail.texi \
	netnews.texi

all : hemlock-user.pdf hemlock-user.info hemlock-user.texi hemlock-user/index.html

# Where to find our texinfo.tex file
TEXIN = TEXINPUTS=..:$$TEXINPUTS

hemlock-user.pdf : ${SRCS}
	${TEXIN} ${MAKEINFO} --pdf hemlock-user.texi

hemlock-user.info : ${SRCS}
	$(TEXIN) $(MAKEINFO) --info hemlock-user.texi

hemlock-user-info.tar.bz2 : hemlock-user.info
	${TAR} cjf $< hemlock-user.info*

hemlock-user.html : ${SRCS}
	$(TEXIN) $(MAKEINFO) --no-split --html hemlock-user.texi

# Options for the split HTML version
#
# WORDS_IN_PAGE: smaller so the bottom navbar shows up more often on
#   short pages.  Useful for mobile devices.  (Value experimentally
#   determined by looking at short pages on mobile device.)
TEXIOPTS=--set-customization-variable WORDS_IN_PAGE=200
hemlock-user/index.html : hemlock-user ${SRCS}
	$(TEXIN) $(MAKEINFO) --html ${TEXIOPTS} hemlock-user.texi

hemlock-user-html.tar.bz2 : hemlock-user/index.html
	$(TAR) cjf hemlock-user-html.tar.bz2 hemlock-user
