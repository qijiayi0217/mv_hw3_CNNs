function x = attack(x, mean, sigma, degree)
% function [x] = attack(testimage, mean, standard deviation of Gaussian noise,
% rotation degree)
%
%     Yapeng Tian
%     Jie Chen
%     Chenliang Xu
%
% Function to add Gaussian noise and rotate the test image
% 

% transform to original image
x = x + mean;

% add noise
x = max(0, min(255, single(x + sigma*randn(size(x)))));

% rotate the image
x = imrotate(x, degree, 'nearest', 'crop');

% remove DC
x = x - mean;

end