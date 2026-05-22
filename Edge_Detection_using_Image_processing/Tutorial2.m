clc;
clear;
close all;
%%1. Laplacian of Gaussian(LoG) edge detection
% Step 1: Read the image
img = imread('cameraman.tif'); % You can replace with your own image
img = im2gray(img);            % Ensure grayscale
img = im2double(img);          % Convert to double

% Step 2: Display original image
figure;
sgtitle('1. Laplacian of Gaussian (LoG) Edge Detection ');

subplot(2,2,1);
imshow(img);
title('Original Image');

% Step 3: Apply Gaussian smoothing
sigma = 2; % Standard deviation (can tune this)
smoothed_img = imgaussfilt(img, sigma);

subplot(2,2,2);
imshow(smoothed_img);
title('Gaussian Smoothed Image');

% Step 4: Apply Laplacian filter
laplacian_filter = fspecial('laplacian', 0.2); % alpha = 0.2
log_img = imfilter(smoothed_img, laplacian_filter, 'replicate');

subplot(2,2,3);
imshow(log_img, []);
title('Laplacian Output');

% Step 5: Zero-crossing detection (edge detection)
edges = edge(smoothed_img, 'log');

subplot(2,2,4);
imshow(edges);
title('LoG Edge Detection');

%% 2. canny Edge detection

% Step 1: Read the image
img = imread('cameraman.tif'); % Replace with your own image if needed
img = im2gray(img);            % Ensure grayscale
img = im2double(img);          % Convert to double

% Step 2: Display original image
figure;
sgtitle('2. Canny Edge Detection ');

subplot(1,2,1);
imshow(img);
title('Original Image');

% Step 3: Apply Canny Edge Detection
% You can tune thresholds and sigma
low_thresh = 0.1;
high_thresh = 0.3;
sigma = 1;

edges = edge(img, 'canny', [low_thresh high_thresh], sigma);

% Step 4: Display edges
subplot(1,2,2);
imshow(edges);
title('Canny Edge Detection');

%% 3. High Boost Filtering

% Step 1: Read the image
img = imread('cameraman.tif'); % Replace if needed
img = im2gray(img);            
img = im2double(img);          

% Step 2: Display original image
figure;
sgtitle('3. High Boost Filtering ');

subplot(2,2,1);
imshow(img);
title('Original Image');

% Step 3: Apply Gaussian smoothing (Low-pass)
sigma = 1.5;
low_pass = imgaussfilt(img, sigma);

subplot(2,2,2);
imshow(low_pass);
title('Low-pass (Blurred Image)');

% Step 4: Obtain High-frequency components
high_freq = img - low_pass;

subplot(2,2,3);
imshow(high_freq, []);
title('High-frequency Components');

% Step 5: High Boost Filtering
k = 1.5; % Boost factor (k > 1)
high_boost = img + k * high_freq;

subplot(2,2,4);
imshow(high_boost);
title(['High Boost Filtered Image (k = ', num2str(k), ')']);

%% 4. Gaussian Low Pass Filtering(Frequency Domain)

% Step 1: Read the image
img = imread('cameraman.tif'); % Replace if needed
img = im2gray(img);
img = im2double(img);

% Step 2: Get image size
[M, N] = size(img);

% Step 3: Fourier Transform
F = fft2(img);
F_shifted = fftshift(F);

% Step 4: Create Gaussian LPF mask
D0 = 30; % Cutoff frequency (tune this)

[u, v] = meshgrid(-floor(N/2):floor(N/2)-1, -floor(M/2):floor(M/2)-1);
D = sqrt(u.^2 + v.^2);

H = exp(-(D.^2) / (2 * (D0^2))); % Gaussian LPF

% Step 5: Apply filter in frequency domain
G = H .* F_shifted;

% Step 6: Inverse Fourier Transform
G_ishift = ifftshift(G);
img_filtered = real(ifft2(G_ishift));

% Step 7: Display results
figure;
sgtitle('4. Gaussian Low Pass Filtering (Frequency Domain) ');

subplot(2,2,1);
imshow(img);
title('Original Image');

subplot(2,2,2);
imshow(log(1 + abs(F_shifted)), []);
title('Magnitude Spectrum');

subplot(2,2,3);
imshow(H, []);
title('Gaussian LPF Mask');

subplot(2,2,4);
imshow(img_filtered, []);
title(['Filtered Image (D0 = ', num2str(D0), ')']);

%% 5. Opening and Closing on Fingerprint Image Objective

% Step 1: Read fingerprint image
img = imread('Fingerprint.png'); % Use your fingerprint image
img = im2gray(img);
img = im2double(img);

