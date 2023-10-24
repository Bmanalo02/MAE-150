clear all
clc
syms theta                                                                 % makes theta a symbolic variable
%--------------------------------------------------------------------------
%                               Question 2a
%--------------------------------------------------------------------------
L1=25;
Beta1=deg2rad(150);
Deg1=deg2rad(0);
f1= @(theta) L1*(((10/Beta1^3)*(theta-Deg1)^3)-((15/Beta1^4)*(theta-Deg1)^4)+((6/Beta1^5)*(theta-Deg1)^5));
d1f1=diff(f1,theta);
d2f1=diff(f1,theta,2);
%--------------------------------------------------------------------------
Deg2=deg2rad(150);
f2=@(theta)25;
d1f2=diff(f2,theta);
d2f2=diff(f2,theta,2);
d3f2=diff(f2,theta,3);
%--------------------------------------------------------------------------
L3=-25;
Deg3=deg2rad(180);
Beta3=deg2rad(120);
f3=@(theta) 25+L3*(((theta-Deg3)/Beta3)-(1/(2*pi))*sin((2*pi*(theta-Deg3))/Beta3));
d1f3=diff(f3,theta);
d2f3=diff(f3,theta,2);
%--------------------------------------------------------------------------
Deg4=deg2rad(300);
f4=@(theta) 0;
d1f4=diff(f4,theta);
d2f4=diff(f4,theta,2);
%--------------------------------------------------------------------------
%                            Plotting Graphs
%--------------------------------------------------------------------------
theta=linspace(1,360,10000);
tiledlayout(2,2)
%--------------------------------------------------------------------------
subplot(3,1,1)
hold on
fplot(f1,[0,Deg2],'--.',1/deg2rad(1)) 
fplot(f2,[Deg2,Deg3],'--.',1/deg2rad(1))
fplot(f3,[Deg3,Deg4],'--.',1/deg2rad(1))
fplot(f4,[Deg4,2*pi],'--.',1/deg2rad(1))
xlabel('Theta (rad)')
ylabel('Displacement (mm)')
%--------------------------------------------------------------------------
subplot(3,1,2)
hold on
fplot(d1f1,[0,Deg2],'--.',1/deg2rad(1)) 
fplot(d1f2,[Deg2,Deg3],'--.',1/deg2rad(1))
fplot(d1f3,[Deg3,Deg4],'--.',1/deg2rad(1))
fplot(d1f4,[Deg4,2*pi],'--.',1/deg2rad(1))
xlabel('Theta (rad)')
ylabel('Velocity (mm/s)')
%--------------------------------------------------------------------------
subplot(3,1,3)
hold on
fplot(d2f1,[0,Deg2],'--.',1/deg2rad(1))  
fplot(d2f2,[Deg2,Deg3],'--.',1/deg2rad(1))
fplot(d2f3,[Deg3,Deg4],'--.',1/deg2rad(1))
fplot(d2f4,[Deg4,2*pi],'--.',1/deg2rad(1))
xlabel('Theta (rad)')
ylabel('Acceleration (mm/s^2)')
%--------------------------------------------------------------------------