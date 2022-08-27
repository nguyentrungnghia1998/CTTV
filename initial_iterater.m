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
W_a_initial = [-1.32 -1.92 -0.34 3.73 0.25 0.53 0.46 0.26];
Y_a_initial = [2.41 0.45 0.71 0.34 1.24 -0.98 -0.77 0.65;
               -0.07 -0.99 1.43 -0.68 1.28 -1.11 -1.07 -0.89]';
b_a_initial = [-5.12 -1.08 -1.22 -0.95 0.47 -0.38 -1.99 1.1]';
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