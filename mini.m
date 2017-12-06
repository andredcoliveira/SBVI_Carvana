%% Limpeza inicial
close all;
clc;
clear;

%% Iniciar compactos

carros(:,:,1)=im2double(rgb2gray(imread('compacto/4b74275babf7_01.jpg')));
carros(:,:,2)=im2double(rgb2gray(imread('compacto/4b74275babf7_09.jpg')));
carros(:,:,3)=im2double(rgb2gray(imread('compacto/4b74275babf7_11.jpg')));
carros(:,:,4)=im2double(rgb2gray(imread('compacto/4b74275babf7_13.jpg')));
carrosmask(:,:,1)=imread('compacto/4b74275babf7_01_mask.gif');
carrosmask(:,:,2)=imread('compacto/4b74275babf7_09_mask.gif');
carrosmask(:,:,3)=imread('compacto/4b74275babf7_11_mask.gif');
carrosmask(:,:,4)=imread('compacto/4b74275babf7_13_mask.gif');

I = carros(:,:,1);
figure; imshow(I)
title('Original');

%% Here we go again...

% smoothed = medfilt2(I, [7 7]);
smoothed = imgaussfilt(I, 1);
figure; imshow(smoothed)
title('Smoothed');

sum_rows = zeros(1, size(smoothed,1));
diff_rows = zeros(1, size(smoothed,1));
for i = 1:size(smoothed,1)
    
    sum_rows(i) = sum(smoothed(:,i));
    if(i >= 2)
        diff_rows(i) = sum_rows(i)-sum_rows(i-1);
    end
    
end

figure; plot(sum_rows)
figure; plot(diff_rows)
