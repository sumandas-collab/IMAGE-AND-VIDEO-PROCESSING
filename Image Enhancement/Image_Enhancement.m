%image and video processing tutorial 1
%date: 11-02-2026
%Objective:To implement and analyze basic image enhancement techniques in spatial and frequency domains 
% using intensity transformations and histogram-based methods.
clc;
clear;
close all;

%%1. Reading an image
im = imread('peppers.png');
[M, N, C] = size(im)
image_class= class(im)
gray= rgb2gray(im);
figure;
subplot(1,2,1);
imshow(im);title('original  pepper image');
subplot(1,2,2);
imhist(gray);title('Histogram');

%%
%2. Image negative
neg= 255-im;
figure; imshow(neg); title('negative image');


%%
% 3. Log Transformation on Centered Fourier Spectrum
gray= rgb2gray(im);
F=fft2(gray);
F_shift=fftshift(F);
magnitude= abs(F_shift);
log_spectrum= log(1+magnitude);

figure;
subplot(2,2,1);
imshow(abs(F),[]);
title('Frequency Domain image');

subplot(2,2,2);
imshow(abs(F_shift),[]);
title('Using FFT Shift');

subplot(2,2,3);
imshow(magnitude,[]);
title('image without log spectrum');

subplot(2,2,4);
imshow(log_spectrum,[]);
title('image with log spectrum');


%%
%4. gamma correction on bad quality image
im2 = imread('pout.jpg');
im2_double= im2double(im2);
gamma1=0.5;
gamma2=1.5;
gamma1_corrected=im2_double.^gamma1;
gamma2_corrected=im2_double.^gamma2;

figure;
subplot(1,3,1);
imshow(im2,[]);
title('original pout image');
subplot(1,3,2);
imshow(gamma1_corrected,[]);
title('Using Gamma=0.5(brightened)');
subplot(1,3,3);
imshow(gamma2_corrected,[]);
title('Using Gamma=1.5(darkened)');

%%
%5. Histogram equalization
dark = gray*0.4;
bright = gray * 1.5;
low_contrast = imadjust(gray, [0.3 0.7], [0.4 0.6]);
high_contrast = imadjust(gray, stretchlim(gray), []);

gray_eq = histeq(gray);
dark_eq = histeq(dark);
bright_eq = histeq(bright);
low_eq = histeq(low_contrast);
high_eq = histeq(high_contrast);
figure;

% ORIGINAL
subplot(5,4,1); imshow(gray); title('Original');
subplot(5,4,2); imhist(gray); title('Original Hist');
subplot(5,4,3); imshow(gray_eq); title('Equalized');
subplot(5,4,4); imhist(gray_eq); title('Equalized Hist');

% DARK
subplot(5,4,5); imshow(dark); title('Dark');
subplot(5,4,6); imhist(dark); title('Dark Hist');
subplot(5,4,7); imshow(dark_eq); title('Equalized Dark');
subplot(5,4,8); imhist(dark_eq); title('Equalized Hist');

% BRIGHT
subplot(5,4,9); imshow(bright); title('Bright');
subplot(5,4,10); imhist(bright); title('Bright Hist');
subplot(5,4,11); imshow(bright_eq); title('Equalized Bright');
subplot(5,4,12); imhist(bright_eq); title('Equalized Hist');

% LOW CONTRAST
subplot(5,4,13); imshow(low_contrast); title('Low Contrast');
subplot(5,4,14); imhist(low_contrast); title('Low Contrast Hist');
subplot(5,4,15); imshow(low_eq); title('Equalized Low');
subplot(5,4,16); imhist(low_eq); title('Equalized Hist');

% HIGH CONTRAST
subplot(5,4,17); imshow(high_contrast); title('High Contrast');
subplot(5,4,18); imhist(high_contrast); title('High Contrast Hist');
subplot(5,4,19); imshow(high_eq); title('Equalized High');
subplot(5,4,20); imhist(high_eq); title('Equalized Hist');

%%
%5. Histogram specifications

% Read target image and convert to double
target = imread('cameraman.tif');
target = im2double(target);

% Bright source image (this is now the ONLY source)
source_double = im2double(gray);
bright_source = source_double * 1.5;

% Clip overflow
bright_source(bright_source > 1) = 1;

% Histogram specification
matched = imhistmatch(bright_source, target);

figure;

% Bright Source
subplot(3,2,1);
imshow(bright_source);
title('Bright Source Image');

subplot(3,2,2);
imhist(bright_source);
title('Histogram: Bright Source');

% Target Image
subplot(3,2,3);
imshow(target);
title('Target Image');

subplot(3,2,4);
imhist(target);
title('Histogram: Target');

% Matched Image
subplot(3,2,5);
imshow(matched);
title('Matched Image');

subplot(3,2,6);
imhist(matched);
title('Histogram: Matched Image');

%%
%7. CLAHE
clahe_img = adapthisteq(gray);
figure;

subplot(2,2,1);
imshow(gray);
title('Original Grayscale Image');

subplot(2,2,2);
imhist(gray);
title('Original Histogram');

subplot(2,2,3);
imshow(clahe_img);
title('CLAHE Enhanced Image');

subplot(2,2,4);
imhist(clahe_img);
title('CLAHE Histogram');


%grayscale image:
%size:
%class:
%put fftshift image
%try two gamma y0.5,1.5
%histogram: see dark, light, low constrast, high contrast,4x4
%hist specification: source(bright), reference(3x2)
% 3x2CLAHE
%try without built in code
%video 3-4 minutes