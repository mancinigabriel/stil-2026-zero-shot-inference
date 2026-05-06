# STIL 2026 — Ambiente LaTeX local

Setup pessoal para escrever o artigo do STIL 2026 (17º Simpósio Brasileiro de Tecnologia da Informação e Linguagem Humana, em Cuiabá-MT, junto ao BRACIS 2026) sem depender do Overleaf.

## Como usar

```bash
# Compilar
make pdf            # gera ./main.pdf (e build/main.pdf)

# Compilar continuamente (live-preview)
make watch          # latexmk -pvc; recompila a cada salvamento

# Limpar arquivos auxiliares
make clean          # remove .aux, .log, .bbl, etc.
make distclean      # acima + remove build/ e PDF

# Métricas
make wordcount      # conta palavras (texcount)
make pages          # mostra páginas do PDF
make check          # compila + avisa do limite STIL (long=10, short=6 + refs)

# Formatar .tex
make format         # latexindent in-place
```

A variável `MAIN` aponta pro `.tex` raiz (default: `main`). Se o seu arquivo se chamar diferente:

```bash
make pdf MAIN=meu-artigo
```

## Estrutura esperada

```
stil-2026/
├── template-sbc/        # template oficial da SBC (clonar separado)
├── main.tex             # seu artigo (a partir do template)
├── refs.bib             # bibliografia
├── figs/                # imagens
├── Makefile
├── .latexmkrc
├── .gitignore
└── .vscode/
    ├── settings.json
    └── extensions.json
```

## STIL 2026 — formato resumido

- Long paper: **10 páginas + referências**
- Short paper: **6 páginas + referências**
- Idiomas aceitos: PT, EN, ES
- Template: oficial da SBC (`sbc-template.sty`)
- Site: <https://bracis.sbc.org.br/2026/stil/>
