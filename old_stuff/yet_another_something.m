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
figure; imshow(I)
title('Original');

%% Here we go again...

smoothed = adapthisteq(imgaussfilt(I, 0.3));
figure; imshow(smoothed)
title('Smoothed');


% for i = 1:10
%     figure;
%     tmp = imclose(smoothed, strel('line', 140 + (i-1)*10, 0));
%     imshow(tmp)
%     
%     figure;
%     subplot(1,5,1);
%     imshow(tmp)
%     for j = 1:4
%         subplot(1,5,j+1);
%         tmp2 = edge(tmp, 'Sobel', 0.04*j ,'vertical');
%         imshow(tmp2)
%         title(['Vertical - ' num2str(0.04*j,'%2.2d')]);
%     end
%     
%     figure; 
%     subplot(1,5,1);
%     imshow(tmp)
%     for j = 1:4
%         subplot(1,5,j+1);
%         tmp2 = edge(tmp, 'Sobel', 0.04*j,'Both');
%         imshow(tmp2)
%         title(['Both - ' num2str(0.04*j,'%2.2d')]);
%     end
% end

for i = 2:2
    
    test = 20*i+110;
    
    tmp = imclose(smoothed, strel('line', test, 0));
    figure; imshow(tmp)
    title(['Close - ' num2str(test,'%02d')]);
    
%     figure;
%     tmp2 = imbothat(tmp, strel('disk', test, 0));
%     imshow(tmp2)
%     title(['close ' num2str(80+(20*i-20),'%02d') ' bot ' num2str(test,'%02d')]);
%     
%     figure;
%     tmp2 = imtophat(tmp, strel('disk', test, 0));
%     imshow(tmp2)
%     title(['close ' num2str(80+(20*i-20),'%02d') ' top ' num2str(test,'%02d')]);
%     
%     figure;
%     tmp2 = imopen(tmp, strel('disk', test, 0));
%     imshow(tmp2)
%     title(['close ' num2str(80+(20*i-20),'%02d') ' open ' num2str(test,'%02d')]);

%     tmp = histeq(tmp);
%     tmp = adapthisteq(tmp);
% 
%     figure; imshow(tmp);
%     title('Histeq');

    for j = 5:5
%         figure; subplot(1,2,1);
%         test = j*2;
%         tmp2 = imclose(tmp, strel('diamond', test));
%         figure;
%         imshow(tmp2)
%         title(['close ' num2str(80+(20*i-20),'%02d') ' close ' num2str(test,'%02d')]);
        
%         subplot(1,2,2);
        tmp3 = medfilt2(tmp, [10 10]);
        figure;
        imshow(tmp3);
        title('Test')
        
        sum_col = zeros(1, size(tmp3,1));
        sum_col(:) = sum(tmp3(:,1:size(tmp3,1)));
        
    end

end
