# Forest Fire Detection using ResNet50

## Overview
This project performs forest fire image classification using the ResNet50 deep learning model.

The model classifies images into:
- Fire
- Non_Fire

The project includes:
- Data preprocessing
- Transfer learning using ResNet50
- Model training
- Performance evaluation
- Confusion matrix visualization
- Prediction visualization

---

# Technologies Used

- Python
- TensorFlow / Keras
- OpenCV
- NumPy
- Matplotlib
- Scikit-learn

---

# Dataset

The dataset contains forest fire and non-fire images used for binary image classification.

Classes:
- Fire
- Non_Fire

---

# Model Architecture

The project uses:
- ResNet50 pretrained model
- Transfer learning approach
- Fully connected classification layer

---

# Training Performance

## Training Loss

![Training Loss](ResNet50-Training%20Loss,85%20accuracy.png)

The training loss decreases steadily across epochs, showing successful model learning.

---

# Accuracy and Classification Report

![Classification Report](ResNet50-accuracy%20chart,85%20accuracy.png)

## Results

| Metric | Score |
|---|---|
| Accuracy | 85% |
| Precision (Fire) | 0.89 |
| Recall (Fire) | 0.80 |
| F1-Score (Fire) | 0.84 |

---

# Confusion Matrix

![Confusion Matrix](ResNet50-Confusion%20Matrix,85%20accuracy.png)

The confusion matrix shows:
- Correct fire predictions
- Correct non-fire predictions
- Misclassified samples

---

# Prediction Visualization

![Predicted Images](ResNet50-Predicted%20images,85%20accuracy.png)

Sample predictions from the trained model are shown above.

---

# Project Files

| File | Description |
|---|---|
| Resnet50.ipynb | Main training notebook |
| README.md | Project documentation |
| Output Images | Training and evaluation results |

---

# Future Improvements

- Improve dataset size
- Apply YOLO for fire localization
- Real-time fire detection
- ROI extraction
- Semantic communication integration

---

# Author

Suman Das
M.Tech Student
