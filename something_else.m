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

%% Real attempt at this shit
I2 = imgaussfilt(I, 0.9);

I3 = imbothat(I2, strel('disk', 50));
figure; imshow(I3)
title('I3')

I4 = imbinarize(I2, 0.41);
I4_1 = I2 < 0.41;
figure; subplot(2,1,1); imshow(I4)
title('I2');
subplot(2,1,2); imshow(I4_1)
title('I4_1');

I3_binarized = imbinarize(I3, 0.2);
figure; imshow(I3_binarized)
title('I3_binarized');

letters_1 = imsubtract(I3_binarized, I4_1);
figure; imshow(letters_1)
title('letters_1');

letters_2 = bwareaopen(letters_1, 1000);
figure; imshow(letters_2)

row_sum = sum(letters_2, 2);

% try removing rows with little content (aka not letters)
for i = 1:size(letters_2, 1)
   if(sum(letters_2(i,:)) < 0.10*row_sum(i))
       letters_2(i,:) = 0;
   end
end

figure; imshow(letters_2)