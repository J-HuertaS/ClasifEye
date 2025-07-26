# ClasifEye 👀

---

## Descripción del Proyecto

ClasifEye es un sistema basado en Inteligencia Artificial diseñado para detectar rostros humanos en imágenes y clasificar atributos como género y rango de edad. El proyecto se desarrolló como parte del curso de Computación Visual (2025-I), con el propósito de aplicar conceptos teóricos en un entorno práctico y fortalecer habilidades en visión por computador, aprendizaje profundo, y análisis ético de sesgos en IA.

Este tipo de tecnología tiene aplicaciones en la personalización de experiencias de usuario, análisis demográfico para investigación de mercado, sistemas de seguridad, y en la optimización de interfaces hombre-máquina. Además, el proyecto promueve la colaboración en equipo, la planificación estructurada y el desarrollo responsable, considerando los riesgos asociados a sesgos en modelos de IA. 

---

## Objetivo Principal

Desarrollar un sistema basado en IA que detecte rostros humanos en imágenes y clasifique automáticamente su género y rango de edad, utilizando redes neuronales convolucionales (CNN) y técnicas de Transfer Learning.

---

## Integrantes del Equipo
- Gabriela Guzmán Rivera
- Juan Esteban Cárdenas Huertas
- Juan David Ardila Díaz
- Manuel Eduardo Díaz Sabogal
- Gabriela Gallegos Rubio

---

## Arquitectura y Metodología
El sistema sigue un pipeline de tres etapas:
1. Detección facial: Utilizamos MTCNN/dlib para localizar y recortar rostros.
2. Preprocesamiento:
- Redimensionamiento a 224x224 px
- Normalización de píxeles [0,1]
- Escalado Min-Max para edad y one-hot encoding para género
3. Clasificación:
- Backbone: ResNet50 con Transfer Learning (pre-entrenada en ImageNet)
- Salidas:
  - Género (clasificación binaria)
  - Edad (regresión o clasificación por rangos)

*Entrenamiento:*
- 25 épocas
- Optimizador: Adam
- Pérdidas: Categorical Crossentropy (género) y MSE (edad)

*Resultados:*
- ~90% accuracy en género
- MAE de 5-7 años en edad
- Robustez en pruebas con variaciones de imagen 

---

## Tecnologías Principales (En consideración)

* Python
* OpenCV
* TensorFlow/Keras
* MTCNN / dlib (detección facial)
* Matplotlib / Seaborn (EDA y métricas)

---

## Conjuntos de Datos (En consideración)

* UTKFace: Dataset principal por su riqueza en anotaciones (edad, género y raza).

---

## Estructura del Proyecto y Fases de Desarrollo (Plan de 10 Semanas)

El proyecto está estructurado en 10 semanas, con objetivos y tareas específicas para cada fase y la planificación fue diseñada en [Notion](https://www.notion.so/Planificaci-n-1ef57b2dc27780bf89baea83df485015?pvs=4).

- Semanas 1-2: Investigación, análisis de datasets y herramientas, selección de arquitectura (ResNet50).
- Semanas 3-4: Preprocesamiento (detección facial, normalización, augmentations).
- Semanas 5-6: Entrenamiento inicial del modelo CNN.
- Semana 7: Integración con módulo de detección facial.
- Semana 8: Optimización y reentrenamiento.
- Semana 9: Evaluación, métricas, análisis de sesgo y visualización de resultados.
- Semana 10: Documentación final, demo y presentación.

---

## Resultados Clave
- Género: ~90% accuracy
- Edad: MAE 5-7 años
- Sesgo observado en clases minoritarias (raza), documentado en análisis
- Pipeline completo probado con imágenes reales

---

## Instalación y Uso

1. Clonar el repositorio
2. Crear entorno virtual e instalar dependencias
3. Descargar y organizar el dataset UTKFace
4. Ejecutar scripts:
    - EDA.ipynb → Análisis exploratorio
    - Preprocesamiento Completo.ipynb → Normalización y augmentations
    - CNN.ipynb → Entrenamiento del modelo
    - Predicciones.ipynb → Inferencia en imágenes nuevas
  
---

## Comparativa de Arquitecturas (Discusión)

Se analizaron varias arquitecturas CNN (GoogLeNet, ResNet, DenseNet, MobileNet, EfficientNet). ResNet50 fue seleccionada por su balance entre precisión y generalización en tareas de clasificación facial. MobileNet se considera para futuras versiones con enfoque en eficiencia computacional.

---

## Contacto

- jucardenash@unal.edu.co
- juardilad@unal.edu.co
- gguzmanr@unal.edu.co
- mdiazsa@unal.edu.co
- ggallegosr@unal.edu.co
