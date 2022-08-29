%% Test_1_iteration
clc;clear;close all;
%% Time and step
Step = 0.0001;
T_end = 5;
t = 0:Step:T_end;
%% Data 
s_m = load('second_time.mat');
s_m = s_m.s_m;
%% Calculate utility function
W_a_initial = [-1.0675 0.7242 -0.9484 1.1355 -0.7161 -1.3115 0.4865 0.9666];
Y_a_initial = [0.6565 -1.0053 0.5934 -0.2612 0.4904 0.6533 0.0286 -0.9361;
               -0.0492 0.2452 0.0217 0.0655 -0.0372 0.2163 -0.5248 0.2955]';
b_a_initial = [1.5045 -0.2904 0.8204 0.1544 1.0847 -1.5262 0.4379 1.0963]';
u = cell(1,length(s_m));
for i = 1:length(s_m)
    u{i} = W_a_initial*tanh(Y_a_initial*[s_m(i);t(i)]+b_a_initial);
end
u = cell2mat(u);
U = 0.2*s_m.^2 + 0.2*u.^2;
V = cumsum(U,'reverse')*Step;
%% Write csv matrix, to train neural network
X = [s_m(1:10:end)' t(1:10:end)'];
y = V(1:10:end)';
writematrix(X,'data_input.csv');
writematrix(y,'target.csv');