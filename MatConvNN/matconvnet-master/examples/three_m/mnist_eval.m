clear all;
close all;
% evaluate trained models on test set
run(fullfile(fileparts(mfilename('fullpath')),...
  '..', '..', 'matlab', 'vl_setupnn.m')) ;
useGPU = false;

%% pre-trained model
%model = "data/mnist-baseline/net-epoch-20";
model = "data/mnist/net-epoch-20"; % model name
load(model);
net = vl_simplenn_tidy(net);

%% test images and labels
Dir = fullfile('data', 'mnist'); % path of the pre-processed mnist dataset
imdbPath = fullfile(Dir, 'imdb.mat');
imdb = load(imdbPath);
im_test = imdb.images.data(:,:,:,imdb.images.set == 3); % 3 : test set; 2 : val set; 1 : train set
real_labels = imdb.images.labels(1,imdb.images.set == 3);

%% prediction
sigma = 0; % noise level
degree = 0; % rotation degree 

pre_labels = zeros(1, length(real_labels));
for i = 1:length(real_labels)
    x = im_test(:, :, :, i);
    % add noise to a test image and rotate it
    x = attack(x, imdb.images.data_mean, sigma, degree);
    %
    label = real_labels(i);
    net.layers{end}.class = label;
    res = vl_simplenn(net, x) ;
    scores = double(gather(res(end-1).x));
    [~, best] = max(scores);
    pre_labels(i) = best;
end

%% evaluation
acc = sum(pre_labels == real_labels)/length(pre_labels);
fprintf("The classification accuracy on test set is %.2f%%.\n", acc * 100);

