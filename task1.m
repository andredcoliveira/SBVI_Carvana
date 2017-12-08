%% Let's get things started

% Limpeza inicial
close all;
clc;
clear;

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
        i = 7; j = 3;  %dev
        
        car = cars{i}{j};
        
%         car = medfilt2(car, [5 5]);
             
%         car = imclose(car, strel('line', 30, 90));
%         car = imdilate(car, strel('line', 15, 0));
        car = imgaussfilt(car, 1);


        figure; imshow(car)  %dev
        title('original');
        figure; imhist(car)
        title('original');
        
        % left / write coordinates
        
        sum_cols = zeros(1, size(car,2));
        for k = 1:size(car,2)
            sum_cols(k) = sum(car(:,k));
        end
        figure; plot(sum_cols);
        title('original sum cols');
        diff_sum_cols = diff(sum_cols);
        figure; plot(diff_sum_cols);
        title('original diff sum cols');
        
        
        [maxima, max_x] = findpeaks(diff(sum_cols));
        [minima, min_x] = findpeaks(diff(-sum_cols));
        figure;
        subplot(2,1,1); plot(maxima)
        title('maxima')
        subplot(2,1,2); plot(max_x)
        title('max_x')
        figure;
        subplot(2,1,1); plot(minima)
        title('minima')
        subplot(2,1,2); plot(min_x)
        title('min_x')
        
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
                c2 = c2 + 2;
                tmp_min(c2) = minima(k);
                tmp_min_x(c2) = min_x(k);
            end
        end
        
        figure;
        subplot(2,1,1); plot(tmp_max)
        title('tmp max')
        subplot(2,1,2); plot(tmp_max_x)
        title('tmp max x')
        figure;
        subplot(2,1,1); plot(tmp_min)
        title('tmp min')
        subplot(2,1,2); plot(tmp_min_x)
        title('tmp min x')
        
        % em vez de apagar todos os que entrem nas condições, apagar apenas
        % os 2 melhores candidatos de cada condição (obs: separar o if em 2
        % pelo OU ||)
        c1 = 0;
        for w = 1:size(tmp_max, 2)
            for v = 1:size(tmp_min, 2)
                dist = tmp_max_x(w)-tmp_min_x(v);
                if((dist <= lw_sup(1) && dist >= lw_inf(1)) || (dist <= lw_sup(2) && dist >= lw_inf(2)))
                    tmp_max(w) = 0;
                    tmp_max_x(w) = 0;
                    tmp_min(v) = 0;
                    tmp_min_x(v) = 0;
                    c1 = c1 + 1;
                end
            end
        end
        
        figure; subplot(2,1,1); plot(tmp_max)
        subplot(2,1,2); plot(tmp_max_x)
        title('decisive max');
        
        figure; subplot(2,1,1); plot(tmp_min)
        subplot(2,1,2); plot(tmp_min_x)
        title('decisive min');
        
        
        % top / bottom


        smoothed = adapthisteq(car);
        smoothed = imgaussfilt(smoothed, 2);
        smoothed = imclose(smoothed, strel('line', 149, 0));  % top
%         smoothed = imdilate(smoothed, strel('disk', 35));  % bot
        figure; imshow(smoothed)
        title('top / bottom')
%         smoothed = imerode(smoothed, strel('disk', 5));
%         smoothed = adapthisteq(smoothed);
        smoothed = imgaussfilt(smoothed, 7);
        figure; imshow(smoothed)
        title('open')

        sum_cols = zeros(1, size(smoothed,1));

        for i = 1:size(smoothed,1)
            sum_cols(i) = sum(smoothed(i,:));
        end

        figure; plot(sum_cols)
        title('sum cols');
%         figure; imhist(smoothed)
%         title('Histograma');
        figure; plot(abs(diff(sum_cols)))
        title('Cols 1ª Derivada');
%         figure; plot(abs(diff(diff(sum_cols))))
%         title('Cols 2ª Derivada');
        
%     end
% end


%% Efficiency

% gndtrus = getGroundTruths;
% 
% similarity = zeros(size(cars,2), size(cars{1},2));
% for i = 1:size(cars,2)
%     for j = 1:size(cars{1},2)
%         similarity(i,j) = 2*nnz(segIm&grndTruth)/(nnz(segIm) + nnz(grndTruth));
%     end
% end
