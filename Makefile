all: build/license.pdf

build/license.pdf: license.md | build
	pandoc -V documentclass=article -V papersize=letter -V fontsize=12pt --pdf-engine=xelatex -o $@ $<

build:
	mkdir -p build

.PHONY: clean

clean:
	rm -rf build
