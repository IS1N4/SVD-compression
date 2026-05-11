clc;
clear;
close all;

I_color = imread('coverw.jpg');  

I = rgb2gray(I_color);
I = im2double(I);

figure;
imshow(I);
title('Original Grayscale Image');

[U,S,V] = svd(I);

k_values = [1, 3, 7, 12];

figure('Name','SVD Compression - Grayscale');

for i = 1:length(k_values)
    k = k_values(i);

    I_approx = U(:,1:k) * S(1:k,1:k) * V(:,1:k)';

    subplot(2,2,i);
    imshow(I_approx);
    colormap('gray');  
    title(['k = ' num2str(k)]);
end

for i = 1:length(k_values)
    k = k_values(i);
    original_size = numel(I);
    compressed_size = k * (size(I,1) + size(I,2) + 1);
    ratio = original_size / compressed_size;
    fprintf('k = %d → approx. compression ratio: %.2f\n', k, ratio);
end
