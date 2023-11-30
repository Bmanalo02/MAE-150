%% ------------------------------------------------------------------------
%% Problem 1
%% ------------------------------------------------------------------------
%% Part A
clear all
clc
% Setting Parameters ------------------------------------------------------
E = 2.1*10^11; %  210 GPa
Area = 0.00195; % 19.5 cm^2
% Length of Beams in meters
L1 = 4;
L2 = 3; 
L3 = 5; 
L4 = 6;
L5 = 5;
% Displacement of Beams in meters
Disp_1 = (Area*E)/L1;
Disp_2 = (Area*E)/L2;
Disp_3 = (Area*E)/L3;
Disp_4 = (Area*E)/L4;
Disp_5 = (Area*E)/L5;
% Defining Angles
angle1=90;
angle2=180;
angle3=233.1301;
angle4=180;
angle5=126.8699;
c1 = cosd(angle1);
s1 = sind(angle1);
c2 = cosd(angle2);
s2 = sind(angle2);
c3 = cosd(angle3);
s3 = sind(angle3);
c4 = cosd(angle4);
s4 = sind(angle4);
c5 = cosd(angle5);
s5 = sind(angle5);
GlobalStiffnessMatrix = zeros(8,8);
% Generating Global Stiffness Matrix --------------------------------------
% stiffness matrix of each element
K1 = [c1^2 c1*s1 -c1^2 -c1*s1; c1*s1 s1^2 -c1*s1 -s1^2; -c1^2 -c1*s1 c1^2 c1*s1; -c1*s1 -s1^2 c1*s1 s1^2]*Disp_1;
K2 = [c2^2 c2*s2 -c2^2 -c2*s2; c2*s2 s2^2 -c2*s2 -s2^2; -c2^2 -c2*s2 c2^2 c2*s2; -c2*s2 -s2^2 c2*s2 s2^2]*Disp_2;
K3 = [c3^2 c3*s3 -c3^2 -c3*s3; c3*s3 s3^2 -c3*s3 -s3^2; -c3^2 -c3*s3 c3^2 c3*s3; -c3*s3 -s3^2 c3*s3 s3^2]*Disp_3;
K4 = [c4^2 c4*s4 -c4^2 -c4*s4; c4*s4 s4^2 -c4*s4 -s4^2; -c4^2 -c4*s4 c4^2 c4*s4; -c4*s4 -s4^2 c4*s4 s4^2]*Disp_4;
K5 = [c5^2 c5*s5 -c5^2 -c5*s5; c5*s5 s5^2 -c5*s5 -s5^2; -c5^2 -c5*s5 c5^2 c5*s5; -c5*s5 -s5^2 c5*s5 s5^2]*Disp_5;
% populating global stiffness matrix
GlobalStiffnessMatrix(1:4, 1:4) = K1; 
GlobalStiffnessMatrix(3:6, 3:6) = GlobalStiffnessMatrix(3:6, 3:6) + K2
GlobalStiffnessMatrix(5:8, 5:8) = GlobalStiffnessMatrix(5:8, 5:8) + K3;
GlobalStiffnessMatrix(1:2, 1:2) = GlobalStiffnessMatrix(1:2, 1:2) + K4(1:2, 1:2);
GlobalStiffnessMatrix(1:2, 7:8) = GlobalStiffnessMatrix(1:2, 7:8) + K4(1:2, 3:4);
GlobalStiffnessMatrix(7:8, 1:2) = GlobalStiffnessMatrix(7:8, 1:2) + K4(3:4, 1:2);
GlobalStiffnessMatrix(7:8, 7:8) = GlobalStiffnessMatrix(7:8, 7:8) + K4(3:4, 3:4); 
GlobalStiffnessMatrix(1:2, 1:2) = GlobalStiffnessMatrix(1:2, 1:2) + K5(1:2, 1:2);
GlobalStiffnessMatrix(1:2, 5:6) = GlobalStiffnessMatrix(1:2, 5:6) + K5(1:2, 3:4);
GlobalStiffnessMatrix(5:6, 1:2) = GlobalStiffnessMatrix(5:6, 1:2) + K5(3:4, 1:2);
GlobalStiffnessMatrix(5:6, 5:6) = GlobalStiffnessMatrix(5:6, 5:6) + K5(3:4, 3:4);
GlobalStiffnessMatrix 
% Calculating Trace -------------------------------------------------------
Global_Trace = trace(K1) + trace(K2) + trace(K3) + trace(K4) + trace(K5)
%% Part B
syms u1 v1 u2 v2 u3 v3 u4 v4 Fx1 Fy1 Fx2 Fy2 Fx3 Fy3 Fx4 Fy4
% Setting Parameters ------------------------------------------------------
% defining forces/degrees of freedom
Fx1 = 4*10^4;
Fy1 = 0;
Fx3 = 0;
Fy3 = -1*10^5;
Fx4 = 0; 
u2 = 0;
v2 = 0;
v4 = 0; 
% Solving for displacement and reaction force -----------------------------
Disp = [u1; v1; u2; v2; u3; v3; u4; v4];
Force_React = [Fx1; Fy1; Fx2; Fy2; Fx3; Fy3; Fx4; Fy4];
Solution = solve(GlobalStiffnessMatrix*Disp == Force_React);
u1 = vpa(Solution.u1) 
v1 = vpa(Solution.v1); 
u3 = vpa(Solution.u3) 
v3 = vpa(Solution.v3) 
u4 = vpa(Solution.u4) 
Force_x2 = vpa(Solution.Fx2)
Force_y2 = vpa(Solution.Fy2) 
Force_y4 = vpa(Solution.Fy4) 
%% Problem 1, Part C
% Calculating Beam Deformation --------------------------------------------
% original beam position
x0 = [0 -6 -3 0 0 -3];
y0 = [0 0 4 4 0 4];
% beam displacement
Disp_x = [u1 u2 u3 u4 u1 u3];
Disp_y = [v1 v2 v3 v4 v1 v3];
% beam deformation
x1 = (200.*Disp_x) + x0
y1 = (200.*Disp_y) + y0
% Plotting Deformation ----------------------------------------------------
figure(1)
plot(x0, y0)
hold on 
grid on
plot(x1,y1)
legend('Original Truss Position','Truss Deformation')
title('Truss Deformation')
%% ------------------------------------------------------------------------
%% Problem 2
%% ------------------------------------------------------------------------
%% Part A
clear all
clc
% Setting Parameters ------------------------------------------------------
L=5;
F=100;
Q=30;
M=2000;
E = 2*10^11;
SideLength_Section1 = (0.10);
Radius_Section2 = 0.03;
Radius_Section3 = 0.015;
% Calculating Moments -----------------------------------------------------
I1=(SideLength_Section1^4)/12
I2=(pi*Radius_Section2^4)/4
I3=(pi*Radius_Section3^4)/4
%% Part B
syms w1 w2 w3 w4 w5 w6 w7 w8 w9 w10 w11 w12 w13 w14 w15 w16 w17 theta1 theta2 theta3 theta4 theta5 theta6 theta7 theta8 theta9 theta10 theta11 theta12 theta13 theta14 theta15 theta16 theta17 Fx1  Fy1  Fx2  Fy2  Fx3  Fy3  Fx4  Fy4 Fx5  Fy5  Fx6  Fy6  Fx7  Fy7  Fx8  Fy8 Fx9  Fy9  Fx10  Fy10  Fx11  Fy11  Fx12  Fy12 Fx13  Fy13  Fx14  Fy14  Fx15  Fy15  Fx16  Fy16 Fx17  Fy17
% Setting Parameters ------------------------------------------------------
GlobalStiffnessMatrix = zeros(34,34);
L_element=L/4;
% Generating Global Stiffness Matrix --------------------------------------
% stiffness matrix of each element
K1=((E*I1)/L_element)*[12/(L_element^2) 6/L_element -12/(L_element^2) 6/L_element; 6/L_element 4 -6/L_element 2; -12/(L_element^2) -6/L_element 12/(L_element^2) -6/L_element; 6/L_element 2 -6/L_element 4]
K2=((E*I1)/L_element)*[12/(L_element^2) 6/L_element -12/(L_element^2) 6/L_element; 6/L_element 4 -6/L_element 2; -12/(L_element^2) -6/L_element 12/(L_element^2) -6/L_element; 6/L_element 2 -6/L_element 4];
K3=((E*I1)/L_element)*[12/(L_element^2) 6/L_element -12/(L_element^2) 6/L_element; 6/L_element 4 -6/L_element 2; -12/(L_element^2) -6/L_element 12/(L_element^2) -6/L_element; 6/L_element 2 -6/L_element 4];
K4=((E*I1)/L_element)*[12/(L_element^2) 6/L_element -12/(L_element^2) 6/L_element; 6/L_element 4 -6/L_element 2; -12/(L_element^2) -6/L_element 12/(L_element^2) -6/L_element; 6/L_element 2 -6/L_element 4];
K5=((E*I2)/L_element)*[12/(L_element^2) 6/L_element -12/(L_element^2) 6/L_element; 6/L_element 4 -6/L_element 2; -12/(L_element^2) -6/L_element 12/(L_element^2) -6/L_element; 6/L_element 2 -6/L_element 4];
K6=((E*I2)/L_element)*[12/(L_element^2) 6/L_element -12/(L_element^2) 6/L_element; 6/L_element 4 -6/L_element 2; -12/(L_element^2) -6/L_element 12/(L_element^2) -6/L_element; 6/L_element 2 -6/L_element 4];
K7=((E*I2)/L_element)*[12/(L_element^2) 6/L_element -12/(L_element^2) 6/L_element; 6/L_element 4 -6/L_element 2; -12/(L_element^2) -6/L_element 12/(L_element^2) -6/L_element; 6/L_element 2 -6/L_element 4];
K8=((E*I2)/L_element)*[12/(L_element^2) 6/L_element -12/(L_element^2) 6/L_element; 6/L_element 4 -6/L_element 2; -12/(L_element^2) -6/L_element 12/(L_element^2) -6/L_element; 6/L_element 2 -6/L_element 4];
K9=((E*I2)/L_element)*[12/(L_element^2) 6/L_element -12/(L_element^2) 6/L_element; 6/L_element 4 -6/L_element 2; -12/(L_element^2) -6/L_element 12/(L_element^2) -6/L_element; 6/L_element 2 -6/L_element 4];
K10=((E*I2)/L_element)*[12/(L_element^2) 6/L_element -12/(L_element^2) 6/L_element; 6/L_element 4 -6/L_element 2; -12/(L_element^2) -6/L_element 12/(L_element^2) -6/L_element; 6/L_element 2 -6/L_element 4];
K11=((E*I2)/L_element)*[12/(L_element^2) 6/L_element -12/(L_element^2) 6/L_element; 6/L_element 4 -6/L_element 2; -12/(L_element^2) -6/L_element 12/(L_element^2) -6/L_element; 6/L_element 2 -6/L_element 4];
K12=((E*I2)/L_element)*[12/(L_element^2) 6/L_element -12/(L_element^2) 6/L_element; 6/L_element 4 -6/L_element 2; -12/(L_element^2) -6/L_element 12/(L_element^2) -6/L_element; 6/L_element 2 -6/L_element 4];
K13=((E*I3)/L_element)*[12/(L_element^2) 6/L_element -12/(L_element^2) 6/L_element; 6/L_element 4 -6/L_element 2; -12/(L_element^2) -6/L_element 12/(L_element^2) -6/L_element; 6/L_element 2 -6/L_element 4];
K14=((E*I3)/L_element)*[12/(L_element^2) 6/L_element -12/(L_element^2) 6/L_element; 6/L_element 4 -6/L_element 2; -12/(L_element^2) -6/L_element 12/(L_element^2) -6/L_element; 6/L_element 2 -6/L_element 4];
K15=((E*I3)/L_element)*[12/(L_element^2) 6/L_element -12/(L_element^2) 6/L_element; 6/L_element 4 -6/L_element 2; -12/(L_element^2) -6/L_element 12/(L_element^2) -6/L_element; 6/L_element 2 -6/L_element 4];
K16=((E*I3)/L_element)*[12/(L_element^2) 6/L_element -12/(L_element^2) 6/L_element; 6/L_element 4 -6/L_element 2; -12/(L_element^2) -6/L_element 12/(L_element^2) -6/L_element; 6/L_element 2 -6/L_element 4];
% populating global stiffness matrix
GlobalStiffnessMatrix(1:4, 1:4) = K1; 
GlobalStiffnessMatrix(3:6, 3:6) = GlobalStiffnessMatrix(3:6, 3:6) + K2;
GlobalStiffnessMatrix(5:8, 5:8) = GlobalStiffnessMatrix(5:8, 5:8) + K3; 
GlobalStiffnessMatrix(7:10, 7:10) = GlobalStiffnessMatrix(7:10, 7:10) + K4; 
GlobalStiffnessMatrix(9:12, 9:12) = GlobalStiffnessMatrix(9:12, 9:12) + K5; 
GlobalStiffnessMatrix(11:14, 11:14) = GlobalStiffnessMatrix(11:14, 11:14) + K6; 
GlobalStiffnessMatrix(13:16, 13:16) = GlobalStiffnessMatrix(13:16, 13:16) + K7;
GlobalStiffnessMatrix(15:18, 15:18) = GlobalStiffnessMatrix(15:18, 15:18) + K8;
GlobalStiffnessMatrix(17:20, 17:20) = GlobalStiffnessMatrix(17:20, 17:20) + K9;
GlobalStiffnessMatrix(19:22, 19:22) = GlobalStiffnessMatrix(19:22, 19:22) + K10;
GlobalStiffnessMatrix(21:24, 21:24) = GlobalStiffnessMatrix(21:24, 21:24) + K11;
GlobalStiffnessMatrix(23:26, 23:26) = GlobalStiffnessMatrix(23:26, 23:26) + K12;
GlobalStiffnessMatrix(25:28, 25:28) = GlobalStiffnessMatrix(25:28, 25:28) + K13;
GlobalStiffnessMatrix(27:30, 27:30) = GlobalStiffnessMatrix(27:30, 27:30) + K14;
GlobalStiffnessMatrix(29:32, 29:32) = GlobalStiffnessMatrix(29:32, 29:32) + K15;
GlobalStiffnessMatrix(31:34, 31:34) = GlobalStiffnessMatrix(31:34, 31:34) + K16;
Kg=GlobalStiffnessMatrix
% Generating Global Stiffness Matrix --------------------------------------
w1=0;
theta1=0;
Disp=[w1; theta1; w2; theta2; w3; theta3 ;w4 ;theta4 ;w5 ;theta5 ;w6 ;theta6 ;w7 ;theta7 ;w8 ;theta8 ;w9 ;theta9 ;w10 ;theta10 ;w11 ;theta11 ;w12 ;theta12 ;theta13 ;w13 ;theta14 ;w14 ;theta15 ;w15 ;w16 ;theta16; w17 ;theta17];
Kr=GlobalStiffnessMatrix(3:34, 3:34);
Kg_norm=norm(Kg)
Kr_cond=cond(Kr)
%% Part C
Force_React = [0 0 0 0 0 0 0 0 Q*L/2 -Q*L^2/12 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -Q*L/2+F -Q*L^2/12 0 0 0 0 0 0 0 -M]
Deflection = (Kg\Force_React') 
for i=0:16
    VertDeflection(i+1)=Deflection((2*i)+1)
    Rotation(i+1)=Deflection((2*i)+2)
end
tiledlayout(2,1)
nexttile
Rotation=((Rotation-8.603568310807967e+10))*180/pi
plot(linspace(0,20,17),Rotation)
nexttile
plot(linspace(0,20,17),cumsum(flip(VertDeflection)))