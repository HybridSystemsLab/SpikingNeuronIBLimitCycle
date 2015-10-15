
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file                Author: Xuyang Lou, Yuchun Li
%
% Project: Simulation of the Izhikevich neuron with perturbation
%
% Name: run.m
%
% Description: run script
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function run
close all;

% global parameter: amplitude of perturbation
global kappa;
kappa=0.24;
% kappa=0.42;

TSPAN=[0 400];
JSPAN = [0 30];

% rule for jumps
% rule = 1 -> priority for jumps
% rule = 2 -> priority for flows
rule = 1;

for i=[1 2]
    
    % initial conditions
    z0=[-55; -6];
    x0=[z0; 0];
    
    % when there is no perturbation
    if i==2
        kappa=0;
    end
    
    % simulate
    [t j x] = HyEQsolver(@f,@g,@C,@D,x0,TSPAN,JSPAN,rule);
    v=x(:,1);
    w=x(:,2);    
    
    % plot solution
    figure(1);hold on;
    if i==1
        modificator{1} = 'r';   % red line for perturbation case
    else
        modificator{1} = 'b';   % blue line for non-perturbation case
    end
    modificator{2} = 'LineWidth';
    modificator{3} = 2;
    plotHarc(v,j,w,[],modificator);
    xlabel('v (mV)');
    ylabel('w');
    grid on;box on; 
    hold on;
    
    % plot initial value
    plot(x0(1),x0(2),'mx','linewidth',2);
    
end

