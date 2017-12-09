clc
clear
close all;

%% Iniciar compactos  %%

% traseira
carros_back(:,:,1)=im2double(rgb2gray(imread('compacto/2faf504842df_09.jpg')));
carros_back(:,:,2)=im2double(rgb2gray(imread('compacto/4b74275babf7_09.jpg')));
carros_back(:,:,3)=im2double(rgb2gray(imread('compacto/47ea8f25c948_09.jpg')));
carros_back(:,:,4)=im2double(rgb2gray(imread('compacto/898339fab87a_09.jpg')));

% frente
carros_front(:,:,1)=im2double(rgb2gray(imread('compacto/2faf504842df_01.jpg')));
carros_front(:,:,2)=im2double(rgb2gray(imread('compacto/4b74275babf7_01.jpg')));
carros_front(:,:,3)=im2double(rgb2gray(imread('compacto/47ea8f25c948_01.jpg')));
carros_front(:,:,4)=im2double(rgb2gray(imread('compacto/898339fab87a_01.jpg')));

%% Iniciar pick_up %%

% traseira
carros_back(:,:,5)=im2double(rgb2gray(imread('pick_up/0ed6904e1004_09.jpg')));
carros_back(:,:,6)=im2double(rgb2gray(imread('pick_up/3cb21125f126_09.jpg')));
carros_back(:,:,7)=im2double(rgb2gray(imread('pick_up/0795e132d090_09.jpg')));

% frente
carros_front(:,:,5)=im2double(rgb2gray(imread('pick_up/0ed6904e1004_01.jpg')));
carros_front(:,:,6)=im2double(rgb2gray(imread('pick_up/3cb21125f126_01.jpg')));
carros_front(:,:,7)=im2double(rgb2gray(imread('pick_up/0795e132d090_01.jpg')));

%% Iniciar sedan %%

% traseira
carros_back(:,:,8)=im2double(rgb2gray(imread('sedan/1ae8a68a40e4_09.jpg')));
carros_back(:,:,9)=im2double(rgb2gray(imread('sedan/2ea62c1beee7_09.jpg')));
carros_back(:,:,10)=im2double(rgb2gray(imread('sedan/5fb012d30fd9_09.jpg')));
carros_back(:,:,11)=im2double(rgb2gray(imread('sedan/7fbc761387f3_09.jpg')));
carros_back(:,:,12)=im2double(rgb2gray(imread('sedan/34b0c08544a5_09.jpg')));

% frente
carros_front(:,:,8)=im2double(rgb2gray(imread('sedan/1ae8a68a40e4_01.jpg')));
carros_front(:,:,9)=im2double(rgb2gray(imread('sedan/2ea62c1beee7_01.jpg')));
carros_front(:,:,10)=im2double(rgb2gray(imread('sedan/5fb012d30fd9_01.jpg')));
carros_front(:,:,11)=im2double(rgb2gray(imread('sedan/7fbc761387f3_01.jpg')));
carros_front(:,:,12)=im2double(rgb2gray(imread('sedan/34b0c08544a5_01.jpg')));

%% Iniciar SUV %%

% traseira
carros_back(:,:,13)=im2double(rgb2gray(imread('SUV/3d7a1030deeb_09.jpg')));
carros_back(:,:,14)=im2double(rgb2gray(imread('SUV/4fc2470c0f7b_09.jpg')));
carros_back(:,:,15)=im2double(rgb2gray(imread('SUV/54ee69d7d5e5_09.jpg')));
carros_back(:,:,16)=im2double(rgb2gray(imread('SUV/630335e37f40_09.jpg')));

% frente
carros_front(:,:,13)=im2double(rgb2gray(imread('SUV/3d7a1030deeb_01.jpg')));
carros_front(:,:,14)=im2double(rgb2gray(imread('SUV/4fc2470c0f7b_01.jpg')));
carros_front(:,:,15)=im2double(rgb2gray(imread('SUV/54ee69d7d5e5_01.jpg')));
carros_front(:,:,16)=im2double(rgb2gray(imread('SUV/630335e37f40_01.jpg')));

%% Iniciar mask compactos %%

% traseira
gt_back(:,:,1)= imread('compacto/2faf504842df_09_mask.gif');
gt_back(:,:,2)= imread('compacto/4b74275babf7_09_mask.gif');
gt_back(:,:,3)= imread('compacto/47ea8f25c948_09_mask.gif');
gt_back(:,:,4)= imread('compacto/898339fab87a_09_mask.gif');

% frente
gt_front(:,:,1)= imread('compacto/2faf504842df_01_mask.gif');
gt_front(:,:,2)= imread('compacto/4b74275babf7_01_mask.gif');
gt_front(:,:,3)= imread('compacto/47ea8f25c948_01_mask.gif');
gt_front(:,:,4)= imread('compacto/898339fab87a_01_mask.gif');

