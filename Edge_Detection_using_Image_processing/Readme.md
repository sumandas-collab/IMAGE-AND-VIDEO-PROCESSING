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

![LoG Edge Detection](Figure_1.png)

### Observations
- Gaussian smoothing reduces noise
- Laplacian highlights intensity transitions
- Object boundaries are clearly visible

---

# 2. Canny Edge Detection

## Objective
To detect edges using the Canny algorithm.

## Result

![Canny Edge Detection](Figure_2.png)

### Observations
- Thin and continuous edges obtained
- Better edge localization
- Less noisy compared to LoG

---

# 3. High Boost Filtering

## Objective
To enhance image details using high boost filtering.

## Result

![High Boost Filtering](Figure_3.png)

### Observations
- Image sharpness improved
- Fine details enhanced
- High-frequency components emphasized

---

# 4. Gaussian Low Pass Filtering

## Objective
To remove high-frequency noise using Gaussian LPF.

## Result

![Gaussian LPF](Figure_4.png)

### Observations
- Image becomes smoother
- High-frequency noise suppressed
- Fine edges reduced

---

# 5. Opening and Closing on Fingerprint Image

## Objective
To perform morphological operations on fingerprint images.

## Result

![Morphological Operations](Figure_5.png)

### Observations
- Opening removes small noise
- Closing fills gaps in ridges
- Fingerprint becomes cleaner

---

# 6. Motion Deblurring using Inverse Filtering

## Objective
To restore blurred images using inverse filtering.

## Result

![Inverse Filtering](Figure_6.png)

### Observations
- Blur partially restored
- Image sharpness improved
- Minor artifacts still visible

---

# 7. Radially Limited Inverse Filtering

## Objective
To reduce noise amplification during restoration.

## Result

![Radially Limited Inverse Filtering](Figure_7.png)

### Observations
- Better stability than ordinary inverse filtering
- Reduced noise amplification
- Smoother restoration result

---

# 8. Wiener Filtering

## Objective
To restore degraded images using Wiener filtering.

## Result

![Wiener Filtering](Figure_8.png)

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