% Step 2: Convert to binary (important for morphology)
bw = imbinarize(img);

% Step 3: Define structuring element
se = strel('disk', 2); % You can change size

% Step 4: Perform Opening (Erosion followed by Dilation)
opening = imopen(bw, se);

% Step 5: Perform Closing (Dilation followed by Erosion)
closing = imclose(bw, se);

% Step 6: Display results
figure;
sgtitle('5. Opening and Closing on Fingerprint Image');

subplot(2,2,1);
imshow(img);
title('Original Fingerprint Image');

subplot(2,2,2);
imshow(bw);
title('Binary Image');

subplot(2,2,3);
imshow(opening);
title('After Opening');

subplot(2,2,4);
imshow(closing);
title('After Closing');

%% 6.  Motion Deblurring using Inverse Filtering 

% Step 1: Read the image
img = imread('cameraman.tif'); % Replace if needed
img = im2gray(img);
img = im2double(img);

% Step 2: Create Motion Blur (Degradation)
len = 15;      % Length of motion
theta = 30;    % Angle of motion

PSF = fspecial('motion', len, theta); % Point Spread Function
blurred = imfilter(img, PSF, 'conv', 'circular');

% Step 3: Fourier Transform
F_blurred = fft2(blurred);
H = fft2(PSF, size(img,1), size(img,2));

% Step 4: Inverse Filtering
% Avoid division by zero
epsilon = 1e-3;
H(abs(H) < epsilon) = epsilon;

F_restored = F_blurred ./ H;

% Step 5: Inverse FFT
restored = real(ifft2(F_restored));

% Step 6: Display results
figure;
sgtitle('6. Motion Deblurring using Inverse Filtering ');
subplot(1,3,1);
imshow(img);
title('Original Image');

subplot(1,3,2);
imshow(blurred);
title('Motion Blurred Image');

subplot(1,3,3);
imshow(restored, []);
title('Restored Image (Inverse Filter)');

%% 7. Radially Limited Inverse Filtering Objective

% Step 1: Read the image
img = imread('cameraman.tif'); % Replace if needed
img = im2gray(img);
img = im2double(img);

% Step 2: Create motion blur (Degradation)
len = 15;
theta = 30;
PSF = fspecial('motion', len, theta);

blurred = imfilter(img, PSF, 'conv', 'circular');

% Step 3: Fourier Transform
[M, N] = size(img);
G = fft2(blurred);
H = fft2(PSF, M, N);

% Step 4: Create radial mask
D0 = 50; % Radius limit (cutoff frequency)

[u, v] = meshgrid(-floor(N/2):floor(N/2)-1, -floor(M/2):floor(M/2)-1);
D = sqrt(u.^2 + v.^2);

mask = double(D <= D0); % 1 inside radius, 0 outside

% Shift mask to match FFT
mask = ifftshift(mask);

% Step 5: Radially Limited Inverse Filtering
epsilon = 1e-3;
H(abs(H) < epsilon) = epsilon;

F_restored = (G ./ H) .* mask;

% Step 6: Inverse FFT
restored = real(ifft2(F_restored));

% Step 7: Display results
figure;
sgtitle('7. Radially Limited Inverse Filtering ');
subplot(2,2,1);
imshow(img);
title('Original Image');

subplot(2,2,2);
imshow(blurred);
title('Blurred Image');

subplot(2,2,3);
imshow(mask, []);
title('Radial Mask');

subplot(2,2,4);
imshow(restored, []);
title(['Restored Image (D0 = ', num2str(D0), ')']);

%% 8. Wiener Filtering Objective
% Step 1: Read the image
img = imread('cameraman.tif'); % Replace if needed
img = im2gray(img);
img = im2double(img);

% Step 2: Create motion blur (Degradation)
len = 15;
theta = 30;
PSF = fspecial('motion', len, theta);

blurred = imfilter(img, PSF, 'conv', 'circular');

% Step 3: Add noise (optional but realistic)
noise_var = 0.001;
noisy_blurred = imnoise(blurred, 'gaussian', 0, noise_var);

% Step 4: Wiener Filtering
NSR = noise_var / var(img(:)); % Noise-to-Signal Ratio

restored = deconvwnr(noisy_blurred, PSF, NSR);

% Step 5: Display results
figure;
sgtitle('8. Wiener Filtering ');
subplot(2,2,1);
imshow(img);
title('Original Image');

subplot(2,2,2);
imshow(noisy_blurred);
title('Blurred + Noisy Image');

subplot(2,2,3);
imshow(restored);
title('Restored Image (Wiener Filter)');

subplot(2,2,4);
imshow(abs(img - restored), []);
title('Error Image');

