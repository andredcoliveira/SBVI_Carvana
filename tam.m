function [height, width] = tam(imgs)

imshow(imgs)

[x1,y1] = size(imgs{1});
c = 0;
min_top = 0;
max_bottom = 0;
min_left = 0;
max_right = 0;
for j = 1:4
    for i = 1:x1
        img = imgs{j};
        total_line = sum(img(i,:));
        if (total_line ~= 0) && (c == 0)
            top_line = i;
            c = 1;
            if (top_line > min_top)
                min_top = top_line;
            end
        end
        if (total_line == 0) && (c ~= 0)
            bottom_line = i;
            c = 0;
            if (bottom_line > max_bottom)
                max_bottom = bottom_line;
            end 
        end
    end
    c = 0;
    for i = 1:y1
        img = imgs{j};
        total_line = sum(img(:,i));
        if (total_line ~= 0) && (c == 0)
            left_line = i;
            c = 1;
            if (left_line > min_left)
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
end
height = max_bottom - min_top;
width = max_right - min_left;
return
end