%% Limpeza inicial
close all;
clc;
clear;

%% Iniciar mini
% carros(:,:,1)=im2double(rgb2gray(imread('pick_up/3cb21125f126_01.jpg')));
carros(:,:,1)=im2double(rgb2gray(imread('pick_up/0795e132d090_05.jpg')));
% carros(:,:,1)=im2double(rgb2gray(imread('compacto/4b74275babf7_01.jpg')));
% carros(:,:,1)=im2double(rgb2gray(imread('compacto/2faf504842df_01.jpg')));
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

smoothed = medfilt2(I, [5 5]);
% smoothed = imgaussfilt(I, 2);

%% left / right

% smoothed_right = adapthisteq(smoothed);

% smoothed_right = imclose(smoothed, strel('line', 20, 90));
% smoothed_right = imclose(smoothed_right, strel('square', 40));
smoothed_right = imbothat(smoothed, strel('disk', 40));
smoothed_right = imclose(smoothed_right, strel('line', 500, 0));
% smoothed_right = imopen(smoothed_right, strel('diamond', 10));
% figure; imshow(smoothed_left)
% title('left')
figure; imshow(smoothed_right)
title('right')

% smoothed = imdilate(smoothed, strel('line', 40, 0));  % top
% smoothed = imdilate(smoothed, strel('disk', 35));  % bot
% figure; imshow(smoothed1)
% title('left / right')


sum_rows = zeros(1, size(smoothed_right,2));

for i = 1:size(smoothed,2)

    sum_rows(i) = sum(smoothed_right(:,i));

end

% figure; plot(sum_rows)
% title('sum rows');
% figure; imhist(smoothed)
% title('Histograma');
figure; plot(abs(diff(sum_rows)))
title('Rows 1ª Derivada');
figure; plot(abs(diff(diff(sum_rows))))
title('Rows 2ª Derivada');
% 
% 
% sum_cols = zeros(1, size(smoothed,1));

% for i = 1:size(smoothed,1)
% 
%     sum_cols(i) = sum(smoothed(i,:));
% 
% end

% figure; plot(sum_cols)
% title('sum cols');
% figure; imhist(smoothed)
% title('Histograma');
% figure; plot(abs(diff(sum_cols)))
% title('Cols 1ª Derivada');
% figure; plot(abs(diff(diff(sum_cols))))
% title('Cols 2ª Derivada');



%% top / bottom


% smoothed = imclose(smoothed, strel('line', 150, 0));  % top
% smoothed = imdilate(smoothed, strel('disk', 35));  % bot
% figure; imshow(smoothed)
% title('top / bottom')
% smoothed = imerode(smoothed, strel('disk', 5));
% smoothed = adapthisteq(smoothed);
% figure; imshow(smoothed)
% title('open')

% sum_rows = zeros(1, size(smoothed,2));
% 
% for i = 1:size(smoothed,2)
% 
%     sum_rows(i) = sum(smoothed(:,i));
% 
% end

% figure; plot(sum_rows)
% title('sum rows');
% figure; imhist(smoothed)
% title('Histograma');
% figure; plot(abs(diff(sum_rows)))
% title('Rows 1ª Derivada');
% figure; plot(abs(diff(diff(sum_rows))))
% title('Rows 2ª Derivada');

% 
% sum_cols = zeros(1, size(smoothed,1));
% 
% for i = 1:size(smoothed,1)
% 
%     sum_cols(i) = sum(smoothed(i,:));
% 
% end

% figure; plot(sum_cols)
% title('sum cols');
% figure; imhist(smoothed)
% title('Histograma');
% figure; plot(abs(diff(sum_cols)))
% title('Cols 1ª Derivada');
% figure; plot(abs(diff(diff(sum_cols))))
% title('Cols 2ª Derivada');