function net = cnn_init1(varargin)
% Initialize a CNN network for MNIST classification
%
%     Yapeng Tian
%     Jie Chen
%     Chenliang Xu
%
% Function to define and initialize a classification network  
%

rng('default'); 
rng(0) ;

%% Network Structure
net.layers = {} ;
%%%%% Define your network here
net.layers{end+1}=struct('type','conv',...
                         'weights',{{0.01*randn(5,5,1,16, 'single'),zeros(1, 16, 'single')}},...
                         'stride',1,...
                         'pad',2);

net.layers{end+1} = struct('type','relu');

net.layers{end+1} = struct('type','pool',...
                           'method', 'max',...
                           'pool', 2,...
                           'stride', 2,...
                           'pad', 0) ;

net.layers{end+1}=struct('type','conv',...
                         'weights',{{0.01*randn(5,5,16,32, 'single'), zeros(1, 32, 'single')}},...
                         'stride',1,...
                         'pad',2);

net.layers{end+1} = struct('type','relu');

net.layers{end+1} = struct('type','pool',...
                            'method', 'max',...
                            'pool', 2,...
                            'stride', 2,...
                            'pad', 0) ;

net.layers{end+1}=struct('type','conv',...
                         'weights',{{0.01*randn(5,5,32,64, 'single'), zeros(1, 64, 'single')}},...
                         'stride',1,...
                         'pad',2);

net.layers{end+1} = struct('type','relu');

net.layers{end+1} = struct('type','pool',...
                           'method', 'max',...
                           'pool', 7,...
                           'stride', 1,...
                           'pad', 0) ;

net.layers{end+1} = struct('type','conv',...
                           'weights',{{0.01*randn(1,1,64,10, 'single'),zeros(1, 10, 'single')}},...
                           'stride',1,...
                           'pad',0);



%%%%% End of code block
net.layers{end+1} = struct('type', 'softmaxloss') ;
%%

% Meta parameters 
net.meta.inputSize = [28 28 1] ;
net.meta.trainOpts.learningRate = 0.001 ;
net.meta.trainOpts.numEpochs = 20 ;
net.meta.trainOpts.batchSize = 100 ;

% Fill in defaul values
net = vl_simplenn_tidy(net) ;
