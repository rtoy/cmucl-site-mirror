# Where to find our texinfo.tex file
TEXIN = TEXINPUTS=..:$$TEXINPUTS

%.pdf : %.texi
	$(TEXIN) $(MAKEINFO) --pdf $^

%.info : %.texi
	$(TEXIN) $(MAKEINFO) --info $^

%.html : %.texi
	$(TEXIN) $(MAKEINFO) --no-split --html $^

toolkit/index.html : toolkit toolkit.texi
	$(TEXIN) $(MAKEINFO) --html $^

internals/index.html : internals internals.texi
	$(TEXIN) $(MAKEINFO) --html $^

toolkit :
	mkdir toolkit

internals :
	mkdir internals

PUBDIR = ../../gen/docs/interface

$(PUBDIR)/internals :
	mkdir -p $@

$(PUBDIR)/internals/html :
	mkdir -p $@

$(PUBDIR)/toolkit :
	mkdir -p $@

$(PUBDIR)/toolkit/html :
	mkdir -p $@

all: toolkit-all internals-all

toolkit-all : toolkit.pdf toolkit.info toolkit.html toolkit/index.html

internals-all : internals.pdf internals.info internals.html internals/index.html

install-toolkit : $(PUBDIR)/toolkit $(PUBDIR)/toolkit/html toolkit-all
	cp -r toolkit.info* $(PUBDIR)/toolkit
	cp -r toolkit_html/* $(PUBDIR)/toolkit/html
	cp toolkit.pdf $(PUBDIR)/toolkit
	cp toolkit.html $(PUBDIR)/toolkit

install-internals : $(PUBDIR)/internals $(PUBDIR)/internals/html internals-all
	cp -r internals.info* $(PUBDIR)/internals
	cp -r internals_html/* $(PUBDIR)/internals/html
	cp internals.pdf $(PUBDIR)/internals
	cp internals.html $(PUBDIR)/internals

install : install-toolkit install-internals

clean :
	$(RM) internals.info* internals.pdf internals.html internals.?? internals.??s
	$(RM) -r internals
	$(RM) toolkit.info* toolkit.pdf toolkit.html toolkit.?? toolkit.??s
	$(RM) -r toolkit
