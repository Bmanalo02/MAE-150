clear all
clc
%--------------------------------------------------------------------------
%                            Question 2C
%--------------------------------------------------------------------------
n = 1000000;                                                               %Number of trials
%--------------------------------------------------------------------------
HedgieScore0=zeros(1,n);                                                   %Preallocating vectors for each value
HedgieScore1=zeros(1,n);
Hedgiescore2=zeros(1,n);
DogeScore0=zeros(1,n);
DogeScore1=zeros(1,n);
DogeScore2=zeros(1,n);
%--------------------------------------------------------------------------
%                          Monte Carlo Method
%--------------------------------------------------------------------------
for i=1:n
    X_hedgie0 = (20*rand)+55;                                              %2A: Uniform distribution functions for Hedgie and Doge (in terms of r)
    X_doge0 = (10*rand)+90;
    X_hedgie1 = 97+3*(sqrt(2)*erfinv(2*rand-1));                           %2B: Uniform distribution functions for Hedgie and Doge (in terms of error)
    X_doge1 = 95+0.5*(sqrt(2)*erfinv(2*rand-1));  
    X_hedgie2 = (0.25)*(sqrt(X_hedgie0)+sqrt(X_hedgie1))^2;                %2C: Provided score formula for Hedgie and Doge in part C
    X_doge2 =  (0.25)*(sqrt(X_doge0)+sqrt(X_doge1))^2;  
%--------------------------------------------------------------------------
    HedgieScore0(i)=X_hedgie0;                                              %Populating vectors for each value
    HedgieScore1(i)=X_hedgie1;
    Hedgiescore2(i)=X_hedgie2;
    DogeScore0(i)=X_doge0;
    DogeScore1(i)=X_doge1;
    DogeScore2(i)=X_doge2;    
end
%--------------------------------------------------------------------------
%                          Graphing Plots
%--------------------------------------------------------------------------
figure(1)
subplot(3,1,1)                                                             %Plot for MC of function 2A
histogram(HedgieScore0,(0:110))
hold on
histogram(DogeScore0,(0:110))
title('2A')
xlabel('Score') 
ylabel('Probability')
legend('Hedgie','Doge') 

subplot(3,1,2)                                                             %Plot for MC of function 2B
histogram(HedgieScore1,(0:110))
hold on
histogram(DogeScore1,(0:110))
title('2B')
xlabel('Score') 
ylabel('Probability')
legend('Hedgie','Doge') 

subplot(3,1,3)                                                             %Plot for MC of function 2C
histogram(Hedgiescore2,(0:110))
hold on
histogram(DogeScore2,(0:110))
title('2C')
xlabel('Score') 
ylabel('Probability') 
legend('Hedgie','Doge')