%% Iniciar mask pick_up %%

% traseira
gt_back(:,:,5)= imread('pick_up/0ed6904e1004_09_mask.gif');
gt_back(:,:,6)= imread('pick_up/3cb21125f126_09_mask.gif');
gt_back(:,:,7)= imread('pick_up/0795e132d090_09_mask.gif');

% frente
gt_front(:,:,5)= imread('pick_up/0ed6904e1004_01_mask.gif');
gt_front(:,:,6)= imread('pick_up/3cb21125f126_01_mask.gif');
gt_front(:,:,7)= imread('pick_up/0795e132d090_01_mask.gif');

%% Iniciar mask sedan %%

% traseira
gt_back(:,:,8)= imread('sedan/1ae8a68a40e4_09_mask.gif');
gt_back(:,:,9)= imread('sedan/2ea62c1beee7_09_mask.gif');
gt_back(:,:,10)= imread('sedan/5fb012d30fd9_09_mask.gif');
gt_back(:,:,11)= imread('sedan/7fbc761387f3_09_mask.gif');
gt_back(:,:,12)= imread('sedan/34b0c08544a5_09_mask.gif');

% frente
gt_front(:,:,8)= imread('sedan/1ae8a68a40e4_01_mask.gif');
gt_front(:,:,9)= imread('sedan/2ea62c1beee7_01_mask.gif');
gt_front(:,:,10)= imread('sedan/5fb012d30fd9_01_mask.gif');
gt_front(:,:,11)= imread('sedan/7fbc761387f3_01_mask.gif');
gt_front(:,:,12)= imread('sedan/34b0c08544a5_01_mask.gif');

%% Iniciar mask SUV %%

% traseira
gt_back(:,:,13)= imread('SUV/3d7a1030deeb_09_mask.gif');
gt_back(:,:,14)= imread('SUV/4fc2470c0f7b_09_mask.gif');
gt_back(:,:,15)= imread('SUV/54ee69d7d5e5_09_mask.gif');
gt_back(:,:,16)= imread('SUV/630335e37f40_09_mask.gif');

% frente
gt_front(:,:,13)= imread('SUV/3d7a1030deeb_01_mask.gif');
gt_front(:,:,14)= imread('SUV/4fc2470c0f7b_01_mask.gif');
gt_front(:,:,15)= imread('SUV/54ee69d7d5e5_01_mask.gif');
gt_front(:,:,16)= imread('SUV/630335e37f40_01_mask.gif');

%% Brands %%
brands(:,:,1)=im2double(rgb2gray(imread('brands/mini_preto.jpg')));
brands(:,:,2)=im2double(rgb2gray(imread('brands/bmw_branco.jpg')));
brands(:,:,3)=im2double(rgb2gray(imread('brands/chevrolet_preto.jpg')));
brands(:,:,4)=im2double(rgb2gray(imread('brands/ford_branco.jpg')));
brands(:,:,5)=im2double(rgb2gray(imread('brands/honda_branco.jpg')));
brands(:,:,6)=im2double(rgb2gray(imread('brands/jaguar_front.jpg')));
brands(:,:,7)=im2double(rgb2gray(imread('brands/audi_branco.jpg')));

%% Brands_2 %%
% brands_2 = zeros(80, 180, 7);
% 
% cenas1=imread('brands_2/mini.png');
% cenas1=imcrop(cenas1, [80 180]);
% brands_2(:,:,1)=cenas1;
% 
% cenas2=rgb2gray(imread('brands_2/bmw.png'));
% cenas2=imresize(cenas2, [80 180]);
% brands_2(:,:,2)=cenas2;
% 
% cenas3=rgb2gray(imread('brands_2/chevrolet.png'));
% cenas3=imresize(cenas3, [80 180]);
% brands_2(:,:,3)=cenas3;
% 
% cenas4=rgb2gray(imread('brands_2/ford.png'));
% cenas4=imresize(cenas4, [80 180]);
% brands_2(:,:,4)=cenas4;
% 
% cenas5=rgb2gray(imread('brands_2/honda.png'));
% cenas5=imresize(cenas5, [80 180]);
% brands_2(:,:,5)=cenas5;
% 
% cenas6=rgb2gray(imread('brands_2/jaguar.png'));
% cenas6=imresize(cenas6, [80 180]);
% brands_2(:,:,6)=cenas6;
% 
% cenas7=imread('brands_2/audi.png');
% cenas7=imresize(cenas7, [80 180]);
% brands_2(:,:,7)=cenas7;

%% Testing %%

% [y,x] = size(carros_back(:,:,1));
% center_x = x/2;
% center_y = y/2;
% radius = 5;
% left_x = center_x - 80;  
% top_y = center_y - 180;

