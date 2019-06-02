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

cmu-user.pdf : ${SRCS}
	$(MAKEINFO) --pdf cmu-user.texi
	$(TEXINDEX) cmu-user.??
	$(MAKEINFO) --pdf cmu-user.texi

cmu-user.info : ${SRCS}
	$(MAKEINFO) --info cmu-user.texi

cmu-user-info.tar.bz2 : cmu-user.info
	$(TAR) cjf cmu-user-info.tar.bz2 cmu-user.info*

cmu-user.html : ${SRCS}
	$(MAKEINFO) --no-split --html cmu-user.texi

cmu-user/index.html : cmu-user ${SRCS}
	$(MAKEINFO) --html cmu-user.texi

cmu-user-html.tar.bz2 : cmu-user/index.html
	$(TAR) cjf cmu-user-html.tar.bz2 cmu-user

cmu-user :
	mkdir cmu-user

all : cmu-user-info.tar.bz2 cmu-user.pdf cmu-user.html cmu-user/index.html cmu-user-html.tar.bz2

PUBUSER = ../../gen/docs/cmu-user

$(PUBUSER) :
	mkdir -p $@

$(PUBUSER)/html :
	mkdir -p $@

install : all $(PUBUSER) $(PUBUSER)/html
	cp cmu-user-info.tar.bz2 $(PUBUSER)
	cp cmu-user.html $(PUBUSER)
	cp cmu-user.pdf $(PUBUSER)
	cp -r cmu-user/* $(PUBUSER)/html
	cp cmu-user-html.tar.bz2 $(PUBUSER)

clean :
	$(RM) -rf cmu-user
	$(RM) cmu-user.pdf cmu-user.info*
	$(RM) cmu-user.?? cmu-user.??s
