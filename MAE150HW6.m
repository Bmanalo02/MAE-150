%% HW 6
%% Q2
clear all 
syms w
% Setting Parameters ------------------------------------------------------
L = 2.5; % Length
m = 250; % Mass
EI = 0.001; % E*I in GPa-m^4
M = (m/2)*[1 0 0 0;  % Mass Matrix
    0 L^2/12 0 0; 
    0 0 1 0; 
    0 0 0 L^2/12]; 
M_inverse = inv(M); % [M]^-1
K = (EI/L)*[12/L^2 6/L -12/L^2 6/L; % Stiffness Matrix
              6/L   4   -6/L    2;
          -12/L^2 -6/L 12/L^2 -6/L; 
              6/L   2   -6/L    4];
% Preallocation:
Mg=zeros(10)
Kg=zeros(10)
%% Calculating Eigenvals (w^2) and Eigenvectors (mode shape) ---------------
%calculate global A matrix
for i =1:4
Mg([2*i-1:2*i+2],[2*i-1:2*i+2])=Mg([2*i-1:2*i+2],[2*i-1:2*i+2])+M;
end
Mg;
for i =1:4
Kg([2*i-1:2*i+2],[2*i-1:2*i+2])=Kg([2*i-1:2*i+2],[2*i-1:2*i+2])+K;
end
Kg;
Ag=inv(Mg)*Kg
%return eigenvectors and eigenvalues
[eigenvectors, eigenvalues] =eig(Ag)
w=sqrt(eigenvalues)