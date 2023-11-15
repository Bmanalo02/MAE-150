syms theta
%--------------------------------------------------------------------------
%                               Question 1b
%--------------------------------------------------------------------------
Omega=2*pi*500;
rBaseCircle=30;
rFollowerCircle=5;
rPrimeCircle=rBaseCircle+rFollowerCircle;
Phif1=@(theta) atan((d1f1(theta)/Omega)/(rPrimeCircle+f1(theta)));
Phif2=@(theta) atan((d1f2(theta)/Omega)/(rPrimeCircle+f2(theta)));
Phif3=@(theta) atan((d1f3(theta)/Omega)/(rPrimeCircle+f3(theta)));
Phif4=@(theta) atan((d1f4(theta)/Omega)/(rPrimeCircle+f4(theta)));
Phif5=@(theta) atan((d1f5(theta)/Omega)/(rPrimeCircle+f5(theta)));
Phif6=@(theta) atan((d1f6(theta)/Omega)/(rPrimeCircle+f6(theta)));
%--------------------------------------------------------------------------
f1= @(theta) (L1/2)*(1-cos((pi*(theta-Deg1)/Beta1)));
d1f1=@(theta) 15*sin(3*theta);
d1f2=@(theta) 0;
d1f3=@(theta) 270/(7*pi) - (774111753795058965*cos((36*theta)/7 - (16*pi)/7))/63050394783186944;
d1f4=@(theta) 0;
d1f5=@(theta) (182004267824633625*(theta - (10*pi)/9)^3)/1125899906842624 - (39707171577767925*(theta - (10*pi)/9)^2)/281474976710656 - (417123055988807625*(theta - (10*pi)/9)^4)/9007199254740992;
d1f6=@(theta) 0;
%--------------------------------------------------------------------------
figure()
fplot(Phif1,[Deg1,Deg2]) 
fplot(Phif2,[Deg2,Deg3])
fplot(Phif3,[Deg3,Deg4])
fplot(Phif4,[Deg4,Deg5])
fplot(Phif5,[Deg5,Deg6])
fplot(Phif6,[Deg6,2*pi])