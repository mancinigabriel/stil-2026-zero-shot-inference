# latexmkrc para o projeto STIL 2026
# Configuracao usada por `make pdf` e pelo LaTeX Workshop no VS Code.

$pdf_mode = 1;                       # gerar PDF via pdflatex
$pdflatex = 'pdflatex -synctex=1 -interaction=nonstopmode -file-line-error %O %S';
$bibtex_use = 2;                     # rodar bibtex sempre que houver .bib
$out_dir = 'build';
$clean_ext = 'synctex.gz acn acr alg bbl blg brf fdb_latexmk fls glg glo gls idx ilg ind ist lof log lot nav out run.xml snm toc vrb';
