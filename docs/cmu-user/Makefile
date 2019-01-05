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

# We're assuming this is GNU sed

SED ?= sed
# Need to create the pdf file this way so we can generate the index
# with entries for sub topics.
#
# The sed command basically converts an index entry like
#
#   \entry{foo!bar}{lineno}{foo!bar}
#
# to
#   \entry{foo!bar}{lineno}{foo}{bar}
#
cmu-user.pdf : ${SRCS}
	pdftex cmu-user.texi
	$(SED) -i=bak -E 's/^(.*)\{([^!]+)!([^}]+)\}[ ]*$$/\1{\2}{\3}/' cmu-user.cp
	texindex cmu-user.cp
	pdftex cmu-user.texi
	pdftex cmu-user.texi

cmu-user.info : ${SRCS}
	$(MAKEINFO) --info cmu-user.texi

cmu-user.html : ${SRCS}
	$(MAKEINFO) --no-split --html cmu-user.texi

cmu-user/index.html : cmu-user ${SRCS}
	$(MAKEINFO) --html cmu-user.texi

cmu-user :
	mkdir cmu-user

all : cmu-user.info cmu-user.pdf cmu-user.html cmu-user/index.html

PUBUSER = ../../public/docs/cmu-user

$(PUBUSER) :
	mkdir -p $@

$(PUBUSER)/html :
	mkdir -p $@

install : all $(PUBUSER) $(PUBUSER)/html
	cp -r cmu-user.info* $(PUBUSER)
	cp -r cmu-user/* $(PUBUSER)/html
	cp cmu-user.pdf $(PUBUSER)
	cp cmu-user.html $(PUBUSER)/html

clean :
	$(RM) -rf cmu-user
	$(RM) cmu-user.pdf cmu-user.info*
	$(RM) cmu-user.?? cmu-user.??s
