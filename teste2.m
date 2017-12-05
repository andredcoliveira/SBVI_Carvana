%%%%% Iniciar compactos %%%%%
carros(:,:,1)=im2double(rgb2gray(imread('compacto/2faf504842df_01.jpg')));
carros(:,:,2)=im2double(rgb2gray(imread('compacto/2faf504842df_05.jpg')));
carros(:,:,3)=im2double(rgb2gray(imread('compacto/2faf504842df_09.jpg')));
carros(:,:,4)=im2double(rgb2gray(imread('compacto/2faf504842df_11.jpg')));
carrosmask(:,:,1)=imread('compacto/2faf504842df_01_mask.gif');
carrosmask(:,:,2)=imread('compacto/2faf504842df_05_mask.gif');
carrosmask(:,:,3)=imread('compacto/2faf504842df_09_mask.gif');
carrosmask(:,:,4)=imread('compacto/2faf504842df_11_mask.gif');

close all;
I = carros(:,:,1);
%% Thresholding %%
carros_white = I < 0.3;
carros_black = I > 0.75;
carros_dif = carros_white - carros_black;
carros_smooth = I > 0.82;
% imshow(carros_smooth)
% imshow(carros_dif)

%% Clear with open + close %%
% se = strel('square', 20);
% fo = imopen(I,se);
% fc = imclose(fo, se);
% figure
% imshow(fc)

%% Gaussian filter - Remove Noise By Adaptive Filtering %%
% J = imnoise(carros(:,:,1), 'gaussian', 0, 0.025);
% imshow(J);
% title('Portion of the Image with Added Gaussian Noise');
% K = wiener2(J,[5 5]);
% imshow(K);

%% Remove Noise Using an Averaging Filter and a Median Filter %%
J = imnoise(I,'salt & pepper',0.02);
Kaverage = filter2(fspecial('average',3),J);
Kmedian = medfilt2(J);
% Kgaussian = imfilter(carros_dif, fspecial('gaussian', 3, 0.5), 'replicate');
Kgaussian = imgaussfilt(carros_dif);
Klaplacian = imfilter(carros_dif, fspecial('laplacian', 0.5), 'replicate');
Klog = imfilter(carros_dif, fspecial('log', 5, 0.5), 'replicate');
figure
% imshow(Klaplacian)
figure
imshowpair(I,Kgaussian,'montage')
figure
% imshow(Kgaussian)
%% Edge Detection %%
Kedge = edge(I,'sobel', 0.03);
figure
imshow(Kedge)

%% Trying to get out the text %% 
% g = imfill(Kedge, 'holes');
% imshow(g)