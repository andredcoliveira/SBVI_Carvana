function white_area = area(mask_side)
    aux = 0;
    white_area = 0;
    for j=1:size(mask_side,2)
        for i=1:size(mask_side,1)
            img = mask_side;
            aux = img(i,j);
            if (aux ~= 0)
                white_area = white_area + 1;
            end
    end
end