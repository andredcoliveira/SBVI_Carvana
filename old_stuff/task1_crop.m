%% Let's get things started

% Limpeza inicial
close all;  %windows
clc;  %commands
clear;  %workspace

cars = startup; % get every car photo

% figure; imshow(cars{1}{1})  % cars -> comp_front -> compact1
% type_view = size(cars,2)  % cars rows (16)
% car = size(cars{i},2)  % type_view rows (varia)
% img_rows = size(cars{1}{1},1)
% img_cols = size(cars{1}{1},2)


%% Adaptation to image

% letter_widths = [99-76 655-636 1401-1354 1554-1506];
% letter_widths2 = [54-29 632-610 1380-1333 1536-1487];
% letter_widths3 = [141-119 683-665 1365-1323 1504-1461];
% letter_widths4 = [162-139 678-660 1371-1326 1522-1473];
% letter_widths5 = [53-29 629-610 1380-1332 1534-1486];

% letter_widths = [23 19 47 48];
% letter_widths2 = [25 22 47 49];
% letter_widths3 = [22 18 42 43];
% letter_widths4 = [23 18 45 49];
% letter_widths5 = [24 19 48 48];
% 
% widths_sup = [28 26 54 55];
% widths_inf = [19 14 36 37];
% 
% widths_mid = [23.5 20 45 46];

lw_sup = [28 55];
lw_inf = [14 37];


%% Boundaries

% for i = 1:size(cars,2)
%     for j = 1:size(cars{i},2)
% for x = 1:2
%         i = 3; j = 1;  %dev
        
%         if( x == 1)
            car = cars{i}{j};
%         end
        
%         figure; imshow(car)  %dev
%         title('original');  %dev
        
%         car = medfilt2(car, [5 5]);
        car_sides = imclose(car, strel('line', 120, 0));
%         car_sides = car;
          
%         car_sides = imclose(car, strel('line', 30, 90));
%         car_sides = imdilate(car, strel('line', 15, 0));
        car_sides = imgaussfilt(car_sides, 1);


%         figure; imshow(car_sides)  %dev
%         title('car sides');  %dev
        
        % left / write coordinates
        
        sum_cols = zeros(1, size(car_sides,2));
        for k = 1:size(car_sides,2)
            sum_cols(k) = sum(car_sides(:,k));
        end
%         figure; plot(sum_cols);  %dev
%         title('original sum cols');  %dev
%         figure; plot(diff(sum_cols));  %dev
%         title('original diff sum cols');  %dev
        
        
        [maxima, max_x] = findpeaks(diff(sum_cols));
        [minima, min_x] = findpeaks(diff(-sum_cols));
%         figure; subplot(2,1,1); plot(maxima)  %dev
%         title('maxima')  %dev
%         subplot(2,1,2); plot(max_x)  %dev
%         title('max_x')  %dev
%         figure; subplot(2,1,1); plot(minima)  %dev
%         title('minima')  %dev
%         subplot(2,1,2); plot(min_x)  %dev
%         title('min_x')  %dev
        
        c1 = 0;
        c2 = 0;
        for k = 1:min(size(maxima,2), size(minima,2))
            if(abs(maxima(k)) < 0.20*max(maxima))
                maxima(k) = 0;
            else
                c1 = c1 + 1;
            end
            if(abs(minima(k)) < 0.20*max(minima))
                minima(k) = 0;
            else
                c2 = c2 + 1;
            end
        end
        
        tmp_max = zeros(1, c1);
        tmp_max_x = zeros(1, c1);
        tmp_min = zeros(1, c2);
        tmp_min_x = zeros(1, c2);
        c1 = 0;
        c2 = 0;
        for k = 1:min(size(maxima, 2), size(minima, 2))
            if(maxima(k) ~= 0)
                c1 = c1 + 1;
                tmp_max(c1) = maxima(k);
                tmp_max_x(c1) = max_x(k);
            end
            if(minima(k) ~= 0)
                c2 = c2 + 1;
                tmp_min(c2) = minima(k);
                tmp_min_x(c2) = min_x(k);
            end
        end
        
%         figure; subplot(2,1,1); plot(tmp_max)  %dev
%         title('tmp max')  %dev
%         subplot(2,1,2); plot(tmp_max_x)  %dev
%         title('tmp max x')  %dev
%         figure; subplot(2,1,1); plot(tmp_min)  %dev
%         title('tmp min')  %dev
%         subplot(2,1,2); plot(tmp_min_x)  %dev
%         title('tmp min x')  %dev
        
        % apagar máximos precedidos de mínimos cuja distância perfaz a
        % largura de uma letra
        c3 = 0;
        for w = 1:size(tmp_max, 2)
            v = 1;
            while(v <= length(tmp_min_x) && tmp_min_x(v) < tmp_max_x(w))
                dist = tmp_max_x(w) - tmp_min_x(v);
                if((dist <= lw_sup(1) && dist >= lw_inf(1)) || (dist <= lw_sup(2) && dist >= lw_inf(2)))
                    tmp_max(w) = 0;
                    tmp_max_x(w) = 0;
                    tmp_min(v) = 0;
                    tmp_min_x(v) = 0;
                    c3 = c3 + 1;
                end
                v = v + 1;
            end
        end
        
        maxima = zeros(1, c1-c3);
        max_x = zeros(1, c1-c3);
        minima = zeros(1, c2-c3);
        min_x = zeros(1, c2-c3);
        c1 = 0;
        c2 = 0;
        for k = 1:size(tmp_max, 2)
            if(tmp_max(k) ~= 0)
                c1 = c1 + 1;
                maxima(c1) = tmp_max(k);
                max_x(c1) = tmp_max_x(k);
            end
        end
        for k = 1:size(tmp_min, 2)
            if(tmp_min(k) ~= 0)
                c2 = c2 + 1;
                minima(c2) = tmp_min(k);
                min_x(c2) = tmp_min_x(k);
            end
        end
        
