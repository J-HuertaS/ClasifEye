#!/bin/bash

echo "🔍 Buscando notebooks para limpiar salidas..."

# Encuentra todos los .ipynb y limpia sus salidas
find . -name "*.ipynb" -exec jupyter nbconvert --ClearOutputPreprocessor.enabled=True --inplace {} \;

echo "✅ Todos los notebooks fueron limpiados."
