%Whitening of scatterplot of two random (uniform) signals

%two uniformly random sources,
N=2000;
s1=rand(1,N); s1=2*(s1-mean(s1)); %zero-mean
s2=rand(1,N); s2=2*(s2-mean(s2)); %"  "  "
vr1=var(s1); s1=s1/sqrt(vr1); %variance=1
vr2=var(s2); s2=s2/sqrt(vr2); %"  "  "

s=[s1;s2]; %combine sources

N=length(s1); 
M=[0.2 0.8; 0.4 0.6]; %example of mixing matrix
x=M*s; %mixed signals

Sx=cov(x');
[U,L]=eig(Sx); %eigenvector and diagonal of eigenvalues
l1=L(1,1); l2=L(2,2); 
sqL=[1/sqrt(l1) 0; 0 1/sqrt(l2)];
Q=U*sqL*U'; %whitening matrix
nu=Q*x; %data whitening

% display
%scatterplot of whitened data
figure(1)
plot(nu(1,:),nu(2,:),'k.'); 
axis([-2.5 2.5 -2.5 2.5]);
title('scatterplot of whitened data');
xlabel('nu1'); ylabel('nu2');

%histograms of projections on x and y axes
figure(2)
subplot(1,2,1)
hist(nu(1,:),50);
title('histogram of projection on x');
subplot(1,2,2)
hist(nu(2,:),50);
title('histogram of projection on y');

%print covariance matrix of whitened data
Snu=cov(nu')

