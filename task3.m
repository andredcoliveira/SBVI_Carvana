%%%%% Iniciar compactos frentes %%%%%
carros(:,:,1)=im2double(rgb2gray(imread('compacto/2faf504842df_09.jpg')));
carros(:,:,2)=im2double(rgb2gray(imread('compacto/4b74275babf7_09.jpg')));
carros(:,:,3)=im2double(rgb2gray(imread('compacto/47ea8f25c948_01.jpg')));
carros(:,:,4)=im2double(rgb2gray(imread('compacto/898339fab87a_09.jpg')));


%%%%Iniciar pick_up frentes %%%%
carros(:,:,5)=im2double(rgb2gray(imread('pick_up/0ed6904e1004_09.jpg')));
carros(:,:,6)=im2double(rgb2gray(imread('pick_up/3cb21125f126_09.jpg')));
carros(:,:,7)=im2double(rgb2gray(imread('pick_up/0795e132d090_09.jpg')));

%%%%Iniciar sedan frentes %%%%
carros(:,:,8)=im2double(rgb2gray(imread('sedan/1ae8a68a40e4_09.jpg')));
carros(:,:,9)=im2double(rgb2gray(imread('sedan/2ea62c1beee7_09.jpg')));
carros(:,:,10)=im2double(rgb2gray(imread('sedan/5fb012d30fd9_09.jpg')));
carros(:,:,11)=im2double(rgb2gray(imread('sedan/7fbc761387f3_09.jpg')));
carros(:,:,12)=im2double(rgb2gray(imread('sedan/34b0c08544a5_09.jpg')));

%%%%% Iniciar SUV frentes %%%%%
carros(:,:,13)=im2double(rgb2gray(imread('SUV/3d7a1030deeb_09.jpg')));
carros(:,:,14)=im2double(rgb2gray(imread('SUV/4fc2470c0f7b_09.jpg')));
carros(:,:,15)=im2double(rgb2gray(imread('SUV/54ee69d7d5e5_09.jpg')));
carros(:,:,16)=im2double(rgb2gray(imread('SUV/630335e37f40_09.jpg')));

close all;

I = carros(:,:,1);


for i = 1 :16
   figure; imshow(carros(:,:,i))
   [y,x] = size(carros(:,:,1));
   center_x = x/2;
   center_y = y/2;
   radius = 5;
   left_x = center_x - 60;
   
   top_y = center_y - 120;

   
   
%    se = strel('line', 1, 1);
%    I2 = imdilate(I, se);
%    BW =imclearborder(I2, 8);
%    figure
%    imshow(BW)
%    k = imclose(BW,strel('square',50));
%    figure
%    imshow(k)
end