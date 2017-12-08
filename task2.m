clc;
clear;
close all;

%% Iniciar Pick Up %%
% % % mask_pick_up1 = imread('pick_up/0ed6904e1004_01_mask.gif'); % front
% % % mask_pick_up2 = imread('pick_up/0ed6904e1004_09_mask.gif'); % back
mask_pick_up3 = imread('pick_up/0ed6904e1004_05_mask.gif'); % side
% % % mask_pick_up4 = imread('pick_up/0ed6904e1004_11_mask.gif'); % other
% % % 
% % % mask_pick_up5 = imread('pick_up/3cb21125f126_01_mask.gif'); % front
% % % mask_pick_up6 = imread('pick_up/3cb21125f126_09_mask.gif'); % back
mask_pick_up7 = imread('pick_up/3cb21125f126_13_mask.gif'); % side
% % % mask_pick_up8 = imread('pick_up/3cb21125f126_10_mask.gif'); % other
% % % 
% % % mask_pick_up9 = imread('pick_up/0795e132d090_01_mask.gif'); % front
% % % mask_pick_up10 = imread('pick_up/0795e132d090_09_mask.gif'); % back
mask_pick_up11 = imread('pick_up/0795e132d090_05_mask.gif'); % side
% % % mask_pick_up12 = imread('pick_up/0795e132d090_11_mask.gif'); % other
% % % 
% % % mask_pick_front = {mask_pick_up1, mask_pick_up5, mask_pick_up9};
% % % mask_pick_back = {mask_pick_up2, mask_pick_up6, mask_pick_up10};
mask_pick_side = {mask_pick_up3, mask_pick_up7, mask_pick_up11};
% % % mask_pick_other = {mask_pick_up4, mask_pick_up8, mask_pick_up12};
% 
% figure;
% subplot(3,1,1)
% imshow(mask_pick_up3, [])
% title('1')
% subplot(3,1,2)
% imshow(mask_pick_up7, [])
% title('2')
% subplot(3,1,3)
% imshow(mask_pick_up11, [])
% title('3')

[max_susp_pick_up, min_susp_pick_up] = withdrawal(mask_pick_side);
decision_pick_up = first_susp(mask_pick_side, min_susp_pick_up);

% % % [height_pick_front, width_pick_front] = tam_max(mask_pick_front);
% % % [height_pick_back, width_pick_back] = tam_max(mask_pick_back);
% [height_pick_side, width_pick_side] = tam_max(mask_pick_side);
% % % [height_pick_other, width_pick_other] = tam_max(mask_pick_other);
% % % [med_height_pick_front, med_width_pick_front, med_top, med_bottom, med_left, med_right] = tam_med(mask_pick_front);
% % % [med_height_pick_back, med_width_pick_back, med_top, med_bottom, med_left, med_right] = tam_med(mask_pick_back);
% [med_height_pick_side, med_width_pick_side, med_top, med_bottom, med_left, med_right] = tam_med(mask_pick_side);
% % % [med_height_pick_other, med_width_pick_other, med_top, med_bottom, med_left, med_right] = tam_med(mask_pick_other);

%% Iniciar compactos %%
% % mask_compact1 = imread('compacto/2faf504842df_01_mask.gif'); % front
% % mask_compact2 = imread('compacto/2faf504842df_09_mask.gif'); % back
mask_compact3 = imread('compacto/2faf504842df_05_mask.gif'); % side
% % mask_compact4 = imread('compacto/2faf504842df_11_mask.gif'); % other
% % 
% % mask_compact5 = imread('compacto/4b74275babf7_01_mask.gif'); % front
% % mask_compact6 = imread('compacto/4b74275babf7_09_mask.gif'); % back
mask_compact7 = imread('compacto/4b74275babf7_13_mask.gif'); % side
% % mask_compact8 = imread('compacto/4b74275babf7_11_mask.gif'); % other
% % 
% % mask_compact9 = imread('compacto/47ea8f25c948_01_mask.gif'); % front
% % mask_compact10 = imread('compacto/47ea8f25c948_09_mask.gif'); % back
mask_compact11 = imread('compacto/47ea8f25c948_05_mask.gif'); % side
% % mask_compact12 = imread('compacto/47ea8f25c948_07_mask.gif'); % other
% % 
% % mask_compact13 = imread('compacto/898339fab87a_01_mask.gif'); % front
% % mask_compact14 = imread('compacto/898339fab87a_09_mask.gif'); % back
mask_compact15 = imread('compacto/898339fab87a_05_mask.gif'); % side
% % mask_compact16 = imread('compacto/898339fab87a_12_mask.gif'); % other
% % 
% % mask_comp_front = {mask_compact1, mask_compact5, mask_compact9, mask_compact13};
% % mask_comp_back = {mask_compact2, mask_compact6, mask_compact10, mask_compact14};
mask_comp_side = {mask_compact3, mask_compact7, mask_compact11, mask_compact15};
% % mask_comp_other = {mask_compact4, mask_compact8, mask_compact12, mask_compact16};
% 

