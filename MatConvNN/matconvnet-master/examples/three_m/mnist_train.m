clc;
clear all;
close all;
[net_fc, info_fc] = cnn_mnist('expDir', 'data/mnist-extra'); % models can be found in "data/mnist" (a pretrained model is in the data/mnist-baseline).