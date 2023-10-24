clear all
clc
syms theta                                                                 % makes theta a symbolic variable
%--------------------------------------------------------------------------
%                               Question 1a
%--------------------------------------------------------------------------
L1=10;
Deg1=deg2rad(0);
Beta1=deg2rad(60);
f1= @(theta) (L1/2)*(1-cos((pi*(theta-Deg1)/Beta1)));
d1f1=diff(f1,theta);
d2f1=diff(f1,theta,2);
d3f1=diff(f1,theta,3);
%--------------------------------------------------------------------------
Deg2=deg2rad(60);
f2=@(theta)10;
d1f2=diff(f2,theta);
d2f2=diff(f2,theta,2);
d3f2=diff(f2,theta,3);
%--------------------------------------------------------------------------
L3=15;
Deg3=deg2rad(80);
Beta3=deg2rad(70);
f3=@(theta) 10+L3*(((theta-Deg3)/Beta3)-(1/(2*pi))*sin((2*pi*(theta-Deg3))/Beta3));
d1f3=diff(f3,theta);
d2f3=diff(f3,theta,2);
d3f3=diff(f3,theta,3);
%--------------------------------------------------------------------------
Deg4=deg2rad(150);
f4=@(theta) 25;
d1f4=diff(f4,theta);
d2f4=diff(f4,theta,2);
d3f4=diff(f4,theta,3);
%--------------------------------------------------------------------------
L5=-25;
Deg5=deg2rad(200);
Beta5=deg2rad(100);
f5= @(theta) L5*(((10/Beta5^3)*(theta-Deg5)^3)-((15/Beta5^4)*(theta-Deg5)^4)+((6/Beta5^5)*(theta-Deg5)^5)) +25;
d1f5=diff(f5,theta);
d2f5=diff(f5,theta,2);
d3f5=diff(f5,theta,3);
%--------------------------------------------------------------------------
Deg6=deg2rad(300);
f6=@(theta) 0;
d1f6=diff(f6,theta);
d2f6=diff(f6,theta,2);
d3f6=diff(f6,theta,3);
%-------------------------------------------------------------------------- Plotting Graphs
theta=linspace(1,360,10000);
tiledlayout(2,2)
%--------------------------------------------------------------------------Displacement
nexttile
hold on
fplot(f1,[0,pi/3]) 
fplot(f2,[pi/3,Deg3])
fplot(f3,[Deg3,Deg4])
fplot(f4,[Deg4,Deg5])
fplot(f5,[Deg5,Deg6])
fplot(f6,[Deg6,2*pi])
xlabel('Theta (rad)')
ylabel('Displacement (m)')
%------------------------------------------------------------------------- Velocity
nexttile
hold on
fplot(d1f1,[0,pi/3]) 
fplot(d1f2,[pi/3,Deg3])
fplot(d1f3,[Deg3,Deg4])
fplot(d1f4,[Deg4,Deg5])
fplot(d1f5,[Deg5,Deg6])
fplot(d1f6,[Deg6,2*pi])
xlabel('Theta (rad)')
ylabel('Velocity (m/s)')
%-------------------------------------------------------------------------- Accleration
nexttile
hold on
fplot(d2f1,[0,pi/3]) 
fplot(d2f2,[pi/3,Deg3])
fplot(d2f3,[Deg3,Deg4])
fplot(d2f4,[Deg4,Deg5])
fplot(d2f5,[Deg5,Deg6])
fplot(d2f6,[Deg6,2*pi])
xlabel('Theta (rad)')
ylabel('Acceleration (m/s^2)')
%--------------------------------------------------------------------------Jerk
nexttile
hold on
fplot(d3f1,[0,pi/3]) 
fplot(d3f2,[pi/3,Deg3])
fplot(d3f3,[Deg3,Deg4])
fplot(d3f4,[Deg4,Deg5])
fplot(d3f5,[Deg5,Deg6])
fplot(d3f6,[Deg6,2*pi])
xlabel('Theta (rad)')
ylabel('Jerk (m/s^3)')
%--------------------------------------------------------------------------
%                               Question 1b
%--------------------------------------------------------------------------Set Parameters/Define pressure angle piecewise function
Omega=2*pi*500;
rBaseCircle=30;
rFollowerCircle=5;
rPrimeCircle=rBaseCircle+rFollowerCircle;
Phif1=@(theta) atan((d1f1(theta)/Omega)/(rPrimeCircle+f1(theta)))
Phif2=@(theta) atan((d1f2(theta)/Omega)/(rPrimeCircle+f2(theta)));
Phif3=@(theta) atan((d1f3(theta)/Omega)/(rPrimeCircle+f3(theta)));
Phif4=@(theta) atan((d1f4(theta)/Omega)/(rPrimeCircle+f4(theta)));
Phif5=@(theta) atan((d1f5(theta)/Omega)/(rPrimeCircle+f5(theta)));
Phif6=@(theta) atan((d1f6(theta)/Omega)/(rPrimeCircle+f6(theta)));
%-------------------------------------------------------------------------- define derivative equations
f1= @(theta) (L1/2)*(1-cos((pi*(theta-Deg1)/Beta1)));
d1f1=@(theta) 15*sin(3*theta);
d1f2=@(theta) 0;
d1f3=@(theta) 270/(7*pi) - (774111753795058965*cos((36*theta)/7 - (16*pi)/7))/63050394783186944;
d1f4=@(theta) 0;
d1f5=@(theta) (182004267824633625*(theta - (10*pi)/9)^3)/1125899906842624 - (39707171577767925*(theta - (10*pi)/9)^2)/281474976710656 - (417123055988807625*(theta - (10*pi)/9)^4)/9007199254740992;
d1f6=@(theta) 0;
%--------------------------------------------------------------------------Plot functions
figure(2)
hold on
fplot(Phif1,[Deg1,Deg2]) 
fplot(Phif2,[Deg2,Deg3])
fplot(Phif3,[Deg3,Deg4])
fplot(Phif4,[Deg4,Deg5])
fplot(Phif5,[Deg5,Deg6])
fplot(Phif6,[Deg6,2*pi])
%-------------------------------------------------------------------------
%                               Question 1c
%--------------------------------------------------------------------------degree intervals
Deg1=deg2rad(0);
Deg2=deg2rad(60);
Deg3=deg2rad(80);
Deg4=deg2rad(150);
Deg5=deg2rad(200);
Deg6=deg2rad(300);
interval1=linspace(Deg1,Deg2);
interval2=linspace(Deg2,Deg3);
interval3=linspace(Deg3,Deg4);
interval4=linspace(Deg4,Deg5);
interval5=linspace(Deg5,Deg6);
interval6=linspace(Deg6,2*pi);
%--------------------------------------------------------------------------Piecewise functions
f1= (L1/2).*(1-cos((pi.*(interval1-Deg1)/Beta1)));
f2= 10+interval2*0;
f3= 10+L3*(((interval3-Deg3)./Beta3)-(1./(2.*pi)).*sin((2.*pi.*(interval3-Deg3))./Beta3));
f4= 25+interval4*0;
f5= L5*(((10/Beta5.^3)*(interval5-Deg5).^3)-((15/Beta5.^4)*(interval5-Deg5).^4)+((6/Beta5.^5)*(interval5-Deg5).^5)) +25;
f6= 0*interval6*0;
%--------------------------------------------------------------------------Plotting functions
primecircle=35+0*theta
basecircle=30+0*theta
polarplot(interval1,f1+30)
hold on
polarplot(interval2,f2+30,'-r')
polarplot(interval3,f3+30,'-r')
polarplot(interval4,f4+30,'-r')
polarplot(interval5,f5+30,'-r')
polarplot(interval6,f6+30,'-r')
polarplot(theta,primecircle,".y")
polarplot(theta,basecircle,"--b")
polarplot(interval1,f1+35,'*r')
polarplot(interval2,f2+35,'*r')
polarplot(interval3,f3+35,'*r')
polarplot(interval4,f4+35,'*r')
polarplot(interval5,f5+35,'*r')
polarplot(interval6,f6+35,'*r')
legend('Cam Contour','','','','','Prime Circle','Base Circle','','','','','Pitch Curve')