% figure;
% subplot(4,1,1)
% imshow(mask_compact3, [])

% % figure;
% % subplot(4,1,1)
% % imshow(mask_compact1, [])
% % title('1')
% % subplot(4,1,2)
% % imshow(mask_compact5, [])
% % title('2')
% % subplot(4,1,3)
% % imshow(mask_compact9, [])
% % title('3')
% % subplot(4,1,4)
% % imshow(mask_compact13, [])
% % title('4')

% [max_susp_compact, min_susp_compact] = withdrawal(mask_comp_side);
decision_compact = first_susp(mask_comp_side, min_susp_pick_up);

% % [height_comp_front, width_comp_front] = tam_max(mask_comp_front);
% % [height_comp_back, width_comp_back] = tam_max(mask_comp_back);
% [height_comp_side, width_comp_side] = tam_max(mask_comp_side);
% % [height_comp_other, width_comp_other] = tam_max(mask_comp_other);
% % [med_height_comp_front, med_width_comp_front, med_top, med_bottom, med_left, med_right] = tam_med(mask_comp_front);
% % [med_height_comp_back, med_width_comp_back, med_top, med_bottom, med_left, med_right] = tam_med(mask_comp_back);
% [med_height_comp_side, med_width_comp_side, med_top, med_bottom, med_left, med_right] = tam_med(mask_comp_side);
% % [med_height_comp_other, med_width_comp_other, med_top, med_bottom, med_left, med_right] = tam_med(mask_comp_other);

%% Iniciar Sedan %%
% % mask_sedan1 = imread('sedan/1ae8a68a40e4_01_mask.gif'); % front
% % mask_sedan2 = imread('sedan/1ae8a68a40e4_09_mask.gif'); % back
mask_sedan3 = imread('sedan/1ae8a68a40e4_13_mask.gif'); % side
% % mask_sedan4 = imread('sedan/1ae8a68a40e4_07_mask.gif'); % other
% % 
% % mask_sedan5 = imread('sedan/2ea62c1beee7_01_mask.gif'); % front
% % mask_sedan6 = imread('sedan/2ea62c1beee7_09_mask.gif'); % back
mask_sedan7 = imread('sedan/2ea62c1beee7_05_mask.gif'); % side
% % mask_sedan8 = imread('sedan/2ea62c1beee7_15_mask.gif'); % other
% % 
% % mask_sedan9 = imread('sedan/5fb012d30fd9_01_mask.gif'); % front
% % mask_sedan10 = imread('sedan/5fb012d30fd9_09_mask.gif'); % back
mask_sedan11 = imread('sedan/5fb012d30fd9_13_mask.gif'); % side
% % mask_sedan12 = imread('sedan/5fb012d30fd9_15_mask.gif'); % other
% % 
% % mask_sedan13 = imread('sedan/7fbc761387f3_01_mask.gif'); % front
% % mask_sedan14 = imread('sedan/7fbc761387f3_09_mask.gif'); % back
mask_sedan15 = imread('sedan/7fbc761387f3_05_mask.gif'); % side
% % mask_sedan16 = imread('sedan/7fbc761387f3_03_mask.gif'); % other
% % 
% % mask_sedan17 = imread('sedan/34b0c08544a5_01_mask.gif'); % front
% % mask_sedan18 = imread('sedan/34b0c08544a5_09_mask.gif'); % back
mask_sedan19 = imread('sedan/34b0c08544a5_05_mask.gif'); % side
% % mask_sedan20 = imread('sedan/34b0c08544a5_11_mask.gif'); % other
% % 
% % mask_sed_front = {mask_sedan1, mask_sedan5, mask_sedan9, mask_sedan13, mask_sedan17};
% % mask_sed_back = {mask_sedan2, mask_sedan6, mask_sedan10, mask_sedan14, mask_sedan18};
mask_sed_side = {mask_sedan3, mask_sedan7, mask_sedan11, mask_sedan15, mask_sedan19};
% % mask_sed_other = {mask_sedan4, mask_sedan8, mask_sedan12, mask_sedan16, mask_sedan20};
% % 

% figure;
% subplot(4,1,1)
% imshow(mask_sedan7, [])

% [max_susp_sedan, min_susp_sedan] = withdrawal(mask_sed_side);
decision_sedan = first_susp(mask_sed_side, min_susp_pick_up);

