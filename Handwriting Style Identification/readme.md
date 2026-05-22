# Handwriting Style Identification using Traditional Image Processing

## Overview

This project implements handwriting style identification using only traditional image processing techniques without using:

- Artificial Intelligence (AI)
- Machine Learning (ML)
- Deep Learning (DL)

The system identifies handwriting styles using handcrafted image features extracted from handwritten word images.

The IAM Handwriting Dataset was used for experimentation.

---

# Objective

To identify different handwriting styles using classical image processing and feature extraction techniques.

---

# Technologies Used

- Python
- OpenCV
- NumPy
- Scikit-image
- Matplotlib

---

# Dataset

The project uses the IAM Handwriting Database.

## Dataset Statistics

| Parameter | Value |
|---|---|
| Total Images | 4899 |
| Writers Available | 25 |
| Writers Selected | 3 |
| Train Samples | 213 |
| Test Samples | 54 |

:contentReference[oaicite:1]{index=1}

---

# Methodology

The system follows these major steps:

```text
Input Image
     ↓
Preprocessing
     ↓
Feature Extraction
     ↓
Distance Matching
     ↓
Writer Prediction
```

:contentReference[oaicite:2]{index=2}

---

# Preprocessing

The handwritten images are processed using:

- Grayscale conversion
- Image resizing
- Thresholding / binarization
- Noise reduction

## Dataset Images

<img width="1850" height="105" alt="a01-000u-s00-01" src="https://github.com/user-attachments/assets/aa36d99e-3801-4cbe-a88f-ad064070e946" />
<img width="1986" height="105" alt="a01-000u-s00-02" src="https://github.com/user-attachments/assets/82461987-7b7a-4dcf-adad-300eb82b4a81" />
<img width="733" height="66" alt="a01-000u-s00-03" src="https://github.com/user-attachments/assets/6bf9b9cd-edd3-4029-a171-7aa1d52039b0" />

## Preprocessing Result
<img width="750" height="350" alt="Original_processed_image" src="https://github.com/user-attachments/assets/5dcb974f-baf4-49a5-bf02-84dad64c9966" />

:contentReference[oaicite:3]{index=3}

---

# Feature Extraction

The following handcrafted features are extracted:

## 1. Histogram of Oriented Gradients (HOG)
Captures stroke direction and edge information.

## 2. Hu Moments
Captures invariant shape properties.

## 3. Pixel Density
Measures amount of ink pixels in image.

Final Feature Vector Size:
```text
8108 features
```

:contentReference[oaicite:4]{index=4}

---

# Classification

Writer classification is performed using:

## Manhattan Distance Matching

The nearest training sample is selected as the predicted writer.

```math
D = \sum |x_i - y_i|
```

:contentReference[oaicite:5]{index=5}

---

# Accuracy Report

## Overall Accuracy: 61.11%

<img width="600" height="258" alt="accuracy" src="https://github.com/user-attachments/assets/a48f820d-ac45-4ee4-ab7e-8692c9e7b998" />


### Observations

- Writer n06 achieved best recall
- Writer n02 had lower recall due to style similarity
- HOG features contributed strongly to discrimination
- Traditional methods achieved acceptable performance without AI/ML

:contentReference[oaicite:6]{index=6}

---

# Confusion Matrix

<img width="640" height="547" alt="confusion matrix" src="https://github.com/user-attachments/assets/6fe14a38-642e-40c7-b24a-c1b4469a23e8" />


The confusion matrix shows writer-wise classification performance.

:contentReference[oaicite:7]{index=7}

---

# Advantages

- No AI / ML / DL required
- Easy to understand and implement
- Low computational complexity
- Suitable for academic mini projects
- Works on limited data

:contentReference[oaicite:8]{index=8}

---

# Limitations

- Lower accuracy compared to deep learning methods
- Sensitive to image quality
- Limited number of writers tested

:contentReference[oaicite:9]{index=9}

---

# Future Improvements

The system can be improved by:

- Using more writers
- Better segmentation techniques
- Combining more handcrafted features
- Testing on full IAM dataset

:contentReference[oaicite:10]{index=10}

---

# Files Included

| File | Description |
|---|---|
| handwriting_style_identification.ipynb | Main implementation notebook |
| report.pdf | Complete project report |
| README.md | Project documentation |
| accuracy.png | Classification report |
| confusion_matrix.png | Confusion matrix |
| preprocessing_result.png | Preprocessing visualization |

---

# Conclusion

This project successfully demonstrates handwriting style identification using classical image processing methods.

The system extracts handcrafted features such as:
- HOG descriptors
- Hu Moments
- Pixel Density

and performs writer classification using Manhattan distance similarity matching.

The project proves that effective handwriting analysis can be achieved even without modern AI/ML/DL techniques.

:contentReference[oaicite:11]{index=11}

---

# Applications

- Forensic document analysis
- Signature verification
- Historical manuscript analysis
- Writer verification
- Criminal investigation

:contentReference[oaicite:12]{index=12}

---

# Author

Suman Das  
M.Tech, IIT Bhubaneswar
