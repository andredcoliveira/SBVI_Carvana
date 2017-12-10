%% Limpeza inicial
close all;
clc;
clear;

%% Iniciar compactos

carros(:,:,1)=im2double(rgb2gray(imread('compacto/2faf504842df_01.jpg')));
carros(:,:,2)=im2double(rgb2gray(imread('compacto/2faf504842df_05.jpg')));
carros(:,:,3)=im2double(rgb2gray(imread('compacto/2faf504842df_09.jpg')));
carros(:,:,4)=im2double(rgb2gray(imread('compacto/2faf504842df_11.jpg')));
carrosmask(:,:,1)=imread('compacto/2faf504842df_01_mask.gif');
carrosmask(:,:,2)=imread('compacto/2faf504842df_05_mask.gif');
carrosmask(:,:,3)=imread('compacto/2faf504842df_09_mask.gif');
carrosmask(:,:,4)=imread('compacto/2faf504842df_11_mask.gif');

I = carros(:,:,1);
figure
imshow(I)
title('I')

%% Here we go again...

smoothed = imgaussfilt(I, 0.9);
figure; imshow(smoothed)

figure;

subplot(1,2,1)
sobelele = edge(I, 'Sobel', 0.05, 'both');
imshow(sobelele)

subplot(1,2,2)
kanye = edge(sobelele, 'Canny', 0.2, 0.9);
imshow(kanye)

figure;
imshow(imfill(sobelele))
figure;
imshow(imfill(kanye))