% % [height_sed_front, width_sed_front] = tam_max(mask_sed_front);
% % [height_sed_back, width_sed_back] = tam_max(mask_sed_back);
% [height_sed_side, width_sed_side] = tam_max(mask_sed_side);
% % [height_sed_other, width_sed_other] = tam_max(mask_sed_other);
% % [med_height_sed_front, med_width_sed_front, med_top, med_bottom, med_left, med_right] = tam_med(mask_sed_front);
% % [med_height_sed_back, med_width_sed_back, med_top, med_bottom, med_left, med_right] = tam_med(mask_sed_back);
% [med_height_sed_side, med_width_sed_side, med_top, med_bottom, med_left, med_right] = tam_med(mask_sed_side);
% % [med_height_sed_other, med_width_sed_othe, med_top, med_bottom, med_left, med_rightr] = tam_med(mask_sed_other);

%% Iniciar SUV %%
% % mask_SUV1 = imread('SUV/3d7a1030deeb_01_mask.gif'); % front
% % mask_SUV2 = imread('SUV/3d7a1030deeb_09_mask.gif'); % back
mask_SUV3 = imread('SUV/3d7a1030deeb_05_mask.gif'); % side
% % mask_SUV4 = imread('SUV/3d7a1030deeb_07_mask.gif'); % other
% % 
% % mask_SUV5 = imread('SUV/4fc2470c0f7b_01_mask.gif'); % front
% % mask_SUV6 = imread('SUV/4fc2470c0f7b_09_mask.gif'); % back
mask_SUV7 = imread('SUV/4fc2470c0f7b_05_mask.gif'); % side
% % mask_SUV8 = imread('SUV/4fc2470c0f7b_11_mask.gif'); % other
% % 
% % mask_SUV9 = imread('SUV/54ee69d7d5e5_01_mask.gif'); % front
% % mask_SUV10 = imread('SUV/54ee69d7d5e5_09_mask.gif'); % back
mask_SUV11 = imread('SUV/54ee69d7d5e5_05_mask.gif'); % side
% % mask_SUV12 = imread('SUV/54ee69d7d5e5_11_mask.gif'); % other
% % 
% % mask_SUV13 = imread('SUV/630335e37f40_01_mask.gif'); % front
% % mask_SUV14 = imread('SUV/630335e37f40_09_mask.gif'); % back
mask_SUV15 = imread('SUV/630335e37f40_05_mask.gif'); % side
% % mask_SUV16 = imread('SUV/630335e37f40_07_mask.gif'); % other
% % 
% % mask_suv_front = {mask_SUV1, mask_SUV5, mask_SUV9, mask_SUV13};
% % mask_suv_back = {mask_SUV2, mask_SUV6, mask_SUV10, mask_SUV14};
mask_suv_side = {mask_SUV3, mask_SUV7, mask_SUV11, mask_SUV15};
% % mask_suv_other = {mask_SUV4, mask_SUV8, mask_SUV12, mask_SUV16};
% 
% figure;
% subplot(4,1,1)
% imshow(mask_SUV3, [])
% title('1')
% subplot(4,1,2)
% imshow(mask_SUV7, [])
% title('2')
% subplot(4,1,3)
% imshow(mask_SUV11, [])
% title('3')
% subplot(4,1,4)
% imshow(mask_SUV15, [])
% title('4')

% [max_susp_suv, min_susp_suv] = withdrawal(mask_suv_side);
decision_suv = first_susp(mask_suv_side, min_susp_pick_up);

% % [height_suv_front, width_suv_front] = tam_max(mask_suv_front);
% % [height_suv_back, width_suv_back] = tam_max(mask_suv_back);
% [height_suv_side, width_suv_side] = tam_max(mask_suv_side);
% % [height_suv_other, width_suv_other] = tam_max(mask_suv_other);
% % [med_height_suv_front, med_width_suv_front, med_top, med_bottom, med_left, med_right] = tam_med(mask_suv_front);
% % [med_height_suv_back, med_width_suv_back, med_top, med_bottom, med_left, med_right] = tam_med(mask_suv_back);
% [med_height_suv_side, med_width_suv_side, med_top, med_bottom, med_left, med_right] = tam_med(mask_suv_side);
% % [med_height_suv_other, med_width_suv_other, med_top, med_bottom, med_left, med_right] = tam_med(mask_suv_other);

%% TASK_2 - Classification of the vehicle in one of the four classes %%

% B = bwboundaries(mask_compact1, 4, 'noholes')

function [max_h, max_w] = tam_max(imgs)

[x1,y1] = size(imgs{1});
c = 0;

top_line = 0;
bottom_line = 0;
left_line = 0;
right_line = 0;

