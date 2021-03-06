function Y = bsp04a(T,X,Parmeter);
% Differentialsystem Roboter
% Rechte Seite DAE-System
Z1 = X(1); GA1 = X(2); Y2 = X(3); BE2 = X(4); AL3 = X(5);
Z1P = X(6); GA1P = X(7); Y2P = X(8); BE2P = X(9); AL3P = X(10);
% -------------------
% -- Geometrische Daten -----------------------
C = 0.05; L = 0.50; GE = 9.81;
% Massen ----------------------
M1 = 250; M2 = 150; M3 = 100;
% -- Traegheitsmomente ---------------
IX1 = 90; IX2 = 13; IX3 = 4;
IY1 = 10; IY2 = 0.75; IY3 = 1;
IZ1 = 90; IZ2 = 13; IZ3 = 4.3;
% -- Vorgabe der Kraefte und Drehmomente
Z = zeros(5,1);
if 0 <= T & T < 0.5
   Z = [6348;36*T+986;673*T-508;63.5;0];
end
if 0.5 <= T & T < 1.5
   Z = [4905;-2;148*exp(-5.5*(T-0.5))+8;49.05;0];
end
if 1.5 <= T & T <= 2
   Z = [3462;-1019;240;34.6;0];
end
F1Z = Z(1); F2Y = Z(2); L1Z = Z(3); L3X = Z(4); L2Y = 0;
% Kraftvektor ----------------
K = zeros(5,1);
K(1) = - 2*M3*C*AL3P*BE2P*sin(BE2)*cos(AL3) ...
       - M3*C*AL3P^2*sin(AL3)*cos(BE2) - M3*C*BE2P^2*sin(AL3)*cos(BE2);
K(2) = - 2*M3*C^2*AL3P*GA1P*sin(AL3)*cos(AL3)*cos(BE2)^2 ...
       + 2*M3*C^2*BE2P*GA1P*sin(AL3)^2*sin(BE2)*cos(BE2) ...
       - 2*M3*C^2*AL3P*BE2P*cos(AL3)^2*cos(BE2) ...
       + M3*C^2*BE2P^2*sin(AL3)*sin(BE2)*cos(AL3) ...
       - 2*IY3*BE2P*GA1P*sin(AL3)^2*sin(BE2)*cos(BE2) ...
       - 2*IZ3*BE2P*GA1P*sin(BE2)*cos(AL3)^2*cos(BE2) ...
       + 2*IY3*AL3P*GA1P*sin(AL3)*cos(AL3)*cos(BE2)^2 ...
       - 2*IZ3*AL3P*GA1P*sin(AL3)*cos(AL3)*cos(BE2)^2 ...
       - 2*M3*C*AL3P*BE2P*Y2*cos(AL3)*cos(BE2) ...
       - 2*M3*C*L*AL3P*BE2P*cos(AL3)*cos(BE2) ...
       + M3*C*AL3P^2*Y2*sin(AL3)*sin(BE2) ...
       + M3*C*L*AL3P^2*sin(AL3)*sin(BE2) ...
       - IY3*BE2P^2*sin(AL3)*sin(BE2)*cos(AL3) ...
       + IZ3*BE2P^2*sin(AL3)*sin(BE2)*cos(AL3) ...
       - IY3*AL3P*BE2P*sin(AL3)^2*cos(BE2) ...
       + IZ3*AL3P*BE2P*sin(AL3)^2*cos(BE2) ...
       - IZ3*AL3P*BE2P*cos(AL3)^2*cos(BE2) ...
       + IY3*AL3P*BE2P*cos(AL3)^2*cos(BE2) ...
       + M3*C*BE2P^2*Y2*sin(AL3)*sin(BE2) ...
       + M3*C*L*BE2P^2*sin(AL3)*sin(BE2) ...
       + 2*IX2*BE2P*GA1P*sin(BE2)*cos(BE2) ...
       - 2*IZ2*BE2P*GA1P*sin(BE2)*cos(BE2) ...
       + 2*IX3*BE2P*GA1P*sin(BE2)*cos(BE2) ...
       - 2*M3*C*AL3P*GA1P*Y2*sin(AL3) ...
       - 2*M3*C*L*AL3P*GA1P*sin(AL3) ...
       + 2*M3*C*Y2P*GA1P*cos(AL3) ...
       - IX3*AL3P*BE2P*cos(BE2) ...
       + 2*M2*Y2P*GA1P*Y2 ...
       + 2*M3*Y2P*GA1P*Y2 ...
       + 2*M3*L*Y2P*GA1P;
