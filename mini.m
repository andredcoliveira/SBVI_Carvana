%% Limpeza inicial
close all;
clc;
clear;

%% Iniciar mini
% carros(:,:,1)=im2double(rgb2gray(imread('pick_up/3cb21125f126_01.jpg')));
% carros(:,:,1)=im2double(rgb2gray(imread('pick_up/0795e132d090_05.jpg')));
% carros(:,:,1)=im2double(rgb2gray(imread('compacto/4b74275babf7_01.jpg')));
carros(:,:,1)=im2double(rgb2gray(imread('compacto/2faf504842df_01.jpg')));
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

%% Baltas try %%

% smoothed_2 = imbothat(smoothed, strel('disk', 40));
% figure;
% imshow(smoothed_2)
% smoothed_3 = im2bw(smoothed_2, graythresh(smoothed_2));
% figure;
% imshow(smoothed_3)
% g = bwmorph(smoothed_3, 'remove', 1);
% figure;
% imshow(g)
% final = bwmorph(g, 'spur', 10);
% figure;
% imshow(final)
% edge = imfilter(smoothed, fspecial('log', 5, 0.4));
% figure; imshow(edge)
% title('edge')
% egde = imopen(edge, strel('disk', 2));
% figure; imshow(edge)
% title('bothat')

smoothed_2 = imclose(smoothed, strel('line', 130, 0));
figure; imshow(smoothed_2)
title('imclose')
smoothed_3 = im2bw(smoothed_2, graythresh(smoothed_2));
figure; imshow(smoothed_3)
title('im2bw')
smoothed_4 = ~smoothed_3;
figure; imshow(smoothed_4)
title('inverse')
% D = bwdist(smoothed_4);
% figure; imshow(D)
% title('bwdist')
% L = watershed(D);
% w = L == 0;
% figure; imshow(w)
% title('watershed')
% fill = imclose(smoothed_4, strel('square', 5));
% figure; imshow(fill)
% title('imopen')


%% left / right

% smoothed_right = adapthisteq(smoothed);

% smoothed_right = imclose(smoothed, strel('line', 20, 90));
% smoothed_right = imclose(smoothed_right, strel('square', 40));
% smoothed_right = imbothat(smoothed, strel('disk', 40));
% smoothed_right = imclose(smoothed_right, strel('line', 500, 0));
% smoothed_right = imopen(smoothed_right, strel('diamond', 10));
% figure; imshow(smoothed_left)
% title('left')
% figure; imshow(smoothed_right)
% title('right')

% smoothed = imdilate(smoothed, strel('line', 40, 0));  % top
% smoothed = imdilate(smoothed, strel('disk', 35));  % bot
% figure; imshow(smoothed1)
% title('left / right')

% 
sum_rows = zeros(1, size(smoothed_4,2));

for i = 1:size(smoothed,2)

    sum_rows(i) = sum(smoothed_4(:,i));

end

figure; plot(sum_rows)
title('sum rows');
% figure; imhist(smoothed)
% title('Histograma');
figure; plot(abs(diff(sum_rows)))
title('Rows 1ª Derivada');
figure; plot(abs(diff(diff(sum_rows))))
title('Rows 2ª Derivada');

pks = findpeaks(abs(diff(diff(sum_rows))));
x1 = max(pks)
x2 = max(pks(pks<x1))
width = abs(x1-x2)



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