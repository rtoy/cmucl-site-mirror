include ../../config.mk

SRCS = cim.texi \
	aux-sys.texi

# Assuming this is GNU tar
TAR ?= tar

TEXINDEX ?= texindex

all : cim-info.tar.bz2 cim.pdf cim.html cim_html/index.html cim-html.tar.bz2


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
	$(TEXIN) $(MAKEINFO) --no-split --html $(TEXIOPTS) cim.texi

cim_html/index.html : ${SRCS}
	$(TEXIN) $(MAKEINFO) --html ${TEXIOPTS} cim.texi

html : cim.html cim_html/index.html

cim-html.tar.bz2 : cim_html/index.html
	$(TAR) cjf $@ cim_html

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
	$(RM) -rf cim_html
	$(RM) cim.pdf cim.info*
	$(RM) cim.?? cmu-user.??s