% center_x = left + width/2;
% center_y = top + height/2;
% left_x = center_x - 180/2;  
% top_y = center_y - 80/2;
% 
% maxCorrValue = zeros(7,16,1);
% index = zeros(16,1);

%% Front View %%

for num = 1:16
    I = carros_front(:,:,num);
    Back = gt_front(:,:,num);
    
    reg = regionprops(Back, 'BoundingBox');
    left = reg.BoundingBox(1);
    top = reg.BoundingBox(2);
    width = reg.BoundingBox(3);
    height = reg.BoundingBox(4);
    
    k1 = 1/3;
    k2 = 1/3;
    new_left = left+width*k1;
    new_top = top+height*k2;
    
    I_cropped = imcrop(I, [new_left new_top  300 350]);
    I2 = imfilter(I_cropped, fspecial('log', 5, 0.4), 'replicate');
%     I2 = edge()
    figure; imshow(I2)
    title('image')

    for i = 1:7
        B = imfilter(brands(:,:,i), fspecial('log', 5, 0.4), 'replicate');
%         figure; imshow(B)
%         title('brands_2')

       correlationOutput = normxcorr2(B,I2);
%        figure;surf(correlationOutput),shading flat
       maxCorrValue1(i,num) = max(correlationOutput(:));
    end
end

max_corr = zeros(1,7);
for i = 1:7
    max_corr(i) = max(maxCorrValue1(i,:));
end

for num=1:16
    maximo = 0;
    for j=1:7
        div1(j,num) = maxCorrValue1(j,num)/max_corr(j);
        if (div1(j,num) > maximo)
            maximo = div1(j,num);
            index1(num) = j;
        end
    end
end

%% Back View %%

for num = 1:16
    I = carros_back(:,:,num);
    Back = gt_back(:,:,num);
    
    reg = regionprops(Back, 'BoundingBox');
    left = reg.BoundingBox(1);
    top = reg.BoundingBox(2);
    width = reg.BoundingBox(3);
    height = reg.BoundingBox(4);
    
    k1 = 1/3;
    k2 = 1/3;
    new_left = left+width*k1;
    new_top = top+height*k2;
    
    I_cropped = imcrop(I, [new_left new_top  290 350]);
    I2 = imfilter(I_cropped, fspecial('log', 5, 0.4), 'replicate');
%     I2 = edge()
    figure; imshow(I2)
    title('image')

    for i = 1:7
        B = imfilter(brands(:,:,i), fspecial('log', 5, 0.4), 'replicate');
%         figure; imshow(B)
%         title('brands_2')

       correlationOutput = normxcorr2(B,I2);
%        figure;surf(correlationOutput),shading flat
       maxCorrValue2(i,num) = max(correlationOutput(:));
    end
end

max_corr = zeros(1,7);
for i = 1:7
    max_corr(i) = max(maxCorrValue2(i,:));
end

for num=1:16
    maximo = 0;
    for j=1:7
        div2(j,num) = maxCorrValue2(j,num)/max_corr(j);
        if (div2(j,num) > maximo)
            maximo = div2(j,num);
            index2(num) = j;
        end
    end
end

%% Keeping everything together %%

for j = 1:16
    for i = 1:7
        maxCorrValue(i,j) =  (maxCorrValue1(i,j) + maxCorrValue2(i,j)) / 2;
    end
end

max_corr = zeros(1,7);
for i = 1:7
    max_corr(i) = max(maxCorrValue(i,:));
end

for j = 1:16
    maximo = 0;
    for i = 1:7
        div(i,j) = maxCorrValue(i,j)/max_corr(i);
        if (div(i,j) > maximo)
            maximo = div(i,j);
            index(j) = i;
        end
    end
end
% index(2) = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
% index(2) = [5, 1, 1, 3, 4, 3, 4, 6, 2, 02, 07, 04, 02, 07, 05, 04];

%% Old Stuff %%

% index = 1   Mini
% index = 2   BMW
% index = 3   Chevolet
% index = 4   Ford
% index = 5   Honda
% index = 6   Jaguar
% index = 7   Audi

% for i = 1 :16
%    figure; imshow(carros_back(:,:,i))
%    [y,x] = size(carros_back(:,:,1));
%    center_x = x/2;
%    center_y = y/2;
%    radius = 5;
%    left_x = center_x - 60;  
%    top_y = center_y - 120;
% 
%    
%    
% %    se = strel('line', 1, 1);
% %    I2 = imdilate(I, se);
% %    BW =imclearborder(I2, 8);
% %    figure
% %    imshow(BW)
% %    k = imclose(BW,strel('square',50));
% %    figure
% %    imshow(k)
% end