K(3) =   2*M3*C*AL3P*GA1P*sin(BE2)*cos(AL3) ...
       + 2*M3*C*BE2P*GA1P*sin(AL3)*cos(BE2) ...
       - M3*C*AL3P^2*cos(AL3) ...
       - M3*C*GA1P^2*cos(AL3) ...
       - M2*GA1P^2*Y2 ...
       - M3*GA1P^2*Y2 ...
       - M3*L*GA1P^2;
K(4) = - M3*C^2*GA1P^2*sin(AL3)^2*sin(BE2)*cos(BE2) ...
       + 2*M3*C^2*AL3P*GA1P*sin(AL3)^2*cos(BE2) ...
       + IZ3*GA1P^2*sin(BE2)*cos(AL3)^2*cos(BE2) ...
       + IY3*GA1P^2*sin(AL3)^2*sin(BE2)*cos(BE2) ...
       + 2*M3*C^2*AL3P*BE2P*sin(AL3)*cos(AL3) ...
       + IY3*AL3P*GA1P*cos(AL3)^2*cos(BE2) ...
       - IZ3*AL3P*GA1P*cos(AL3)^2*cos(BE2) ...
       + IZ3*AL3P*GA1P*sin(AL3)^2*cos(BE2) ...
       - IY3*AL3P*GA1P*sin(AL3)^2*cos(BE2) ...
       - 2*M3*C*Y2P*GA1P*sin(AL3)*cos(BE2) ...
       + IZ2*GA1P^2*sin(BE2)*cos(BE2) ...
       - IX2*GA1P^2*sin(BE2)*cos(BE2) ...
       - 2*IY3*AL3P*BE2P*sin(AL3)*cos(AL3) ...
       + 2*IZ3*AL3P*BE2P*sin(AL3)*cos(AL3) ...
       - IX3*GA1P^2*sin(BE2)*cos(BE2) ...
       + IX3*AL3P*GA1P*cos(BE2);
K(5) = - M3*C^2*GA1P^2*sin(AL3)*sin(BE2)^2*cos(AL3) ...
       - 2*M3*C^2*BE2P*GA1P*sin(AL3)^2*cos(BE2) ...
       - IY3*GA1P^2*sin(AL3)*cos(AL3)*cos(BE2)^2 ...
       + IZ3*GA1P^2*sin(AL3)*cos(AL3)*cos(BE2)^2 ...
       + M3*C^2*GA1P^2*sin(AL3)*cos(AL3) ...
       - M3*C^2*BE2P^2*sin(AL3)*cos(AL3) ...
       + IY3*BE2P*GA1P*sin(AL3)^2*cos(BE2) ...
       - IY3*BE2P*GA1P*cos(AL3)^2*cos(BE2) ...
       + IZ3*BE2P*GA1P*cos(AL3)^2*cos(BE2) ...
       - IZ3*BE2P*GA1P*sin(AL3)^2*cos(BE2) ...
       - 2*M3*C*Y2P*GA1P*sin(BE2)*cos(AL3) ...
       + M3*C*GA1P^2*Y2*sin(AL3) ...
       + M3*C*L*GA1P^2*sin(AL3) ...
       + IY3*BE2P^2*sin(AL3)*cos(AL3) ...
       - IZ3*BE2P^2*sin(AL3)*cos(AL3) ...
       - IX3*BE2P*GA1P*cos(BE2);

% Verallgemeinerte Kraefte fuer rechte Seite der DGL
QE    =   zeros(5,1);
QE(1) = - GE*M1 - GE*M2 - GE*M3 + F1Z;
QE(2) =   L1Z;
QE(3) =   F2Y;
QE(4) =   GE*M3*C*sin(AL3)*sin(BE2) + L2Y;
QE(5) = - GE*M3*C*cos(AL3)*cos(BE2) + L3X;

% Rechte Seite DGL
Y     = [X(6:10);- K + QE];



