# Makefile para o artigo do STIL 2026
# Ajuste MAIN para o nome do seu .tex principal (sem extensão).

MAIN      ?= main
BUILD_DIR ?= build
LATEXMK   := latexmk -pdf -interaction=nonstopmode -halt-on-error \
             -file-line-error -synctex=1 -outdir=$(BUILD_DIR)

.PHONY: all pdf watch clean distclean wordcount pages format check

all: pdf

pdf:
	@mkdir -p $(BUILD_DIR)
	$(LATEXMK) $(MAIN).tex
	@cp $(BUILD_DIR)/$(MAIN).pdf ./$(MAIN).pdf 2>/dev/null || true
	@echo "PDF: ./$(MAIN).pdf"

watch:
	@mkdir -p $(BUILD_DIR)
	$(LATEXMK) -pvc $(MAIN).tex

clean:
	latexmk -c -outdir=$(BUILD_DIR) $(MAIN).tex 2>/dev/null || true
	rm -f *.aux *.log *.out *.toc *.bbl *.blg *.fls *.fdb_latexmk *.synctex.gz

distclean: clean
	rm -rf $(BUILD_DIR)
	rm -f $(MAIN).pdf

# Conta palavras do corpo (ignora comandos LaTeX, comentários e refs)
wordcount:
	@which texcount > /dev/null || (echo "texcount nao instalado (vem com MacTeX)"; exit 1)
	@texcount -inc -sum -q $(MAIN).tex

# Mostra numero de paginas do PDF compilado
pages:
	@which pdfinfo > /dev/null || (echo "pdfinfo nao instalado: brew install poppler"; exit 1)
	@pdfinfo $(MAIN).pdf 2>/dev/null | grep "^Pages" || (echo "Compile primeiro: make pdf"; exit 1)

# Reformata o .tex usando latexindent (nao destrutivo: cria .bak)
format:
	@which latexindent > /dev/null || (echo "latexindent nao instalado: brew install latexindent"; exit 1)
	latexindent -w -s $(MAIN).tex

# Lint basico: avisa se passou do limite de paginas do STIL (long=10, short=6, +refs)
check: pdf pages
	@pages=$$(pdfinfo $(MAIN).pdf | awk '/^Pages/ {print $$2}'); \
	echo "Paginas: $$pages"; \
	echo "Limite STIL long: 10 + referencias  |  short: 6 + referencias"
