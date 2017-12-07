function gndtrus = getGroundTruths()
%getGroundTruths Gets Carvana ground truths
%   This function is necessary for the calculation of the Sørensen-Dice 
%   similarity coefficient for the image segmentation





    %% Gather everything
    gndtrus = {comp_front, comp_back, comp_side, comp_other, pick_front, pick_back, pick_side, pick_other, sed_front, sed_back, sed_side, sed_other, suv_front, suv_back, suv_side, suv_other};

%     figure; imshow(gndtrus{1}{1})  % cars -> comp_front -> compact1
%     type_view = size(gndtrus,2)  % cars rows
%     gndtru = size(gndtrus{1},2)  % type_view rows
%     img_rows = size(gndtrus{1}{1},1)
%     img_cols = size(gndtrus{1}{1},2)

end