%-------------------------------------------------------------------------
%                               Question 1D
%--------------------------------------------------------------------------
shift=0;
n=10%number of graph iterations
tiledlayout(2,5)
%--------------------------------------------------------------------------for-loop for each graph
for i=1:n
    nexttile
    Deg1=deg2rad(0)+deg2rad(shift);
    Deg2=deg2rad(60)+deg2rad(shift);
    Deg3=deg2rad(80)+deg2rad(shift);
    Deg4=deg2rad(150)+deg2rad(shift);
    Deg5=deg2rad(200)+deg2rad(shift);
    Deg6=deg2rad(300)+deg2rad(shift);
    Deg7=deg2rad(360)+deg2rad(shift)
    interval1=linspace(Deg1,Deg2);
    interval2=linspace(Deg2,Deg3);
    interval3=linspace(Deg3,Deg4);
    interval4=linspace(Deg4,Deg5);
    interval5=linspace(Deg5,Deg6);
    interval6=linspace(Deg6,Deg7);
    f1= (L1/2).*(1-cos((pi.*(interval1-Deg1)/Beta1)));
    f2= 10+interval2*0;
    f3= 10+L3*(((interval3-Deg3)./Beta3)-(1./(2.*pi)).*sin((2.*pi.*(interval3-Deg3))./Beta3));
    f4= 25+interval4*0;
    f5= L5*(((10/Beta5.^3)*(interval5-Deg5).^3)-((15/Beta5.^4)*(interval5-Deg5).^4)+((6/Beta5.^5)*(interval5-Deg5).^5)) +25;
    f6= 0*interval6*0;
    primecircle=35+0*theta
    polarplot(interval1,f1+30)
    hold on
    polarplot(interval2,f2+30)
    polarplot(interval3,f3+30)
    polarplot(interval4,f4+30)
    polarplot(interval5,f5+30)
    polarplot(interval6,f6+30)
    polarplot(theta,primecircle,".")
    shift=shift+27                                                         %angle shift
end