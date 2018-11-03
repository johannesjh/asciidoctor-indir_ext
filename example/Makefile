.PHONY: all
all: master.html master.pdf

master.html: clean
	bundle exec asciidoctor --trace  -r ../lib/asciidoctor/indir_ext master.adoc

master.pdf: clean
	bundle exec asciidoctor-pdf --trace  -r ../lib/asciidoctor/indir_ext master.adoc

.PHONY: clean
clean:
	$(RM) master.html
	$(RM) master.pdf
