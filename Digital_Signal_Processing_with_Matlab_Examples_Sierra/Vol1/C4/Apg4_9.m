% Response of Butterworth filter to square signal
wc=10; % desired cut-off frequency
N=5; % order of the filter
[num,den]=butter(N,wc,'s'); %analog Butterworth filter
G=tf(num,den); %transfer function
% Input square signal 
fu=1; %signal frequency in Hz
wu=2*pi*fu; %signal frequency in rad/s
fs=100; %sampling frequency in Hz
tiv=1/fs; %time interval between samples;
t=0:tiv:(6-tiv); %time intervals set (6 seconds)
u=square(wu*t); %input signal data set
[y,ty]=lsim(G,u,t); %computes the system output
plot(t,y,'k'); %plots output signal
axis([0 6 -1.5 1.5]);
xlabel('seconds'); title('response to square signal, 5th Butterworth filter');
