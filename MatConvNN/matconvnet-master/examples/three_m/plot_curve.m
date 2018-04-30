%% plot your curves here
% 
% curve 1: accuracy with different noise levels (sigma = 0, 20, 40, 60, 80, 100, 1000)
%
% curve 2: accuracy with different rotation degrees (0, 20, 45, 90, 135, 160, 180)
%
% curve 3: accuracy with differenct sigma for data augmentation model
%
% curve 4: accuracy with differenct degree for data augmentation model
% please analyze results in your report   
%
% 
accuracy_baseline_curve1=[98.47,97.78,92.94,73.52,44.96,25.14,9.73];
% data augmentation model add noise
accuracy_baseline_curve3=[97.08,97.34,97.22,96.41,94.79,90.44,11.53];
% data augmentation model add rotation
accuracy_baseline_curve4=[97.08,95.81,91.73,90.83,90.79,92.12,89.32];
accuracy_enhanced_curve1=[99.11,99.06,98.81,98.01,93.00,77.75,9.93];
accuracy_baseline_curve2=[98.47,92.26,47.94,15.00,27.51,41.13,43.37];
accuracy_enhanced_curve2=[99.11,94.95,54.15,12.22,27.77,39.43,41.85];
sigma=[0,20,40,60,80,100,1000];
degrees=[0,20,45,90,135,160,180];
subplot(2,2,1);
plot(sigma,accuracy_baseline_curve1,'r');
title('Add noise');
hold on;
plot(sigma,accuracy_enhanced_curve1,'b');
%title('Add noise');
legend('baseline','enhanced');
hold off;
subplot(2,2,2);
plot(degrees,accuracy_baseline_curve2,'r');
title('Add rotation');
hold on;
plot(degrees,accuracy_enhanced_curve2,'b');
legend('baseline','enhanced');
hold off;
subplot(2,2,3);
plot(sigma,accuracy_baseline_curve1,'r');
title('Add noise with augmented model');
hold on;
plot(sigma,accuracy_baseline_curve3,'b');
legend('baseline','augmented','Location','NorthOutside');
hold off;
subplot(2,2,4);
plot(degrees,accuracy_baseline_curve2,'r');
title('Add rotation with augmented model');
hold on;
plot(degrees,accuracy_baseline_curve4,'b');
legend('baseline','augmented','Location','NorthOutside');
hold off;
