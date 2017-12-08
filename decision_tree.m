clc;
clear;
close all;

%% Iniciar Pick Up %%
mask_pick_up3 = imread('pick_up/0ed6904e1004_05_mask.gif'); % side
mask_pick_up7 = imread('pick_up/3cb21125f126_13_mask.gif'); % side
mask_pick_up11 = imread('pick_up/0795e132d090_05_mask.gif'); % side

mask_pick_side = {mask_pick_up3, mask_pick_up7, mask_pick_up11};

% [max_height_pick_side, max_width_pick_side] = tam_max(mask_pick_side);
% [min_height_pick_side, min_width_pick_side] = tam_min(mask_pick_side);

% [max_susp_pick_up, min_susp_pick_up] = suspension(mask_pick_side);

% first_susp
% suspension_pick_up1 = first_susp(mask_pick_up3, min_susp_pick_up);
% suspension_pick_up2 = first_susp(mask_pick_up7, min_susp_pick_up);
% suspension_pick_up3 = first_susp(mask_pick_up11, min_susp_pick_up);

% second_dome
% dome_pick_up1 = second_dome(mask_pick_up3);
% dome_pick_up2 = second_dome(mask_pick_up7);
% dome_pick_up3 = second_dome(mask_pick_up11);

% area
% white_area_pick_up_1 = area(mask_pick_up3);
% white_area_pick_up_2 = area(mask_pick_up7);
% white_area_pick_up_3 = area(mask_pick_up11);

%% Iniciar compactos %%
mask_compact3 = imread('compacto/2faf504842df_05_mask.gif'); % side
mask_compact7 = imread('compacto/4b74275babf7_13_mask.gif'); % side
mask_compact11 = imread('compacto/47ea8f25c948_05_mask.gif'); % side
mask_compact15 = imread('compacto/898339fab87a_05_mask.gif'); % side

mask_comp_side = {mask_compact3, mask_compact7, mask_compact11, mask_compact15};

% [max_height_comp_side, max_width_comp_side] = tam_max(mask_comp_side);
% [min_height_comp_side, min_width_comp_side] = tam_min(mask_comp_side);

% [max_susp_compact, min_susp_compact] = suspension(mask_comp_side);

% first_susp
% suspension_compact1 = first_susp(mask_compact3, min_susp_pick_up);
% suspension_compact2 = first_susp(mask_compact7, min_susp_pick_up);
% suspension_compact3 = first_susp(mask_compact11, min_susp_pick_up);
% suspension_compact4 = first_susp(mask_compact15, min_susp_pick_up);

% second_dome
% dome_compact1 = second_dome(mask_compact3);
% dome_compact2 = second_dome(mask_compact7);
% dome_compact3 = second_dome(mask_compact11);
% dome_compact4 = second_dome(mask_compact15);

% area
% white_area_compact1 = area(mask_compact3);
% white_area_compact2 = area(mask_compact7);
% white_area_compact3 = area(mask_compact11);
% white_area_compact4 = area(mask_compact15);

%% Iniciar Sedan %%
mask_sedan3 = imread('sedan/1ae8a68a40e4_13_mask.gif'); % side
mask_sedan7 = imread('sedan/2ea62c1beee7_05_mask.gif'); % side
mask_sedan11 = imread('sedan/5fb012d30fd9_13_mask.gif'); % side
mask_sedan15 = imread('sedan/7fbc761387f3_05_mask.gif'); % side
mask_sedan19 = imread('sedan/34b0c08544a5_05_mask.gif'); % side

mask_sed_side = {mask_sedan3, mask_sedan7, mask_sedan11, mask_sedan15, mask_sedan19};

% figure; imshow(mask_sedan3, [])

% [max_height_sedan_side, max_width_sedan_side] = tam_max(mask_sed_side);
% [min_height_sedan_side, min_width_sedan_side] = tam_min(mask_sed_side);

% [max_susp_sedan, min_susp_sedan] = suspension(mask_sed_side);

