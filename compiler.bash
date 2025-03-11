#!/bin/bash

# Criar a pasta cache (se não existir)
mkdir -p cache

pdflatex -interaction=errorstopmode -aux-directory=cache -output-directory=cache main.tex

bibtex cache/main.aux

pdflatex -interaction=batchmode -aux-directory=cache -output-directory=cache main.tex

# pdflatex -output-directory=cache main.tex

mv ./cache/main.pdf ./fredholm-operators-between-hilbert-module.pdf

echo "Sucefully created file in main directory!"
