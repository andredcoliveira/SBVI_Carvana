clc
clear
close all;

%%%%% Iniciar compactos  %%%%%
carros(:,:,1)=im2double(rgb2gray(imread('compacto/2faf504842df_09.jpg')));
carros(:,:,2)=im2double(rgb2gray(imread('compacto/4b74275babf7_09.jpg')));
carros(:,:,3)=im2double(rgb2gray(imread('compacto/47ea8f25c948_01.jpg')));
carros(:,:,4)=im2double(rgb2gray(imread('compacto/898339fab87a_09.jpg')));


%%%%Iniciar pick_up %%%%
carros(:,:,5)=im2double(rgb2gray(imread('pick_up/0ed6904e1004_09.jpg')));
carros(:,:,6)=im2double(rgb2gray(imread('pick_up/3cb21125f126_09.jpg')));
carros(:,:,7)=im2double(rgb2gray(imread('pick_up/0795e132d090_09.jpg')));

%%%%Iniciar sedan  %%%%
carros(:,:,8)=im2double(rgb2gray(imread('sedan/1ae8a68a40e4_09.jpg')));
carros(:,:,9)=im2double(rgb2gray(imread('sedan/2ea62c1beee7_09.jpg')));
carros(:,:,10)=im2double(rgb2gray(imread('sedan/5fb012d30fd9_09.jpg')));
carros(:,:,11)=im2double(rgb2gray(imread('sedan/7fbc761387f3_09.jpg')));
carros(:,:,12)=im2double(rgb2gray(imread('sedan/34b0c08544a5_09.jpg')));

%%%%% Iniciar SUV  %%%%%
carros(:,:,13)=im2double(rgb2gray(imread('SUV/3d7a1030deeb_09.jpg')));
carros(:,:,14)=im2double(rgb2gray(imread('SUV/4fc2470c0f7b_09.jpg')));
carros(:,:,15)=im2double(rgb2gray(imread('SUV/54ee69d7d5e5_09.jpg')));
carros(:,:,16)=im2double(rgb2gray(imread('SUV/630335e37f40_09.jpg')));


%%%%% Iniciar mask compactos  %%%%%
mask(:,:,1)= imread('compacto/2faf504842df_09_mask.gif');
mask(:,:,2)= imread('compacto/4b74275babf7_09_mask.gif');
mask(:,:,3)= imread('compacto/47ea8f25c948_01_mask.gif');
mask(:,:,4)= imread('compacto/898339fab87a_09_mask.gif');

%%%%Iniciar mask pick_up %%%%
mask(:,:,5)= imread('pick_up/0ed6904e1004_09_mask.gif');
mask(:,:,6)= imread('pick_up/3cb21125f126_09_mask.gif');
mask(:,:,7)= imread('pick_up/0795e132d090_09_mask.gif');

%%%%Iniciar mask sedan  %%%%
mask(:,:,8)= imread('sedan/1ae8a68a40e4_09_mask.gif');
mask(:,:,9)= imread('sedan/2ea62c1beee7_09_mask.gif');
mask(:,:,10)= imread('sedan/5fb012d30fd9_09_mask.gif');
mask(:,:,11)= imread('sedan/7fbc761387f3_09_mask.gif');
mask(:,:,12)= imread('sedan/34b0c08544a5_09_mask.gif');

%%%%% Iniciar mask SUV  %%%%%
mask(:,:,13)= imread('SUV/3d7a1030deeb_09_mask.gif');
mask(:,:,14)= imread('SUV/4fc2470c0f7b_09_mask.gif');
mask(:,:,15)= imread('SUV/54ee69d7d5e5_09_mask.gif');
mask(:,:,16)= imread('SUV/630335e37f40_09_mask.gif');

%%%%BRANDS %%%%
brands(:,:,1)=im2double(rgb2gray(imread('brands/mini_preto.jpg')));
brands(:,:,2)= im2double(rgb2gray(imread('brands/bmw_branco.jpg')));
brands(:,:,3)=im2double(rgb2gray(imread('brands/chevrolet_preto.jpg')));
brands(:,:,4)=im2double(rgb2gray(imread('brands/ford_branco.jpg')));
brands(:,:,5)=im2double(rgb2gray(imread('brands/honda_branco.jpg')));
brands(:,:,6)=im2double(rgb2gray(imread('brands/jaguar.jpg')));
brands(:,:,7)= im2double(rgb2gray(imread('brands/audi_branco.jpg')));



% [y,x] = size(carros(:,:,1));
% center_x = x/2;
% center_y = y/2;
% radius = 5;
% left_x = center_x - 80;  
% top_y = center_y - 180;



% center_x = left + width/2;
% center_y = top + height/2;
% left_x = center_x - 180/2;  
% top_y = center_y - 80/2;


maxCorrValue = zeros(7,16,1);
index = zeros(16,1);


for num =1 :16
    I = carros(:,:,num);
    M = mask(:,:,num);
    
    reg = regionprops(M, 'BoundingBox');
    left = reg.BoundingBox(1);
    top = reg.BoundingBox(2);
    width = reg.BoundingBox(3);
    height = reg.BoundingBox(4);
    
    k1 = 1/3;
    k2 = 1/3;
    I_cropped = imcrop(I, [left+width*k1 top+height*k2  300 250]);
    I2 = imfilter(I_cropped, fspecial('log', 5, 0.4), 'replicate');
   
    figure; imshow(I2)

    for i = 1:7  
        B = imfilter(brands(:,:,i), fspecial('log', 5, 0.5), 'replicate');
%         figure; imshow(B)    

       correlationOutput = normxcorr2(B,I2);
%        figure;surf(correlationOutput),shading flat
       maxCorrValue(i,num) = max(abs(correlationOutput(:)));
       
    end
    
    maximo = 0;
    for j=1:7
     if (maxCorrValue(j,num) > maximo)
         maximo = maxCorrValue(j, num);
         index(num) = j;
     end
    end
    
    
end    


% index = 1   Mini
% index = 2   BMW
% index = 3   Chevolet
% index = 4   Ford
% index = 5   Honda
% index = 6   Jaguar
% index = 7   Audi

% for i = 1 :16
%    figure; imshow(carros(:,:,i))
%    [y,x] = size(carros(:,:,1));
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