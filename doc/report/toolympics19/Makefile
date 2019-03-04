
all: biblio.bib main.tex
	latex main.tex
	bibtex main
	latex main.tex
	latex main.tex

clean:
	rm *.out *.bbl *.log *.aux *.blg
