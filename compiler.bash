#!/bin/bash

echo ""
echo " > Cleating cache (if necessary)"
echo ""
mkdir -p cache

echo ""
echo " > First run (1/2)"
echo ""
pdflatex -interaction=errorstopmode -aux-directory=cache -output-directory=cache main.tex

echo ""
echo " > Generating bibliography"
echo ""
bibtex cache/main.aux

echo ""
echo " > Re-run for references (2/2)"
echo ""
pdflatex -interaction=batchmode -aux-directory=cache -output-directory=cache main.tex

echo ""
echo " > Compressing file with ghostscript"
echo ""

# Explicação dos parâmetros:
# -sDEVICE=pdfwrite: Define o dispositivo de saída como PDF.
# -dCompatibilityLevel=1.4: Define a versão do PDF (1.4 é amplamente compatível).
# -dPDFSETTINGS=/ebook: Define o nível de compressão. Opções comuns:
#   /screen: Baixa qualidade, menor tamanho.
#   /ebook: Qualidade média, bom para leitura em dispositivos.
#   /printer: Alta qualidade, adequado para impressão.
#   /prepress: Qualidade máxima, para pré-impressão.
# -sOutputFile: Nome do arquivo de saída.
# - main.pdf: Nome do arquivo de entrada.
ghostscript -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=fredholm-operators-between-hilbert-module.pdf cache/main.pdf

echo ""
echo " > Deleting original file"
echo ""
rm ./cache/main.pdf

echo "Sucefully created file in main directory!"
