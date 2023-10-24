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