NAME  = pgfcalendar-holidays
SHELL = bash
PWD   = $(shell pwd)
LOCAL = $(shell kpsewhich --var-value TEXMFLOCAL)
UTREE = $(shell kpsewhich --var-value TEXMFHOME)
all:	$(NAME).pdf clean
$(NAME).pdf: $(NAME).dtx
	pdflatex -shell-escape -recorder -interaction=batchmode $(NAME).dtx >/dev/null
	if [ -f $(NAME).idx ]; then makeindex -q -s l3doc.ist -o $(NAME).ind $(NAME).idx; fi
	if [ -f $(NAME).glo ]; then makeindex -q -s gglo.ist -o $(NAME).gls $(NAME).glo; fi
	biber -q $(NAME)
	pdflatex --recorder --interaction=nonstopmode $(NAME).dtx > /dev/null
	pdflatex --recorder --interaction=nonstopmode $(NAME).dtx > /dev/null
clean:
	rm -f $(NAME).{aux,fls,glo,gls,hd,idx,ilg,ind,ins,log,out,toc,cmds,bbl,bcf,blg,run.xml}
distclean: clean
	rm -f $(NAME).{pdf,sty,zip}
inst: all
	mkdir -p $(UTREE)/{tex,source,doc}/latex/$(NAME)
	cp $(NAME).dtx $(UTREE)/source/latex/$(NAME)
	cp $(NAME).sty $(UTREE)/tex/latex/$(NAME)
	cp $(NAME).pdf $(UTREE)/doc/latex/$(NAME)
install: all
	sudo mkdir -p $(LOCAL)/{tex,source,doc}/latex/$(NAME)
	sudo cp $(NAME).dtx $(LOCAL)/source/latex/$(NAME)
	sudo cp $(NAME).sty $(LOCAL)/tex/latex/$(NAME)
	sudo cp $(NAME).pdf $(LOCAL)/doc/latex/$(NAME)
zip: all
	$(eval TEMP := $(shell mktemp -d))
	$(eval TDIR  = $(TEMP)/$(NAME))
	mkdir $(TDIR)
	cp README.md $(TDIR)/README
	cp $(NAME).{bib,dtx,pdf,sty} Makefile $(TDIR)
	cd $(TEMP); zip -Drq $(PWD)/$(NAME).zip $(NAME)
