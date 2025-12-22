include ../config.mk

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

# Multi-page version
cmu-user_html/index.html : ${SRCS} ../texi2html.init
	$(TEXIN) $(MAKEINFO) --html $(TEXIOPTS) cmu-user.texi

cmu-user-html.tar.bz2 : cmu-user_html/index.html
	$(TAR) cjf cmu-user-html.tar.bz2 cmu-user_html

# Single page version
cmu-user.html : ${SRCS}
	$(TEXIN) $(MAKEINFO) --no-split --html ${TEXIOPTS} cmu-user.texi

# Build html, both single-page and multi-page.
html : cmu-user_html/index.html cmu-user.html

# Build everything.
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
