function zplus=g(x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file                Author: Xuyang Lou, Yuchun Li
%
% Project: Simulation of a hybrid system
%
% Name: g.m
%
% Description: Jump map
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% states 
v=x(1);
w=x(2);
t=x(3);

global kappa;

% parameters
c=-55;d=4;

e=kappa*sin(t);  % perturbation

% jump map
zplus=[c+e;  w+d;  t];