min_top = y1;
max_bottom = 0;
min_left = x1;
max_right = 0;
max_h = 0;
max_w = 0;
for j = 1:size(imgs,2)
    for i = 1:x1
        img = imgs{j};
        total_line = sum(img(i,:));
        if (total_line ~= 0) && (c == 0)
            top_line = i;
            c = 1;
        end
        if (total_line == 0) && (c ~= 0)
            bottom_line = i;
            c = 0;
        end
    end
    height = abs(top_line - bottom_line);
    if (height > max_h)
        max_h = height;
    end
    c = 0;
    for i = 1:y1
        img = imgs{j};
        total_line = sum(img(:,i));
        if (total_line ~= 0) && (c == 0)
            left_line = i;
            c = 1;
            if (left_line < min_left)
                min_left = left_line;
            end
        end
        if (total_line == 0) && (c ~= 0)
            right_line = i;
            c = 0;
            if (right_line > max_right)
                max_right = right_line;
            end 
        end
    end
    if(max_right == 0) 
        max_right = x1; % pick up that goes beyond the image length
    end
    width = abs(left_line - right_line);
    if (width > max_w)
        max_w = width;
    end
end
end

function [height, width, med_top, med_bottom, med_left, med_right] = tam_med(imgs)

if (size(imgs, 1) > 1)          % se for uma imagem (varias linhas com pixeis)
    [x1,y1] = size(imgs);
    num_imgs = 1;
else                            % se for um vetor de imagens
    [x1,y1] = size(imgs{1});
    num_imgs = size(imgs,2);
end

c = 0;

top_line = 0;
bottom_line = 0;
left_line = 0;
right_line = 0;

top_tot = 0;
bottom_tot = 0;
left_tot = 0;
right_tot = 0;

med_top = 0;
med_bottom = 0;
med_left = 0;
med_right = 0;

for j = 1:num_imgs
    for i = 1:x1
        if (size(imgs,1) > 1)          % se for uma imagem (varias linhas com pixeis)
            img = imgs;
        else                            % se for um vetor de imagens
            img = imgs{j};
        end
        total_line = sum(img(i,:));
        if (total_line ~= 0) && (c == 0)
            top_line = i;
            c = 1;
        end
        if (total_line == 0) && (c ~= 0)
            bottom_line = i;
            c = 0;
        end
    end
    top_tot = top_tot + top_line;
    bottom_tot = bottom_tot + bottom_line;
    c = 0;
    for i = 1:y1
        if (size(imgs, 1) > 1)          % se for uma imagem (varias linhas com pixeis)
            img = imgs;
        else                            % se for um vetor de imagens
            img = imgs{j};
        end
        total_line = sum(img(:,i));
        if (total_line ~= 0) && (c == 0)
            left_line = i;
            c = 1;
        end
        if (total_line == 0) && (c ~= 0)
            right_line = i;
            c = 0;
        end
    end
    left_tot = left_tot + left_line;
    if(right_line == 0) 
        right_tot = right_tot + y1; % pick up that goes beyond the image length
    else
        right_tot = right_tot + right_line;
    end
end

med_top = top_tot / num_imgs;
med_bottom = bottom_tot / num_imgs;
med_left = left_tot / num_imgs;
med_right = right_tot / num_imgs;

height = med_bottom - med_top;
width = med_right - med_left;
end

function [max_susp, min_susp] = withdrawal(mask_side)
    aux = 0;
    new_bot = 0;
    sum_susp = 0;
    max_susp = 0;
    min_susp = size(mask_side{1},2);
    
    for j=1:size(mask_side,2)
        c = 0;
        for i=1:size(mask_side{j},1)
            img = mask_side{j};
            [height, width, top, bottom, left, right] = tam_med(img);
            x_mid = round((right-left)/2+left);
            aux = img(i, x_mid);
            if((aux ~= 0) && (c == 0))
                c = 1;
            end
            if ((aux == 0) && (c == 1))
                c = 2;
                new_bot = i;
                if (bottom - new_bot < min_susp)
                    min_susp = bottom - new_bot;
                end
                if (bottom - new_bot > max_susp)
                    max_susp = bottom - new_bot;
                end
            end
        end
    end
end

function decision = first_susp(mask_side, min_susp_pick_up)
    aux = 0;
    new_bot = 0;
    sum_susp = 0;
    susp_marker = min_susp_pick_up;
    decision = 0;
    
    for j=1:size(mask_side,2)
        c = 0;
        for i=1:size(mask_side{j},1)
            img = mask_side{j};
            [height, width, top, bottom, left, right] = tam_med(img);
            x_mid = round((right-left)/2+left);
            aux = img(i, x_mid);
            if((aux ~= 0) && (c == 0))
                c = 1;
            end
            if ((aux == 0) && (c == 1))
                c = 2;
                new_bot = i;
                if (bottom - new_bot > min_susp_pick_up*0.95)
                    decision = 1;
                end
            end
        end
    end
end
