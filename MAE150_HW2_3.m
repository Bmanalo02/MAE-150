clear all
clc
%--------------------------------------------------------------------------
%                             Question 3
%--------------------------------------------------------------------------
n = 1000;                                                                  %Number of trials
%--------------------------------------------------------------------------
Funct1= @(x) x.^2;                                                         %Provided functions
Funct2= @(x) cos(pi*x);
Integral1= integral(Funct1,0,1);                                           %integral calculations of provided functions
Integral2= integral(Funct2,0,1);
%--------------------------------------------------------------------------
GraphInt1=zeros(1,n);                                                      %Preallocating vectors for each value
GraphInt2=zeros(1,n);
%--------------------------------------------------------------------------
%                          Monte Carlo Method
%--------------------------------------------------------------------------
for i=1:n
    GraphInt1(i)=(1/i)*sum(Funct1(rand(1,i)));
    GraphInt2(i)=(1/i)*sum(Funct2(rand(1,i)));
end
%--------------------------------------------------------------------------
%                           Graphing Plots
%--------------------------------------------------------------------------
figure(2)
subplot(2,1,1)                                                             %Plot for MC of function 1
plot(1:n,GraphInt1,'-')
hold on
plot([1,n],[Integral1,Integral1],'-r')
legend('After Monte Carlo Method Calculations','Integral Value: 1/3') 
title('Function 1: X^2')
xlabel('Trial #')
ylabel('Value')

subplot(2,1,2)                                                             %Plot for MC of function 2
plot(1:n,GraphInt2,'-')
hold on
plot([1,n],[Integral2,Integral2],'-r')
legend('After Monte Carlo Method Calculations','Integral Value: 0')
title('Function 2: cos(pi*x)')
xlabel('Trial #')
ylabel('Value') 