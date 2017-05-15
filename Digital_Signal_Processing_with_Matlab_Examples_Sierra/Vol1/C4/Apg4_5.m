% Frequency response of Butterworth filter
wc=10; % desired cut-off frequency
N=5; % order of the filter
[num,den]=butter(N,wc,'s'); %analog Butterworth filter
w=logspace(0,2); %logaritmic set of frequency values
G=freqs(num,den,w); %computes frequency response
semilogx(w,abs(G),'k'); %plots linear amplitude
axis([1 100 0 1.1]);
grid;
ylabel('Gain'); xlabel('rad/s'); title('frequency response of 5th Butterworth filter');
