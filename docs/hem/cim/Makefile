SRCS = cim.texi \
	aux-sys.texi

# Assuming this is GNU tar
TAR ?= tar

TEXINDEX ?= texindex

all : cim-info.tar.bz2 cim.pdf cim.html cim/index.html cim-html.tar.bz2


# Where to find our texinfo.tex file
TEXIN = TEXINPUTS=..:$$TEXINPUTS

cim.pdf : ${SRCS}
	${TEXIN} ${MAKEINFO} --pdf cim.texi
	$(TEXINDEX) cim.??
	$(TEXIN) $(MAKEINFO) --pdf cim.texi

cim.info : ${SRCS}
	$(TEXIN) $(MAKEINFO) --info cim.texi

cim-info.tar.bz2 : cim.info
	${TAR} cjf $@ cim.info*

cim.html : ${SRCS}
	$(TEXIN) $(MAKEINFO) --no-split --html cim.texi

# Options for the split HTML version
#
# WORDS_IN_PAGE: smaller so the bottom navbar shows up more often on
#   short pages.  Useful for mobile devices.  (Value experimentally
#   determined by looking at short pages on mobile device.)
TEXIOPTS=--set-customization-variable WORDS_IN_PAGE=200
cim/index.html : cim ${SRCS}
	$(TEXIN) $(MAKEINFO) --html ${TEXIOPTS} cim.texi

cim-html.tar.bz2 : cim/index.html
	$(TAR) cjf $@ cim

cim :
	mkdir cim

PUBUSER = ../../../gen/docs/hem/cim

$(PUBUSER) :
	mkdir -p $@

$(PUBUSER)/html :
	mkdir -p $@

install : all $(PUBUSER) $(PUBUSER)/html
	cp cim-info.tar.bz2 $(PUBUSER)
	cp cim.html $(PUBUSER)
	cp cim.pdf $(PUBUSER)
	cp -r cim_html/* $(PUBUSER)/html
	cp cim-html.tar.bz2 $(PUBUSER)

clean :
	$(RM) -rf cim
	$(RM) cim.pdf cim.info*
	$(RM) cim.?? cmu-user.??s
