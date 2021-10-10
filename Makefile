all: build/license.pdf build/license.html

build/license.md: terms.md | build
	sed "s/Development Draft/Development Draft\n\nGit HEAD \`$(shell git rev-parse HEAD)\`\n\nBuilt $(shell date)/" $< > $@

build/license.pdf: build/license.md | build
	pandoc -V documentclass=article -V papersize=letter -V fontsize=12pt --pdf-engine=xelatex -o $@ $<

build/license.html: build/license.md | build
	pandoc -o $@ $<

build:
	mkdir -p build

.PHONY: clean

clean:
	rm -rf build
