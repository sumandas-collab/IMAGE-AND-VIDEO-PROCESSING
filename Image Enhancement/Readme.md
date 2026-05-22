# Tutorial 01 - Image Enhancement using MATLAB

## Overview

This project implements fundamental image enhancement techniques using MATLAB in both:

- Built-in MATLAB Functions
- Manual Algorithm Implementations

The tutorial covers:
- Intensity transformations
- Histogram processing
- Frequency-domain enhancement
- Adaptive histogram methods

---

# Objective

To understand and implement basic image enhancement techniques in:
- Spatial domain
- Frequency domain

using both built-in and manual MATLAB methods.

---

# Technologies Used

- MATLAB
- Image Processing Toolbox
- FFT
- Histogram Processing
- Spatial Domain Enhancement

---

# Experiments Included

| Experiment | Description |
|---|---|
| Experiment 1 | Reading an Input Image |
| Experiment 2 | Image Negative |
| Experiment 3 | Log Fourier Spectrum |
| Experiment 4 | Gamma Correction |
| Experiment 5 | Histogram Equalization |
| Experiment 6 | Histogram Specification |
| Experiment 7 | CLAHE |

---

# Experiment 1 - Reading an Input Image

## Objective
To analyze image size, channels, datatype, and histogram.

---

## Built-in MATLAB Result

<img width="1344" height="808" alt="USING_FUNCTION_EX1" src="https://github.com/user-attachments/assets/a46b6cd5-32d7-4c4e-a9c5-911c227444b8" />


---

## Manual MATLAB Result

<img width="1344" height="808" alt="MANUAL_EX1" src="https://github.com/user-attachments/assets/2a53ad51-ec26-4f4e-be72-a978d68128f9" />


---

### Observations
- Image size: 384 × 512 × 3
- RGB image with uint8 datatype
- Histogram concentrated around mid-intensity region

---

# Experiment 2 - Image Negative

## Objective
To perform image intensity inversion.

Transformation:

:contentReference[oaicite:0]{index=0}

---

## Built-in MATLAB Result

<img width="1344" height="808" alt="USING_FUNCTION_EX2" src="https://github.com/user-attachments/assets/fe8fccdd-da0c-4a87-a6f7-f05a569a9cf3" />


---

## Manual MATLAB Result

<img width="1344" height="808" alt="MANUAL_EX2" src="https://github.com/user-attachments/assets/d0000b5c-478a-46f5-80fe-5928da497124" />


---

### Observations
- Bright regions become dark
- Dark regions become bright
- Contrast inversion achieved
- Manual result matches built-in output

---

# Experiment 3 - Log Transformation on Fourier Spectrum

## Objective
To visualize frequency-domain image components.

Transformation:

:contentReference[oaicite:1]{index=1}

---

## Built-in MATLAB Result

<img width="1344" height="808" alt="USING_FUNCTION_EX3" src="https://github.com/user-attachments/assets/28e265ff-8fd7-43c5-bec5-9f03877cbb11" />


---

## Manual MATLAB Result

<img width="1344" height="808" alt="MANUAL_EX3" src="https://github.com/user-attachments/assets/7503bcf3-3948-45a9-aa85-85406ed06d17" />


---

### Observations
- Low-frequency components centered
- FFT shift improves visualization
- Log scaling enhances spectrum visibility

---

# Experiment 4 - Gamma Correction

## Objective
To adjust image brightness using nonlinear transformation.

Transformation:

:contentReference[oaicite:2]{index=2}

---

## Built-in MATLAB Result

<img width="1344" height="808" alt="USING_FUNCTION_EX4" src="https://github.com/user-attachments/assets/912178a2-7dfe-4702-81b2-4a8c4caca588" />


---

## Manual MATLAB Result

<img width="1344" height="808" alt="MANUAL_EX4" src="https://github.com/user-attachments/assets/de3886cc-76ec-49b7-9f02-21fa466d292f" />


---

### Observations
- Gamma < 1 brightens image
- Gamma > 1 darkens image
- Nonlinear enhancement achieved

---

# Experiment 5 - Histogram Equalization

## Objective
To improve global image contrast using histogram equalization.

---

## Built-in MATLAB Result

<img width="1344" height="808" alt="USING_FUNCTION_EX5" src="https://github.com/user-attachments/assets/38d185cb-f243-4351-9014-c5267acbaafd" />


---

## Manual MATLAB Result

<img width="1344" height="808" alt="MANUAL_EX5" src="https://github.com/user-attachments/assets/530d0e0d-1d71-410b-a5e5-833034b89cbc" />


---

### Observations
- Histogram spreads across full intensity range
- Contrast significantly improved
- Manual CDF implementation comparable to built-in method

---

# Experiment 6 - Histogram Specification

## Objective
To match source image histogram with target histogram.

---

## Built-in MATLAB Result

<img width="1344" height="808" alt="USING_FUNCTION_EX6" src="https://github.com/user-attachments/assets/f2af8a5c-3792-468b-9ae0-f8eeccad9a8b" />


---

## Manual MATLAB Result

<img width="1344" height="808" alt="MANUAL_EX6" src="https://github.com/user-attachments/assets/b3972538-0608-4e01-b4dc-216532982fe4" />


---

### Observations
- Histogram distribution resembles target image
- Controlled contrast enhancement achieved
- Manual implementation successful

---

# Experiment 7 - CLAHE

## Objective
To improve local contrast while limiting noise amplification.

---

## Built-in MATLAB Result

<img width="1344" height="808" alt="USING_FUNCTION_EX7" src="https://github.com/user-attachments/assets/07f5fb58-cc44-44f0-beaa-70ffb4a51e4d" />


---

## Manual MATLAB Result

<img width="1344" height="808" alt="MANUAL_EX7" src="https://github.com/user-attachments/assets/57fbf5b6-56f9-4988-a57a-af1b2cd1d28b" />


---

### Observations
- Local contrast significantly improved
- Noise amplification reduced
- Manual tile-based CLAHE works effectively

---

# MATLAB Files

| File | Description |
|---|---|
| Ex1.m | Built-in MATLAB implementation |
| EX1_2.m | Manual MATLAB implementation |
| report.pdf | Complete tutorial report |

Built-in code includes:
- Histogram equalization
- FFT analysis
- CLAHE
- Gamma correction

:contentReference[oaicite:3]{index=3}

Manual implementation includes:
- Manual histogram equalization
- Manual histogram specification
- Manual CLAHE
- Manual gamma correction

:contentReference[oaicite:4]{index=4}

---

# Learning Outcomes

This tutorial helped in understanding:
- Spatial domain enhancement
- Frequency domain analysis
- Histogram processing
- Adaptive histogram enhancement
- Manual image processing implementation

---

# Applications

These techniques are widely used in:
- Medical imaging
- Remote sensing
- Computer vision
- Surveillance systems
- Satellite image enhancement

---

# Conclusion

Seven fundamental image enhancement techniques were implemented using:
- MATLAB built-in functions
- Manual algorithms

The outputs from manual implementations closely matched MATLAB built-in functions, strengthening understanding of image enhancement concepts.

:contentReference[oaicite:5]{index=5}

---

# Author

Suman Das  
M.Tech, IIT Bhubaneswar
