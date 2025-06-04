# Informe Técnico: Técnicas de Preprocesamiento para Clasificación Facial Multiclase

## Criterios de Selección

Se evaluaron las técnicas de preprocesamiento con base en los siguientes criterios:

- Mejora de la calidad visual de la imagen.
- Robustez ante variaciones de iluminación, ruido y expresión.
- Normalización geométrica (alineación y escalado).
- Compatibilidad con redes neuronales convolucionales.
- Costo computacional razonable.
- Impacto en la generalización del modelo.

## Recomendaciones Finales

| Técnica                         | Justificación principal                                                                 | Incluir |
|--------------------------------|------------------------------------------------------------------------------------------|---------|
| **Normalización**                | Homogeneiza los valores de píxeles; fundamental para redes neuronales.                  | **Sí**     |
| Reducción de ruido             | Mejora la visibilidad de rasgos faciales. Recomendado: Non-Local Means o DnCNN.         | Sí      |
| Corrección de iluminación      | Reduce efectos adversos de luz variable. Recomendado: Histogram Equalization o CLAHE.  | Sí      |
| Alineación facial              | Estabiliza la posición de los rasgos. Requiere detección de landmarks (MTCNN, Dlib).    | Sí      |
| Escalado/Redimensionamiento   | Uniformiza el tamaño de entrada, por ejemplo a 224×224 píxeles.                         | Sí      |
| Segmentación facial            | Aísla la región del rostro. Útil si las imágenes contienen fondo.                       | Opcional|
| Detección de bordes            | Poco útil con CNNs. Mejor evitar para aprendizaje profundo.                             | No      |
| Sharpening adaptativo          | Puede ayudar si se usa con moderación tras denoising.                                   | Opcional|
| Aumento de datos (data augmentation) | Aumenta robustez y diversidad del dataset. Crucial para generalización.        | Sí      |

## Técnicas Recomendadas por Categoría

### 1. Mejora de Calidad Visual

- **Denoising**: Non-Local Means o DnCNN si se dispone de GPU.
- **Iluminación**: CLAHE o técnicas basadas en Retinex.

### 2. Estabilización Geométrica

- **Alineación facial**: Detección de landmarks (por ejemplo, con Dlib o MTCNN) seguida de alineación afín.
- **Resize**: Establecer un tamaño fijo (por ejemplo, 224x224 píxeles).

### 3. Preparación para Deep Learning (ya se había definido)

- **Normalización**: Escalado de píxeles a [0,1] o [-1,1] según el framework.
- **Data augmentation**: Aplicar en tiempo de entrenamiento rotaciones, flips horizontales, recortes aleatorios, cambios de brillo y contraste, entre otros.

## Pipeline Sugerido

```
[Imagen original]
    ↓
[Reducción de ruido (DnCNN o Non-Local Means)]
    ↓
[Corrección de iluminación (CLAHE o Retinex)]
    ↓
[Detección de rostro y landmarks]
    ↓
[Alineación facial + resize a 224x224]
    ↓
[Normalización de píxeles]
    ↓
[Aumento de datos (en tiempo de entrenamiento)]
```

## Técnicas Desaconsejadas

- **Canny/Laplacian o detección de bordes**: No aportan valor en arquitecturas CNN.
- **PCA/LDA previas al entrenamiento**: No se recomienda con deep learning.
- **Sharpening agresivo**: Puede introducir artefactos.

## Consideraciones Finales

- Si el dataset es limpio y balanceado, el pipeline puede simplificarse.
- Si las imágenes presentan variabilidad (expresiones, iluminación, ruido), se recomienda aplicar todo el pipeline completo.
- Se recomienda validar el impacto de cada técnica mediante un ablation study.

## Referencias Principales

- Soekarta & Ku-Mahamud (2025). *Recent Facial Image Preprocessing Techniques: A Review*. Eng. Proc., 84, 39. [DOI: 10.3390/engproc2025084039](https://doi.org/10.3390/engproc2025084039)
- Notas personales extraídas de: [datafloq.com](https://datafloq.com/read/preprocessing-techniques-for-better-face-recognition/)