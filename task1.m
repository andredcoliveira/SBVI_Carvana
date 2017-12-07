%% Let's get things started

cars = startup;

% figure; imshow(cars{1}{1})  % cars -> comp_front -> compact1
% type_view = size(cars,2)  % cars rows (16)
% car = size(cars{1},2)  % type_view rows (4)
% img_rows = size(cars{1}{1},1)
% img_cols = size(cars{1}{1},2)


%% Segmentation




%% Efficiency

similarity = zeros(size(cars,2), size(cars{1},2));
for i = 1:size(cars,2)
    for j = 1:size(cars{1},2)
        similarity(i,j) = 2*nnz(segIm&grndTruth)/(nnz(segIm) + nnz(grndTruth));
    end
end
