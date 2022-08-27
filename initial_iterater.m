%% Simulation part 1 CTTV
clc;clear;close all;
%% Time steps:
Step = 0.0001;
T_end = 5;
t = 0:Step:T_end;
%% Variable
s = cell(1,length(t));
u = cell(1,length(t));
%% Parameters
M = 5000;
Tf = 5;
%% Initial value
s{1} = 1;
W_a_initial = [-1.0675 0.7242 -0.9484 1.1355 -0.7161 -1.3115 0.4865 0.9666];
Y_a_initial = [0.6565 -1.0053 0.5934 -0.2612 0.4904 0.6533 0.0286 -0.9361;
               -0.0492 0.2452 0.0217 0.0655 -0.0372 0.2163 -0.5248 0.2955]';
b_a_initial = [1.5045 -0.2904 0.8204 0.1544 1.0847 -1.5262 0.4379 1.0963]';
%% Simulation
for i = 1:length(t)
    u{i} = W_a_initial*tanh(Y_a_initial*[s{i};t(i)]+b_a_initial);
    if i == length(t)
        break
    end
    %% Update state
    s{i+1} = s{i} + Step*(0.2*(2+sin(0.3*t(i)*s{i}))*s{i}+u{i});
end

s_m = cell2mat(s);
plot(t,s_m);