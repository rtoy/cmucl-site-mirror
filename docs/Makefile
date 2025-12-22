include config.mk

SRCS=rtguts.texi

# Assuming this is GNU tar
TAR ?= tar

# We're assuming this is GNU sed
SED ?= sed
TEXINDEX ?= texindex

# Where to find our texinfo.tex file
TEXIN = TEXINPUTS=..:$$TEXINPUTS

rtguts.pdf : ${SRCS}
	$(TEXIN) $(MAKEINFO) --pdf rtguts.texi
	$(TEXINDEX) rtguts.??
	$(TEXIN) $(MAKEINFO) --pdf rtguts.texi

rtguts.info : ${SRCS}
	$(TEXIN) $(MAKEINFO) --info rtguts.texi

rtguts-info.tar.bz2 : rtguts.info
	$(TAR) cjf rtguts-info.tar.bz2 rtguts.info*

rtguts.html : ${SRCS}
	$(TEXIN) $(MAKEINFO) --no-split --html $(TEXIOPTS) rtguts.texi

rtguts_html/index.html : ${SRCS}
	$(TEXIN) $(MAKEINFO) --html ${TEXIOPTS} rtguts.texi

# Build html, both single-page and multi-page.
html : rtguts_html/index.html rtguts.html

rtguts-html.tar.bz2 : rtguts_html/index.html
	$(TAR) cjf rtguts-html.tar.bz2 rtguts_html


all : rtguts-info.tar.bz2 rtguts.pdf rtguts.html rtguts_html/index.html rtguts-html.tar.bz2

PUBUSER = ../gen/docs/rtguts

$(PUBUSER) :
	mkdir -p $@

$(PUBUSER)/html :
	mkdir -p $@

install : all $(PUBUSER) $(PUBUSER)/html
	cp rtguts-info.tar.bz2 $(PUBUSER)
	cp rtguts.html $(PUBUSER)
	cp rtguts.pdf $(PUBUSER)
	cp -r rtguts_html/* $(PUBUSER)/html
	cp rtguts-html.tar.bz2 $(PUBUSER)

clean :
	$(RM) -rf rtguts_html
	$(RM) rtguts.pdf rtguts.info*
	$(RM) rtguts.?? rtguts.cps rtguts.aux rtguts.log rtguts.toc
