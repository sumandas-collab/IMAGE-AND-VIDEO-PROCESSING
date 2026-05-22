%TUTORIAL 1: MANUAL APPROACH
%IMAGE AND VIDEO PROCESSING

clc;
clear;
close all;

%% Read main image
im = imread('peppers.png');

%% EXPERIMENT 1: Reading an Input Image


% Convert to grayscale safely
if size(im,3)==3
    gray = rgb2gray(im);
else
    gray = im;
end

[M,N,C] = size(im);

fprintf('Experiment 1:\n');
fprintf('Size: %d x %d x %d\n', M,N,C);
fprintf('Class: %s\n\n', class(im));

figure;
subplot(1,2,1);
imshow(im);
title('Original Image');

subplot(1,2,2);
imhist(gray);
title('Histogram');

%% EXPERIMENT 2: Image Negative (Manual)


negative = 255 - gray;

figure;
subplot(1,2,1);
imshow(gray);
title('Original Gray');

subplot(1,2,2);
imshow(negative);
title('Negative Image');

%% EXPERIMENT 3: Log Transformation on Centered Fourier Spectrum


F = fft2(gray);
F_shift = fftshift(F);

magnitude = abs(F_shift);
log_spectrum = log(1 + magnitude);

figure;
subplot(1,3,1);
imshow(gray);
title('Gray Image');

subplot(1,3,2);
imshow(magnitude,[]);
title('Magnitude Spectrum');

subplot(1,3,3);
imshow(log_spectrum,[]);
title('Log Spectrum');

%% EXPERIMENT 4: Gamma Correction (Manual)


gray_double = im2double(gray);

gamma1 = 0.5;
gamma2 = 1.5;

gamma_img1 = gray_double.^gamma1;
gamma_img2 = gray_double.^gamma2;

figure;
subplot(1,3,1);
imshow(gray);
title('Original');

subplot(1,3,2);
imshow(gamma_img1);
title('Gamma = 0.5');

subplot(1,3,3);
imshow(gamma_img2);
title('Gamma = 1.5');


%% EXPERIMENT 5: Histogram Equalization (Manual)

L = 256;
[M,N] = size(gray);
gray_uint = uint8(gray);

histogram = zeros(1,L);

for i=1:M
    for j=1:N
        intensity = gray_uint(i,j)+1;
        histogram(intensity) = histogram(intensity) + 1;
    end
end

pdf = histogram/(M*N);
cdf = cumsum(pdf);

equalized = zeros(M,N);

for i=1:M
    for j=1:N
        equalized(i,j) = round((L-1)*cdf(gray_uint(i,j)+1));
    end
end

equalized = uint8(equalized);

figure;
subplot(2,2,1);
imshow(gray);
title('Original');

subplot(2,2,2);
imshow(equalized);
title('Equalized');

subplot(2,2,3);
imhist(gray);
title('Original Histogram');

subplot(2,2,4);
imhist(equalized);
title('Equalized Histogram');

%% EXPERIMENT 6: Histogram Specification (Manual)


target = imread('cameraman.tif');

% Convert safely to grayscale if needed
if size(target,3)==3
    target = rgb2gray(target);
end

target_uint = uint8(target);

% Source histogram already computed above
target_hist = zeros(1,L);

for i=1:size(target_uint,1)
    for j=1:size(target_uint,2)
        target_hist(target_uint(i,j)+1) = target_hist(target_uint(i,j)+1)+1;
    end
end

target_pdf = target_hist/numel(target_uint);
target_cdf = cumsum(target_pdf);

mapping = zeros(1,L);

for i=1:L
    diff = abs(cdf(i) - target_cdf);
    [~,ind] = min(diff);
    mapping(i) = ind-1;
end

matched = zeros(M,N);

for i=1:M
    for j=1:N
        matched(i,j) = mapping(gray_uint(i,j)+1);
    end
end

matched = uint8(matched);

figure;
subplot(3,2,1);
imshow(gray);
title('Source Image');

subplot(3,2,3);
imshow(target);
title('Target Image');

subplot(3,2,5);
imshow(matched);
title('Matched Image');

subplot(3,2,2);
imhist(gray);
title('Source Histogram');

subplot(3,2,4);
imhist(target);
title('Target Histogram');

subplot(3,2,6);
imhist(matched);
title('Matched Histogram');

%% EXPERIMENT 7: CLAHE (Manual Implementation)


gray_norm = im2double(gray);

tiles = 8;
tileM = floor(M/tiles);
tileN = floor(N/tiles);

clahe_img = zeros(M,N);

clipLimit = 0.01;

for tx=1:tiles
    for ty=1:tiles
        
        r1=(tx-1)*tileM+1;
        r2=min(tx*tileM,M);
        
        c1=(ty-1)*tileN+1;
        c2=min(ty*tileN,N);
        
        tile = gray_norm(r1:r2,c1:c2);
        tile_uint = floor(tile*255);
        
        hist_tile = zeros(1,L);
        
        for k=1:numel(tile_uint)
            hist_tile(tile_uint(k)+1)=hist_tile(tile_uint(k)+1)+1;
        end
        
        maxPix = clipLimit*numel(tile_uint);
        excess = 0;
        
        for i=1:L
            if hist_tile(i)>maxPix
                excess=excess+(hist_tile(i)-maxPix);
                hist_tile(i)=maxPix;
            end
        end
        
        hist_tile = hist_tile + excess/L;
        
        cdf_tile = cumsum(hist_tile);
        cdf_tile = cdf_tile/max(cdf_tile);
        
        result_tile=zeros(size(tile_uint));
        
        for k=1:numel(tile_uint)
            result_tile(k)=cdf_tile(tile_uint(k)+1);
        end
        
        clahe_img(r1:r2,c1:c2)=result_tile;
        
    end
end

figure;
subplot(1,2,1);
imshow(gray);
title('Original Image');

subplot(1,2,2);
imshow(clahe_img);
title('CLAHE Image (Manual)');
