.PHONY: default

CC = xelatex
EXAMPLE_DIR = example

default: example.pdf example.png

example.pdf: $(EXAMPLE_DIR)/example.tex
	$(CC) -interaction nonstopmode -output-directory=$(EXAMPLE_DIR) $<

example.png: $(EXAMPLE_DIR)/example.pdf
	convert -density 600x600 $< -quality 90 -resize 1080x800 $(EXAMPLE_DIR)/example.png

clean:
	cd $(EXAMPLE_DIR) && rm -rf *.pdf *.png *.log *.aux *.out