%         figure; subplot(2,1,1); plot(maxima)  %dev
%         subplot(2,1,2); plot(max_x)  %dev
%         title('decisive max');  %dev
        
%         figure; subplot(2,1,1); plot(minima)  %dev
%         subplot(2,1,2); plot(min_x)  %dev
%         title('decisive min');  %dev
        
        % left
        if(max_x(1) < min_x(1)); left = max_x(1); else; left = min_x(1); end
        
        % right
        if(max_x(length(max_x)) > min_x(length(min_x))); right = max_x(length(max_x)); else; right = min_x(length(min_x)); end
        
        
        
        %% top / bottom

        smoothed = adapthisteq(car);
        smoothed = imgaussfilt(smoothed, 2);
        smoothed = imclose(smoothed, strel('line', 150, 0));
%         smoothed = imdilate(smoothed, strel('disk', 35));
%         figure; imshow(smoothed)  %dev
%         title('top / bottom')  %dev
%         smoothed = imerode(smoothed, strel('disk', 5));
%         smoothed = adapthisteq(smoothed);
        smoothed = imgaussfilt(smoothed, 7);
%         figure; imshow(smoothed)  %dev
%         title('open')  %dev

        sum_cols = zeros(1, size(smoothed,1));

        for k = 1:size(smoothed,1)
            sum_cols(k) = sum(smoothed(k,:));
        end

%         figure; plot(sum_cols)  %dev
%         title('sum cols');  %dev
%         figure; plot(abs(diff(sum_cols)))  %dev
%         title('Cols 1ª Derivada');  %dev
%         figure; plot(abs(diff(diff(sum_cols))))
%         title('Cols 2ª Derivada');

        [maxima, max_y] = findpeaks(diff(sum_cols));
        [minima, min_y] = findpeaks(diff(-sum_cols));
%         figure; subplot(2,1,1); plot(maxima)  %dev
%         title('maxima')  %dev
%         subplot(2,1,2); plot(max_y)  %dev
%         title('max y')  %dev
%         figure; subplot(2,1,1); plot(minima)  %dev
%         title('minima')  %dev
%         subplot(2,1,2); plot(min_y)  %dev
%         title('min y')  %dev
        
        c1 = 0;
        c2 = 0;
        for k = 1:min(size(maxima,2), size(minima,2))
            if((abs(maxima(k)) < 0.30*max(maxima)) || (max_y(k) < 0.10*size(car,1)) || (max_y(k) > 0.90*size(car,1)))
                maxima(k) = 0;
            else
                c1 = c1 + 1;
            end
            if((abs(minima(k)) < 0.20*max(minima)) || (min_y(k) < 0.10*size(car,1)) || (min_y(k) > 0.90*size(car,1)))
                minima(k) = 0;
            else
                c2 = c2 + 1;
            end
        end
        
        tmp_max = zeros(1, c1);
        tmp_max_y = zeros(1, c1);
        tmp_min = zeros(1, c2);
        tmp_min_y = zeros(1, c2);
        c1 = 0;
        c2 = 0;
        for k = 1:min(size(maxima, 2), size(minima, 2))
            if((maxima(k) ~= 0) && ((max_y(k) > 0.10*size(car,1)) && (max_y(k) < 0.90*size(car,1))))
                c1 = c1 + 1;
                tmp_max(c1) = maxima(k);
                tmp_max_y(c1) = max_y(k);
            end
            if((minima(k) ~= 0) && ((min_y(k) > 0.10*size(car,1)) && (min_y(k) < 0.90*size(car,1))))
                c2 = c2 + 1;
                tmp_min(c2) = minima(k);
                tmp_min_y(c2) = min_y(k);
            end
        end
        
%         figure; subplot(2,1,1); plot(tmp_max)  %dev
%         title('tmp max')  %dev
%         subplot(2,1,2); plot(tmp_max_y)  %dev
%         title('tmp max y')  %dev
%         figure; subplot(2,1,1); plot(tmp_min)  %dev
%         title('tmp min')  %dev
%         subplot(2,1,2); plot(tmp_min_y)  %dev
%         title('tmp min y')  %dev
        
        % top
        if(tmp_max_y(1) < tmp_min_y(1)); top = tmp_max_y(1); else; top = tmp_min_y(1); end
        
        % bottom
        if(tmp_max_y(length(tmp_max_y)) < tmp_min_y(length(tmp_min_y))); bottom = tmp_max_y(length(tmp_max_y)); else; bottom = tmp_min_y(length(tmp_min_y)); end

%         xtolerance = 0.02;
%         ytolerance = 0.10;
        tolerance = [0.10 0.025 0.15 0.05];
        top = top - top*tolerance(1);
        right = right + right*tolerance(2);
        bottom = bottom + bottom*tolerance(3);
        left = left - left*tolerance(4);
        car = imcrop(car, [left top right-left bottom-top]);
        figure; imshow(car)
%     end
% end


%% Efficiency

% gndtrus = getGroundTruths;
% 
% similarity = zeros(size(cars,2), size(cars{1},2));
% for i = 1:size(cars,2)
%     for j = 1:size(cars{1},2)
%         similarity(i,j) = 2*nnz(segIm&grndTruth)/(nnz(segIm) + nnz(grndTruth));
% end
%     end
% end
