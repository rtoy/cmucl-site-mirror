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

all : hemlock-user-info.tar.bz2 hemlock-user.pdf hemlock-user.html hemlock-user/index.html hemlock-user-html.tar.bz2


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

hemlock-user.html : ${SRCS}
	$(TEXIN) $(MAKEINFO) --no-split --html hemlock-user.texi

# Options for the split HTML version
#
# WORDS_IN_PAGE: smaller so the bottom navbar shows up more often on
#   short pages.  Useful for mobile devices.  (Value experimentally
#   determined by looking at short pages on mobile device.)
TEXIOPTS=--set-customization-variable WORDS_IN_PAGE=200
hemlock-user_html/index.html : ${SRCS}
	$(TEXIN) $(MAKEINFO) --html ${TEXIOPTS} hemlock-user.texi

hemlock-user-html.tar.bz2 : hemlock-user_html/index.html
	$(TAR) cjf $@ hemlock-user

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
