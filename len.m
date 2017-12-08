%% Limpeza inicial
close all;
clc;
clear;

%% Iniciar mini
% carros(:,:,1)=im2double(rgb2gray(imread('pick_up/3cb21125f126_01.jpg')));
% carros(:,:,1)=im2double(rgb2gray(imread('pick_up/0795e132d090_05.jpg')));
carros(:,:,1)=im2double(rgb2gray(imread('compacto/4b74275babf7_01.jpg')));
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

%% Smoothing
smoothed = medfilt2(I, [5 5]);
% smoothed = imgaussfilt(I, 2);

%% Cleaning letters
smoothed_2 = imclose(smoothed, strel('line', 130, 0));
figure; imshow(smoothed_2)
title('imclose')

smoothed_2 = imadjust(smoothed_2);
figure; imshow(smoothed_2)
title('adapthisteq')

smoothed_3 = smoothed_2 < 0.65;
% smoothed_3 = im2bw(smoothed_2, 0.2);
figure; imshow(smoothed_3)
title('im2bw')

% smoothed_4 = ~smoothed_2;
% figure; imshow(smoothed_4)
% title('inverse')

final = smoothed_2;

%% Calculate the derivative - Width
sum_rows = zeros(1, size(final,2));
for i = 1:size(final,2)

    sum_rows(i) = sum(final(:,i));

end

figure; plot(sum_rows)
title('sum rows');
% figure; imhist(final)
% title('Histograma');

figure; plot(abs(diff(sum_rows)))
title('Rows 1ª Derivada');

second_diff_rows = abs(diff(diff(sum_rows)));
figure; plot(second_diff_rows)
title('Rows 2ª Derivada');

[left right] = borders(second_diff_rows);

%% Calculate the derivative - Height

sum_cols = zeros(1, size(final,1));
for i = 1:size(final,1)

    sum_cols(i) = sum(final(i,:));

end
figure; plot(sum_cols)
title('sum cols');
% figure; imhist(final)
% title('Histograma');

figure; plot(abs(diff(sum_cols)))
title('Cols 1ª Derivada');

second_diff_cols = abs(diff(diff(sum_cols)));
figure; plot(second_diff_cols)
title('Cols 2ª Derivada');

[top bottom] = borders(second_diff_cols);

%% Function that calculate length (height and width)
function [first second] = borders(second_diff)
    [x,y] = findpeaks(second_diff);
    max = 0;
    for i=1:size(x,2)
        aux = x(i);
        if(aux > max)
            max = aux;
            index = i;
        end
    end
    x1 = y(index);
    x(index) = 0;
    max = 0;
    for j=1:0.2*size(x,2)
        k = index + j;
        x(k) = 0;
        k = index - j;
        x(k) = 0;
    end
    for i=1:size(x,2)
        aux = x(i);
        if(aux > max)
            max = aux;
            index = i;
        end
    end
    x2 = y(index);
    if (x1 > x2)
        first = x2;
        second = x1;
    else
        first = x1;
        second = x2;
    end
    
    % first - left & top
    % second - right & bottom
end
