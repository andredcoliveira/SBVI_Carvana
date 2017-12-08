function axis = third_proporHW(mask_side)
    img = mask_side;
    [height, width, top, bottom, left, right] = tam_med(img);
    axis = height / width;
end