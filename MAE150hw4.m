%% Part A
clear all
% Setting Parameters ------------------------------------------------------
length1x=18; 
length1y=5; 
length2= 6; 
length3 = 12; 
length4 = 15; 
theta = 0:1:360; 
initialguess_theta3=45
initialguess_theta4=200
% Raph-Newton Estimation --------------------------------------------------
    for i = 1:length(theta)
    theta2 = theta(i); 
    epsilon = 0.0001; 
    h = 100; 
    k = 100; 
    theta3 = initialguess_theta3; 
    theta4 = initialguess_theta4; 
        while abs(k) > epsilon || abs(h) > epsilon 
        f1 = -length1x + (length2*cosd(theta(i))) + (length3*cosd(theta3)) - (length4*cosd(theta4)); 
        f2 = length1y + (length2*sind(theta(i))) + (length3*sind (theta3)) - (length4*sind (theta4)); 
        f1dth3 = -length3*sind(theta3); 
        f1dth4 =  length4*sind(theta4); 
        f2dth3 =  length3*cosd(theta3); 
        f2dth4 = -length4*cosd(theta4); 
        A = (f1dth3*f2dth4) - (f2dth3*f1dth4); 
        h = (((-f1*f2dth4) + (f2*f2dth4))/A); 
        k = (((-f2*f1dth3) + (f1*f2dth3))/A); 
        theta3 = theta3 + h; 
        theta4 = theta4 + k; 
        end 
    theta3_estimation(i) = theta3; 
    theta4_estimation(i) = theta4; 
    end 
% Plotting Estimation Data ------------------------------------------------
figure(1)
plot(theta, theta4_estimation) 
grid on
xlabel('Crank Angle (degrees)') 
ylabel('Rocker Link Angle (degrees)') 
title('Rocker Link Angular Displacement vs. Crank Angular Displacement' ) 
%% Part B
% Setting Parameters ------------------------------------------------------
P_radius = 5; % Perpendicular distance of point P from hinge
% Calculating X and Y positions -------------------------------------------
X = length2*cosd(theta) - P_radius*sind(theta3_estimation); 
Y = length2*sind(theta) + P_radius*cosd(theta3_estimation); 
% Plotting Position Data ----=---------------------------------------------
figure(2) 
plot (X, Y, 'b') 
hold on 
grid on
plot(0,0, "or") 
xlabel('X-Displacement (cm)') 
ylabel('Y-Displacement (cm)') 
title('Path of Displacement of Point P') 
legend('Displacement', 'Origin') 
%% Part C
% Setting Parameters ------------------------------------------------------
P_X=X;
P_Y=Y;
% Calculating Point Position  ---------------------------------------------
Q_X =  length1x + (length4+7)*cosd(theta4_estimation);
Q_Y = -length1y + (length4+7)*sind(theta4_estimation);
% Distance Between Points P and Q -----------------------------------------
PQ_distance = sqrt((abs(Q_X-P_X)).^2+(abs(Q_Y-P_Y)).^2)
% Plotting Position Data ----=---------------------------------------------
figure(3) 
plot(theta,PQ_distance)
grid on
ylabel('Crank Angle (degrees)') 
xlabel('Distance (cm)') 
title('Distance Between Points P and Q')
%% Part D
% Setting Parameters ------------------------------------------------------
Crank_Omega = 100;
% Converting Degrees to Rads ----------------------------------------------
Crank_Omegarad=Crank_Omega.*((pi)/180) ;
thetarad=theta.*((pi)/180) ;
theta3_estimationrad = theta3_estimation.*((pi)/180) ;
theta4_estimationrad = theta4_estimation.*((pi)/180) ;
% Calculating Omega Over Time ---------------------------------------------
num=length2*sin(theta3_estimationrad-thetarad);
den=length4*sin(theta3_estimationrad-theta4_estimationrad);
Theta4_Omega=Crank_Omegarad.*(num./den)
% Plotting Velocity Data ----=---------------------------------------------
figure(4)
plot(Theta4_Omega)
grid on
ylabel('Angular Velocity (degrees)') 
xlabel('Time (s)') 
title('Angular Velocity of Link 3')
%% Part E
Omega=60
Period=1/Omega
% Converting Degrees to Rads ----------------------------------------------
Omegarad=Omega*((pi)/180);
% Calculating Displacement ------------------------------------------------
for i=1:length(theta)
    P_X(i) = (length2.*cosd(theta(i)) - P_radius.*sind(theta3_estimation(i))); 
    P_Y(i) = (length2.*sind(theta(i)) + P_radius.*cosd(theta3_estimation(i))); 
end
for i=2:length(theta)
    P_Velocity(i-1)=sqrt((P_X(i)-P_X(i-1))^2+(P_Y(i)-P_Y(i-1))^2)/Period
end
figure(5)
plot(P_Velocity)
grid on
legend('Velocity')
title('Linear Velocity of point P over theta')
ylabel('Velocity (cm/s)') 
xlabel('Crank Angle (degrees)') 