clc;
clear;
close all;

%% Iniciar Pick Up %%
mask_pick_up3 = imread('pick_up/0ed6904e1004_05_mask.gif'); % side
mask_pick_up7 = imread('pick_up/3cb21125f126_13_mask.gif'); % side
mask_pick_up11 = imread('pick_up/0795e132d090_05_mask.gif'); % side

mask_pick_side = {mask_pick_up3, mask_pick_up7, mask_pick_up11};

[max_height_pick_side, max_width_pick_side] = tam_max(mask_pick_side);
[min_height_pick_side, min_width_pick_side] = tam_min(mask_pick_side);


% all
% [max_susp_pick_up, min_susp_pick_up] = withdrawal(mask_pick_side);
% suspension_pick_up = first_susp(mask_pick_side, min_susp_pick_up);

% first_susp
% suspension_pick_up1 = first_susp(mask_pick_up3, min_susp_pick_up);
% suspension_pick_up2 = first_susp(mask_pick_up7, min_susp_pick_up);
% suspension_pick_up3 = first_susp(mask_pick_up11, min_susp_pick_up);
% second_dome
% if (suspension_pick_up1 == 0)
%     dome_pick_up1 = second_dome(mask_pick_up3);
% end
% if (suspension_pick_up1 == 0)
%     dome_pick_up2 = second_dome(mask_pick_up7);
% end
% if (suspension_pick_up1 == 0)
%     dome_pick_up3 = second_dome(mask_pick_up11);
% end

%% Iniciar compactos %%
mask_compact3 = imread('compacto/2faf504842df_05_mask.gif'); % side
mask_compact7 = imread('compacto/4b74275babf7_13_mask.gif'); % side
mask_compact11 = imread('compacto/47ea8f25c948_05_mask.gif'); % side
mask_compact15 = imread('compacto/898339fab87a_05_mask.gif'); % side

mask_comp_side = {mask_compact3, mask_compact7, mask_compact11, mask_compact15};

[max_height_comp_side, max_width_comp_side] = tam_max(mask_comp_side);
[min_height_comp_side, min_width_comp_side] = tam_min(mask_comp_side);

% [max_susp_compact, min_susp_compact] = withdrawal(mask_comp_side);
% suspension_compact = first_susp(mask_comp_side, min_susp_pick_up);

% one by one
% suspension_compact1 = first_susp(mask_compact3, min_susp_pick_up);
% suspension_compact2 = first_susp(mask_compact7, min_susp_pick_up);
% suspension_compact3 = first_susp(mask_compact11, min_susp_pick_up);
% suspension_compact4 = first_susp(mask_compact15, min_susp_pick_up);
% second_dome
% if (suspension_compact1 == 0)
%     dome_compact1 = second_dome(mask_compact3);
% end
% if (suspension_compact1 == 0)
%     dome_compact2 = second_dome(mask_compact7);
% end
% if (suspension_compact1 == 0)
%     dome_compact3 = second_dome(mask_compact11);
% end
% if (suspension_compact1 == 0)
%     dome_compact4 = second_dome(mask_compact15);
% end

%% Iniciar Sedan %%
mask_sedan3 = imread('sedan/1ae8a68a40e4_13_mask.gif'); % side
mask_sedan7 = imread('sedan/2ea62c1beee7_05_mask.gif'); % side
mask_sedan11 = imread('sedan/5fb012d30fd9_13_mask.gif'); % side
mask_sedan15 = imread('sedan/7fbc761387f3_05_mask.gif'); % side
mask_sedan19 = imread('sedan/34b0c08544a5_05_mask.gif'); % side

mask_sed_side = {mask_sedan3, mask_sedan7, mask_sedan11, mask_sedan15, mask_sedan19};

[max_height_sedan_side, max_width_sedan_side] = tam_max(mask_sed_side);
[min_height_sedan_side, min_width_sedan_side] = tam_min(mask_sed_side);

% [max_susp_sedan, min_susp_sedan] = withdrawal(mask_sed_side);
% suspension_sedan = first_susp(mask_sed_side, min_susp_pick_up);

% one by one
% suspension_sedan1 = first_susp(mask_sedan3, min_susp_pick_up);
% suspension_sedan2 = first_susp(mask_sedan7, min_susp_pick_up);
% suspension_sedan3 = first_susp(mask_sedan11, min_susp_pick_up);
% suspension_sedan4 = first_susp(mask_sedan15, min_susp_pick_up);
% suspension_sedan5 = first_susp(mask_sedan19, min_susp_pick_up);
% second_dome
% if (suspension_sedan1 == 0)
%     dome_sedan1 = second_dome(mask_sedan3);
% end
% if (suspension_sedan2 == 0)
%     dome_sedan2 = second_dome(mask_sedan7);
% end
% if (suspension_sedan3 == 0)
%     dome_sedan3 = second_dome(mask_sedan11);
% end
% if (suspension_sedan4 == 0)
%     dome_sedan4 = second_dome(mask_sedan15);
% end
% if (suspension_sedan5 == 0)
%     dome_sedan5 = second_dome(mask_sedan19);
% end

%% Iniciar SUV %%
mask_SUV3 = imread('SUV/3d7a1030deeb_05_mask.gif'); % side
mask_SUV7 = imread('SUV/4fc2470c0f7b_05_mask.gif'); % side
mask_SUV11 = imread('SUV/54ee69d7d5e5_05_mask.gif'); % side
mask_SUV15 = imread('SUV/630335e37f40_05_mask.gif'); % side

mask_suv_side = {mask_SUV3, mask_SUV7, mask_SUV11, mask_SUV15};

[max_height_suv_side, max_width_suv_side] = tam_max(mask_suv_side);
[min_height_suv_side, min_width_suv_side] = tam_min(mask_suv_side);

% [max_susp_suv, min_susp_suv] = withdrawal(mask_suv_side);
% suspension_suv = first_susp(mask_suv_side, min_susp_pick_up);

% one by one
% suspension_SUV1 = first_susp(mask_SUV3, min_susp_pick_up);
% suspension_SUV2 = first_susp(mask_SUV7, min_susp_pick_up);
% suspension_SUV3 = first_susp(mask_SUV11, min_susp_pick_up);
% suspension_SUV4 = first_susp(mask_SUV15, min_susp_pick_up);
% second_dome
% if (suspension_SUV1 == 0)
%     dome_SUV1 = second_dome(mask_SUV3);
% end
% if (suspension_SUV2 == 0)
%     dome_SUV2 = second_dome(mask_SUV7);
% end
% if (suspension_SUV3 == 0)
%     dome_SUV3 = second_dome(mask_SUV11);
% end
% if (suspension_SUV4 == 0)
%     dome_SUV4 = second_dome(mask_SUV15);
% end
