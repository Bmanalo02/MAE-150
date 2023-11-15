%--------------------------------------------------------------------------
%                               Question 1b
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
hold on
fplot(Phif1,[Deg1,Deg2],'--.',deg2rad(1)) 
fplot(Phif2,[Deg2,Deg3],'--.',deg2rad(1))
fplot(Phif3,[Deg3,Deg4],'--.',deg2rad(1))
fplot(Phif4,[Deg4,2*pi],'--.',deg2rad(1))