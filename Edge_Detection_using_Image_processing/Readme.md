# Tutorial 02 - Image Processing using MATLAB

## Overview

This project implements important image processing techniques using MATLAB.

The tutorial covers:
- Edge Detection
- Image Enhancement
- Frequency Domain Filtering
- Morphological Operations
- Image Restoration

The experiments demonstrate both spatial domain and frequency domain image processing techniques.

---

# Technologies Used

- MATLAB
- Image Processing Toolbox
- Frequency Domain Filtering
- Morphological Processing

---

# Experiments Included

| Experiment | Description |
|---|---|
| Laplacian of Gaussian (LoG) | Edge detection using second-order derivative |
| Canny Edge Detection | Accurate edge extraction |
| High Boost Filtering | Image sharpening |
| Gaussian Low Pass Filtering | Frequency domain smoothing |
| Opening and Closing | Morphological processing |
| Inverse Filtering | Motion blur restoration |
| Radially Limited Inverse Filtering | Controlled restoration |
| Wiener Filtering | Noise and blur reduction |

---

# 1. Laplacian of Gaussian (LoG) Edge Detection

## Objective
To detect edges using Laplacian of Gaussian method.

## Result

<img width="1398" height="876" alt="Figure_1" src="https://github.com/user-attachments/assets/da55d7c6-3173-4754-99f3-b305871196a8" />


### Observations
- Gaussian smoothing reduces noise
- Laplacian highlights intensity transitions
- Object boundaries are clearly visible

---

# 2. Canny Edge Detection

## Objective
To detect edges using the Canny algorithm.

## Result

<img width="1864" height="875" alt="Figure_2" src="https://github.com/user-attachments/assets/fdd2fe18-e7d8-48a2-a7e6-f8155075ac87" />


### Observations
- Thin and continuous edges obtained
- Better edge localization
- Less noisy compared to LoG

---

# 3. High Boost Filtering

## Objective
To enhance image details using high boost filtering.

## Result

<img width="1418" height="876" alt="Figure_3" src="https://github.com/user-attachments/assets/df67a808-df20-446c-bc13-eec41ee27982" />


### Observations
- Image sharpness improved
- Fine details enhanced
- High-frequency components emphasized

---

# 4. Gaussian Low Pass Filtering

## Objective
To remove high-frequency noise using Gaussian LPF.

## Result

<img width="1398" height="876" alt="Figure_4" src="https://github.com/user-attachments/assets/319fdb86-57b6-43af-b525-986bc977fc62" />


### Observations
- Image becomes smoother
- High-frequency noise suppressed
- Fine edges reduced

---

# 5. Opening and Closing on Fingerprint Image

## Objective
To perform morphological operations on fingerprint images.

## Result

<img width="1312" height="874" alt="Figure_5" src="https://github.com/user-attachments/assets/ad6e20d2-8477-490f-bc8f-0fea3d5c24f4" />


### Observations
- Opening removes small noise
- Closing fills gaps in ridges
- Fingerprint becomes cleaner

---

# 6. Motion Deblurring using Inverse Filtering

## Objective
To restore blurred images using inverse filtering.

## Result
<img width="1864" height="714" alt="Figure_6" src="https://github.com/user-attachments/assets/d1623ce4-1527-42bb-a27a-05d80997304a" />


### Observations
- Blur partially restored
- Image sharpness improved
- Minor artifacts still visible

---

# 7. Radially Limited Inverse Filtering

## Objective
To reduce noise amplification during restoration.

## Result

<img width="1398" height="876" alt="Figure_7" src="https://github.com/user-attachments/assets/e6f75fa8-4e1b-4c54-8129-7e20002849ed" />


### Observations
- Better stability than ordinary inverse filtering
- Reduced noise amplification
- Smoother restoration result

---

# 8. Wiener Filtering

## Objective
To restore degraded images using Wiener filtering.

## Result
<img width="1398" height="876" alt="Figure_8" src="https://github.com/user-attachments/assets/2c826df1-c0bd-4a56-834d-bbc7e6e9281a" />


### Observations
- Blur and noise both reduced
- More balanced restoration
- Better practical restoration quality

---

# MATLAB Code

Main MATLAB implementation file:

```matlab
Tutorial2.m
```

The code includes:
- Image enhancement
- Edge detection
- Frequency domain filtering
- Morphological processing
- Image restoration techniques

:contentReference[oaicite:1]{index=1}

---

# Report

Detailed report available in:

```text
25SP06010_Tutorial2_report.pdf
```

:contentReference[oaicite:2]{index=2}

---

# Conclusion

This tutorial demonstrates practical implementation of major digital image processing techniques using MATLAB.

The project helped in understanding:
- Edge extraction
- Image enhancement
- Frequency domain analysis
- Morphological processing
- Image restoration techniques

These methods are widely used in:
- Computer Vision
- Medical Imaging
- Biometrics
- Remote Sensing
- Surveillance Systems

---

# Author

Suman Das  
M.Tech Student
