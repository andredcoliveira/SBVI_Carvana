function cars = startup()
%startup Fills the program workspace
%   Clears environment, reads cars from files and then returns them in an
%   array

    %% Limpeza inicial
    close all;
    clc;
    clear;

    %% Iniciar compactos %%
    compact1 = imread('compacto/2faf504842df_01.jpg'); % front
    compact2 = imread('compacto/2faf504842df_09.jpg'); % back
    compact3 = imread('compacto/2faf504842df_05.jpg'); % side
    compact4 = imread('compacto/2faf504842df_11.jpg'); % other

    compact5 = imread('compacto/4b74275babf7_01.jpg'); % front
    compact6 = imread('compacto/4b74275babf7_09.jpg'); % back
    compact7 = imread('compacto/4b74275babf7_13.jpg'); % side
    compact8 = imread('compacto/4b74275babf7_11.jpg'); % other

    compact9 = imread('compacto/47ea8f25c948_01.jpg'); % front
    compact10 = imread('compacto/47ea8f25c948_09.jpg'); % back
    compact11 = imread('compacto/47ea8f25c948_05.jpg'); % side
    compact12 = imread('compacto/47ea8f25c948_07.jpg'); % other

    compact13 = imread('compacto/898339fab87a_01.jpg'); % front
    compact14 = imread('compacto/898339fab87a_09.jpg'); % back
    compact15 = imread('compacto/898339fab87a_05.jpg'); % side
    compact16 = imread('compacto/898339fab87a_12.jpg'); % other

    comp_front = {compact1, compact5, compact9, compact13};
    comp_back = {compact2, compact6, compact10, compact14};
    comp_side = {compact3, compact7, compact11, compact15};
    comp_other = {compact4, compact8, compact12, compact16};


    %% Iniciar Pick Up %%
    pick_up1 = imread('pick_up/0ed6904e1004_01.jpg'); % front
    pick_up2 = imread('pick_up/0ed6904e1004_09.jpg'); % back
    pick_up3 = imread('pick_up/0ed6904e1004_05.jpg'); % side
    pick_up4 = imread('pick_up/0ed6904e1004_11.jpg'); % other

    pick_up5 = imread('pick_up/3cb21125f126_01.jpg'); % front
    pick_up6 = imread('pick_up/3cb21125f126_09.jpg'); % back
    pick_up7 = imread('pick_up/3cb21125f126_13.jpg'); % side
    pick_up8 = imread('pick_up/3cb21125f126_10.jpg'); % other

    pick_up9 = imread('pick_up/0795e132d090_01.jpg'); % front
    pick_up10 = imread('pick_up/0795e132d090_09.jpg'); % back
    pick_up11 = imread('pick_up/0795e132d090_05.jpg'); % side
    pick_up12 = imread('pick_up/0795e132d090_11.jpg'); % other

    pick_front = {pick_up1, pick_up5, pick_up9};
    pick_back = {pick_up2, pick_up6, pick_up10};
    pick_side = {pick_up3, pick_up7, pick_up11};
    pick_other = {pick_up4, pick_up8, pick_up12};


    %% Iniciar Sedan %%
    sedan1 = imread('sedan/1ae8a68a40e4_01.jpg'); % front
    sedan2 = imread('sedan/1ae8a68a40e4_09.jpg'); % back
    sedan3 = imread('sedan/1ae8a68a40e4_13.jpg'); % side
    sedan4 = imread('sedan/1ae8a68a40e4_07.jpg'); % other

    sedan5 = imread('sedan/2ea62c1beee7_01.jpg'); % front
    sedan6 = imread('sedan/2ea62c1beee7_09.jpg'); % back
    sedan7 = imread('sedan/2ea62c1beee7_05.jpg'); % side
    sedan8 = imread('sedan/2ea62c1beee7_15.jpg'); % other

    sedan9 = imread('sedan/5fb012d30fd9_01.jpg'); % front
    sedan10 = imread('sedan/5fb012d30fd9_09.jpg'); % back
    sedan11 = imread('sedan/5fb012d30fd9_13.jpg'); % side
    sedan12 = imread('sedan/5fb012d30fd9_15.jpg'); % other

    sedan13 = imread('sedan/7fbc761387f3_01.jpg'); % front
    sedan14 = imread('sedan/7fbc761387f3_09.jpg'); % back
    sedan15 = imread('sedan/7fbc761387f3_05.jpg'); % side
    sedan16 = imread('sedan/7fbc761387f3_03.jpg'); % other

    sedan17 = imread('sedan/34b0c08544a5_01.jpg'); % front
    sedan18 = imread('sedan/34b0c08544a5_09.jpg'); % back
    sedan19 = imread('sedan/34b0c08544a5_05.jpg'); % side
    sedan20 = imread('sedan/34b0c08544a5_11.jpg'); % other

    sed_front = {sedan1, sedan5, sedan9, sedan13, sedan17};
    sed_back = {sedan2, sedan6, sedan10, sedan14, sedan18};
    sed_side = {sedan3, sedan7, sedan11, sedan15, sedan19};
    sed_other = {sedan4, sedan8, sedan12, sedan16, sedan20};


    %% Iniciar SUV %%
    SUV1 = imread('SUV/3d7a1030deeb_01.jpg'); % front
    SUV2 = imread('SUV/3d7a1030deeb_09.jpg'); % back
    SUV3 = imread('SUV/3d7a1030deeb_05.jpg'); % side
    SUV4 = imread('SUV/3d7a1030deeb_07.jpg'); % other

    SUV5 = imread('SUV/4fc2470c0f7b_01.jpg'); % front
    SUV6 = imread('SUV/4fc2470c0f7b_09.jpg'); % back
    SUV7 = imread('SUV/4fc2470c0f7b_05.jpg'); % side
    SUV8 = imread('SUV/4fc2470c0f7b_11.jpg'); % other

    SUV9 = imread('SUV/54ee69d7d5e5_01.jpg'); % front
    SUV10 = imread('SUV/54ee69d7d5e5_09.jpg'); % back
    SUV11 = imread('SUV/54ee69d7d5e5_05.jpg'); % side
    SUV12 = imread('SUV/54ee69d7d5e5_11.jpg'); % other

    SUV13 = imread('SUV/630335e37f40_01.jpg'); % front
    SUV14 = imread('SUV/630335e37f40_09.jpg'); % back
    SUV15 = imread('SUV/630335e37f40_05.jpg'); % side
    SUV16 = imread('SUV/630335e37f40_07.jpg'); % other

    suv_front = {SUV1, SUV5, SUV9, SUV13};
    suv_back = {SUV2, SUV6, SUV10, SUV14};
    suv_side = {SUV3, SUV7, SUV11, SUV15};
    suv_other = {SUV4, SUV8, SUV12, SUV16};


    %% Gather everything
    cars = {comp_front, comp_back, comp_side, comp_other, pick_front, pick_back, pick_side, pick_other, sed_front, sed_back, sed_side, sed_other, suv_front, suv_back, suv_side, suv_other};

%     figure; imshow(cars{1}{1})  % cars -> comp_front -> compact1
%     type_view = size(cars,2)  % cars rows
%     car = size(cars{1},2)  % type_view rows
%     img_rows = size(cars{1}{1},1)
%     img_cols = size(cars{1}{1},2)
    
    
end

