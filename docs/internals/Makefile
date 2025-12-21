include ../config.mk

SRCS = architecture.texi \
	back.texi \
	compiler-overview.texi \
	compiler.texi \
	debugger.texi \
	design.texi \
	environment.texi \
	fasl.texi \
	front.texi \
	glossary.texi \
	interface.texi \
	interpreter.texi \
	lowlev.texi \
	middle.texi \
	object.texi \
	retargeting.texi \
	run-time.texi

# Where to find our texinfo.tex file
TEXIN = TEXINPUTS=..:$$TEXINPUTS

design.pdf : $(SRCS)
	$(TEXIN) $(MAKEINFO) --pdf design.texi

design.info : $(SRCS)
	$(TEXIN) $(MAKEINFO) --info design.texi

design.html : $(SRCS)
	$(TEXIN) $(MAKEINFO) --no-split --html $(TEXIOPTS) design.texi

design_html/index.html :  $(SRCS)
	$(TEXIN) $(MAKEINFO) --html $(TEXIOPTS) design.texi

# Build html, both single-page and multi-page.
html : design_html/index.html design.html

PUBDIR = ../../gen/docs/internals

$(PUBDIR) :
	mkdir -p $@

$(PUBDIR)/html :
	mkdir -p $@

all : design.pdf design.info design.html design_html/index.html

install : all $(PUBDIR) $(PUBDIR)/html
	cp -r design.info* $(PUBDIR)
	cp -r design_html/* $(PUBDIR)/html
	cp design.pdf $(PUBDIR)
	cp design.html $(PUBDIR)

clean : 
	$(RM) design.info* design.pdf design.html design.?? design.??s
	$(RM) -r design_html
