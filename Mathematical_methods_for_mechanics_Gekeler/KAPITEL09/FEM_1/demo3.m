function demo3
% Masterfile fuer elliptische Randwertprobleme
% geradlinige quadratische Dreieckselemente
% Beispiel: Stationaere Waermeverteilung nach H.R. Schwarz
% FF1: File fuer erstes Gitter (entfaellt bei MATLAB TOOLBOX)
% FF2: File fuer Geometrie in MATLAB Format 
% FF3: File fuer Randbedingungen   

clear, clc, format short, format compact
% Beispiel:
FF1 = 'bsp001b'; FF2 = 'bsp001g'; FF3 = 'bsp003h';
% -- Parameter ---------------
RHO = 0;
Parmeter = RHO;
REFINE = 1;   % Anzahl Gitterverfeinerungen
% ------------------------------
Start = 100; KK = [0,1];
%while ~ismember(Start,KK)
%   Start = input('initialization yes/no ? (1/0) ');
%end
Start = 1;
if Start == 1
   [p,e,t,q] = feval(FF1,1);
   for I = 1:REFINE
      disp(' Refinemesh ')
      [p,e,t] = mesh01_t(FF2,p,e,t);
   end
   disp(' Zwischenpunkte Einfuegen ! ')
   [p1,e,t1]  = mesh06_t(p,e,t); p2 = []; q1 = [];
   %[p1,p2,e,t1,q1]  = mesh06_t_q(p,e,t,q); p2 = []; q1 = [];
   save daten1 p e t p1 t1
end
load daten1 p e t p1 t1
[RD,RC,LASTEN] = feval(FF3,p,e);
save daten2 RD RC LASTEN
Z = ellipt3_t(p,t,p1,t1,RD,RC,LASTEN,Parmeter);
save daten3 Z
%disp(' "bild03" Aufrufen!  ');
bild03