% first_susp
% suspension_sedan1 = first_susp(mask_sedan3, min_susp_pick_up);
% suspension_sedan2 = first_susp(mask_sedan7, min_susp_pick_up);
% suspension_sedan3 = first_susp(mask_sedan11, min_susp_pick_up);
% suspension_sedan4 = first_susp(mask_sedan15, min_susp_pick_up);
% suspension_sedan5 = first_susp(mask_sedan19, min_susp_pick_up);

% second_dome
% dome_sedan1 = second_dome(mask_sedan3);
% dome_sedan2 = second_dome(mask_sedan7);
% dome_sedan3 = second_dome(mask_sedan11);
% dome_sedan4 = second_dome(mask_sedan15);
% dome_sedan5 = second_dome(mask_sedan19);

% area
% white_area_sedan1 = area(mask_sedan3);
% white_area_sedan2 = area(mask_sedan7);
% white_area_sedan3 = area(mask_sedan11);
% white_area_sedan4 = area(mask_sedan15);
% white_area_sedan5 = area(mask_sedan19);


%% Iniciar SUV %%
mask_SUV3 = imread('SUV/3d7a1030deeb_05_mask.gif'); % side
mask_SUV7 = imread('SUV/4fc2470c0f7b_05_mask.gif'); % side
mask_SUV11 = imread('SUV/54ee69d7d5e5_05_mask.gif'); % side
mask_SUV15 = imread('SUV/630335e37f40_05_mask.gif'); % side

mask_suv_side = {mask_SUV3, mask_SUV7, mask_SUV11, mask_SUV15};

% figure; imshow(mask_SUV3, [])

% [max_height_suv_side, max_width_suv_side] = tam_max(mask_suv_side);
% [min_height_suv_side, min_width_suv_side] = tam_min(mask_suv_side);

% [max_susp_suv, min_susp_suv] = suspension(mask_suv_side);

% first_susp
% suspension_SUV1 = first_susp(mask_SUV3, min_susp_pick_up);
% suspension_SUV2 = first_susp(mask_SUV7, min_susp_pick_up);
% suspension_SUV3 = first_susp(mask_SUV11, min_susp_pick_up);
% suspension_SUV4 = first_susp(mask_SUV15, min_susp_pick_up);

% second_dome
% dome_SUV1 = second_dome(mask_SUV3);
% dome_SUV2 = second_dome(mask_SUV7);
% dome_SUV3 = second_dome(mask_SUV11);
% dome_SUV4 = second_dome(mask_SUV15);

% area
% white_area_suv1 = area(mask_SUV3);
% white_area_suv2 = area(mask_SUV7);
% white_area_suv3 = area(mask_SUV11);
% white_area_suv4 = area(mask_SUV15);

%% Testing %%

mask_all_side = {mask_pick_side, mask_comp_side, mask_sed_side, mask_suv_side};
class = 3;
img = 1;
mask = mask_all_side{class}{img};

figure; imshow(mask, [])

% [max_height, max_width] = tam_max(mask_all_side{class});
% [min_height, min_width] = tam_min(mask_all_side{class});
% [height, width, med_top, med_bottom, med_left, med_right] = tam_med(mask_all_side{class})

% [max_susp_suv, min_susp] = suspension(mask_all_side{class});

% first_susp
% suspension = first_susp(mask, min_susp_pick_up);

% second_dome
% dome = second_dome(mask);

[height, width, med_top, med_bottom, med_left, med_right] = tam_med(mask);
% perimeter = 2*height + 2*width;
% white_area = area(mask)*area(mask) / perimeter;
% area = area(mask);
% axis = height / width;
reg = regionprops(mask, 'Area', 'BoundingBox', 'Perimeter', 'Orientation', 'Eccentricity');
axis_reg = reg.BoundingBox(4) / reg.BoundingBox(3);

formula = reg.Perimeter*reg.Perimeter / reg.Area
