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

design.pdf : $(SRCS)
	$(MAKEINFO) --pdf design.texi

design.info : $(SRCS)
	$(MAKEINFO) --info design.texi

design.html : $(SRCS)
	$(MAKEINFO) --no-split --html design.texi

design/index.html : design $(SRCS)
	$(MAKEINFO) --html design.texi

design :
	mkdir design

PUBDIR = ../../public/docs/internals

$(PUBDIR) :
	mkdir -p $@

$(PUBDIR)/html :
	mkdir -p $@

all : design.pdf design.info design.html design/index.html

install : all $(PUBDIR) $(PUBDIR)/html
	cp -r design.info* $(PUBDIR)
	cp -r design/* $(PUBDIR)/html
	cp design.pdf $(PUBDIR)
	cp design.html $(PUBDIR)

clean : 
	$(RM) design.info* design.pdf design.html design.?? design.??s
	$(RM) -r design
