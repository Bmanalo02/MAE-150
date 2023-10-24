clear all
syms theta
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%                               Question 2a
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------establish parameters-piecewise funct 1
L1=25;
Beta1=deg2rad(150);
Deg1=deg2rad(0);
f1= @(theta) L1*(((10/Beta1^3)*(theta-Deg1)^3)-((15/Beta1^4)*(theta-Deg1)^4)+((6/Beta1^5)*(theta-Deg1)^5));
d1f1=diff(f1,theta);
d2f1=diff(f1,theta,2);
%--------------------------------------------------------------------------piecewise funct 2
Deg2=deg2rad(150);
f2=@(theta)25;
d1f2=diff(f2,theta);
d2f2=diff(f2,theta,2);
d3f2=diff(f2,theta,3);
%--------------------------------------------------------------------------piecewise funct 3
L3=-25;
Deg3=deg2rad(180);
Beta3=deg2rad(120);
f3=@(theta) 25+L3*(((theta-Deg3)/Beta3)-(1/(2*pi))*sin((2*pi*(theta-Deg3))/Beta3));
d1f3=diff(f3,theta);
d2f3=diff(f3,theta,2);
%--------------------------------------------------------------------------piecewise funct 4
Deg4=deg2rad(300);
f4=@(theta) 0;
d1f4=diff(f4,theta);
d2f4=diff(f4,theta,2);
%--------------------------------------------------------------------------
%                            Plotting Graphs
%--------------------------------------------------------------------------
theta=linspace(1,360,10000);
tiledlayout(2,2)
%--------------------------------------------------------------------------Displacement (mm)
subplot(3,1,1)
hold on
fplot(f1,[0,Deg2],'--.',1/deg2rad(1)) 
fplot(f2,[Deg2,Deg3],'--.',1/deg2rad(1))
fplot(f3,[Deg3,Deg4],'--.',1/deg2rad(1))
fplot(f4,[Deg4,2*pi],'--.',1/deg2rad(1))
xlabel('Theta (rad)')
ylabel('Displacement (mm)')
%--------------------------------------------------------------------------Velocity (mm/s)
subplot(3,1,2)
hold on
fplot(d1f1,[0,Deg2],'--.',1/deg2rad(1)) 
fplot(d1f2,[Deg2,Deg3],'--.',1/deg2rad(1))
fplot(d1f3,[Deg3,Deg4],'--.',1/deg2rad(1))
fplot(d1f4,[Deg4,2*pi],'--.',1/deg2rad(1))
xlabel('Theta (rad)')
ylabel('Velocity (mm/s)')
%--------------------------------------------------------------------------Acceleration (mm/s^2)
subplot(3,1,3)
hold on
fplot(d2f1,[0,Deg2],'--.',1/deg2rad(1))  
fplot(d2f2,[Deg2,Deg3],'--.',1/deg2rad(1))
fplot(d2f3,[Deg3,Deg4],'--.',1/deg2rad(1))
fplot(d2f4,[Deg4,2*pi],'--.',1/deg2rad(1))
xlabel('Theta (rad)')
ylabel('Acceleration (mm/s^2)')
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%                               Question 2b
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
Omega=2*pi*1000;
rBaseCircle=35;
rFollowerCircle=10;
rPrimeCircle=rBaseCircle+rFollowerCircle;
Phif1=@(theta) atan((d1f1(theta)/Omega)/(rPrimeCircle+f1(theta)))
Phif2=@(theta) atan((d1f2(theta)/Omega)/(rPrimeCircle+f2(theta)));
Phif3=@(theta) atan((d1f3(theta)/Omega)/(rPrimeCircle+f3(theta)));
Phif4=@(theta) atan((d1f4(theta)/Omega)/(rPrimeCircle+f4(theta)));
%--------------------------------------------------------------------------
f1= @(theta) (L1/2)*(1-cos((pi*(theta-Deg1)/Beta1)));
d1f1=@(theta) (219719140603157875*theta^4)/36028797018963968 - (143805841244154925*theta^3)/4503599627370496 + (376482811996614375*theta^2)/9007199254740992;
d1f2=@(theta) 0;
d1f3=@(theta) -(430062085441699425*cos(3*theta))/36028797018963968 - 75/(2*pi);
d1f4=@(theta) 0;
%--------------------------------------------------------------------------
figure(6)
fplot(Phif1,[Deg1,Deg2],'--.',deg2rad(1)) 
hold on
fplot(Phif2,[Deg2,Deg3],'--.',deg2rad(1))
fplot(Phif3,[Deg3,Deg4],'--.',deg2rad(1))
fplot(Phif4,[Deg4,2*pi],'--.',deg2rad(1))
%-------------------------------------------------------------------------
%                               Question 2c
%--------------------------------------------------------------------------
shift=90;
Deg1=deg2rad(0)+deg2rad(shift);
Deg2=deg2rad(150)+deg2rad(shift);
Deg3=deg2rad(180)+deg2rad(shift);
Deg4=deg2rad(300)+deg2rad(shift);
Deg5=deg2rad(360)+deg2rad(shift);
interval1=linspace(Deg1,Deg2);
interval2=linspace(Deg2,Deg3);
interval3=linspace(Deg3,Deg4);
interval4=linspace(Deg4,Deg5);
CCf1= @(theta) 35+L1*(((10/Beta1^3)*(theta-Deg1)^3)-((15/Beta1^4)*(theta-Deg1)^4)+((6/Beta1^5)*(theta-Deg1)^5));
CCf2= @(theta) 35+25;
CCf3= @(theta) 35+25+L3*(((theta-Deg3)/Beta3)-(1/(2*pi))*sin((2*pi*(theta-Deg3))/Beta3));
CCf4= @(theta) 35+0;
PCf1= @(theta) 45+L1*(((10/Beta1^3)*(theta-Deg1)^3)-((15/Beta1^4)*(theta-Deg1)^4)+((6/Beta1^5)*(theta-Deg1)^5));
PCf2= @(theta) 45+25;
PCf3= @(theta) 45+25+L3*(((theta-Deg3)/Beta3)-(1/(2*pi))*sin((2*pi*(theta-Deg3))/Beta3));
PCf4= @(theta) 45+0;
%-------------------------------------------------------------------------- plot cartesian coords
figure(2)
fplot(CCf1,[Deg1,Deg2],'--r')
hold on
fplot(CCf2,[Deg2,Deg3],'--r')
fplot(CCf3,[Deg3,Deg4],'--r')
fplot(CCf4,[Deg4,Deg5],'--r')
fplot(PCf1,[Deg1,Deg2],'-r')
fplot(PCf2,[Deg2,Deg3],'-r')
fplot(PCf3,[Deg3,Deg4],'-r')
fplot(PCf4,[Deg4,Deg5],'-r')
legend('Cam Contour','','','','Pitch Curve','','','')
title('Cam Contour and Pitch Curve (Cartesian)')
ylabel('Radius (mm)')
xlabel('Theta (rad)')
hold off
%-------------------------------------------------------------------------- Establish polar coords
f1= L1*(((10./Beta1.^3).*(interval1-Deg1).^3)-((15./Beta1.^4).*(interval1-Deg1).^4)+((6./Beta1.^5).*(interval1-Deg1).^5));
f2= 25+interval2.*0;
f3= 25+L3*(((interval3-Deg3)./Beta3)-(1./(2*pi)).*sin((2.*pi.*(interval3-Deg3))./Beta3));
f4= 0+interval4.*0;
primecircle=45+0*theta;
basecircle=35+0*theta;
%-------------------------------------------------------------------------- plot polar coords
figure(3)
polarplot(interval1,f1+35,'Color','r')
hold on
polarplot(interval2,f2+35,'Color','r')
polarplot(interval3,f3+35,'Color','r')
polarplot(interval4,f4+35,'Color','r','DisplayName','Cam Contour')
polarplot(theta,primecircle,'Color','b','DisplayName','Prime Circle')
polarplot(theta,basecircle,'Color','g','DisplayName','Base Circle')
polarplot(interval1,f1+45,'Color','c')
polarplot(interval2,f2+45,'Color','c')
polarplot(interval3,f3+45,'Color','c')
polarplot(interval4,f4+45,'Color','c','DisplayName','Pitch Curve')
legend('','','','Cam Contour','Prime Circle','Base Circle','','','','Pitch Curve')
title('Cam Contour (mm)')