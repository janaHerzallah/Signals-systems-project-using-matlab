t=0:.001:15;
x=heaviside(t-2.5)-heaviside(t-3.5)+heaviside(t-7.5)-heaviside(t-10.5);
plot(t,x);
title('x(t)=? [(t-3)/1]+? [(t-9 )/3]');
xlabel('(t)'),ylabel('x(t)');
set(gca,'xtick', 0:1:15);



t=0:0.001:20;
xb=(t).*heaviside(t)-(t-1).*heaviside(t-1)-(t-3).*heaviside(t-3)+(t-9).*heaviside(t-9);
plot(t,xb);

set(gca,'xtick', 0:1:15)
title('xb=r(t)-r(t-1)-r(t-3)+r(t-9)')
xlabel('(t)'),ylabel('x(t)')



t=0:pi/1000:(1/5); %since the period is 2pi/10pi
x1= sin(10*pi*t); %A=1
plot(t,x1) %to plpt x1 according to t
title('x1=1*sin(10*t*pi)') %to give a title to the drawing
axis ([0 0.25 -1.5 1.5]) %so that only one period is drawn
xlabel('(t)'),ylabel('x1(t)');




t=0:pi/1000:(1/5); %the period for the sum signal xb is
%equal to the larger period between the two signals x1 & x2 which is equal
%to 1/5 by using the GCD and then finding f0
x1=sin(10*pi*t);
plot(t,x1)
hold on; % to complete the plot
x2=(1/3)*sin(30*pi*t);
plot(t,x2)
hold on; % to complete the plot 
xb=x1+x2;
plot(t,xb)
legend('x1','x2','xb=x1+x2') %This is used to determine to each plot with a 
%different color.
title('xb (t) = x1(t)+ x2(t) for one period') %title of the plot
axis ([0 0.25 -1.5 1.5])



t=0:pi/1000:(1/5); % period for xc signal is
%equal to the larger period between the three signals x1,x2,&x3 which
%equals 1/5 using the GCD between f1 , f2 &f3 that is f0=5HZ 
x1=sin(10*pi*t);
subplot(2,2,1), plot(t,x1)
axis ([0 0.25 -1.5 1.5])
xlabel('t'),ylabel('x1= sin(10*pi*t)') %the titles of the axis
x2=(1/3)*sin(30*pi*t);
subplot(2,2,2), plot(t,x2)
axis ([0 0.25 -1.5 1.5])
xlabel('t'),ylabel('x2= (1/3)sin(30*pi*t)') %the titles of the axis
x3=(1/5)*sin(50*pi*t);
subplot(2,2,3), plot(t,x3)
axis ([0 0.25 -1.5 1.5])
xlabel('t'),ylabel('x3= (1/5)sin(30*pi*t)') %the titles of the axis
xc=x1+x2+x3; %xc value
subplot(2,2,4), plot(t,xc) %used to have more than one plot at the ssame time
axis ([0 0.25 -1.5 1.5])
xlabel('t'),ylabel('xc= x1+x2+x3') %the titles of the axis



t=0:pi/1000:(5); % the period of the generated signals are both 1/5 
%after calculating it via GCD method.
%the previos questions we determined t to be 1/5(period) so now we need to 
% put the t to a bigger scale to check if the signal repeat itself or not
%that way its determined if the signal is periodic or not.
x1=sin(10*pi*t);
x2=(1/3)*sin(30*pi*t);
x3=(1/5)*sin(50*pi*t);
xb=x1+x2;
subplot(2,1,1),plot(t,xb) %to plot them together 
axis ([0 0.45 -1.5 1.5])
xlabel('t'),ylabel('xb= x1+x2 ') %the axis titles
xc=x1+x2+x3;
subplot(2,1,2), plot(t,xc)
axis ([0 0.45 -1.5 1.5])
xlabel('t'),ylabel('xc= x1+x2+x3')




%1201139
%Jana Herzallah
sympref('HeavisideAtOrigin',1)
syms t T;
%x(t)=[e^(-2t)-?5e?^(-10t) ] u(t), h(t)=?((t-1)/6)
expfunction=(exp(-2*T))-(5.*(exp(-10*T)) );
x=heaviside(T).*expfunction; %u(t)*exponential
%h=?((t-1)/6) equals: h(t)=u(t+2)-u(t-4)
h=heaviside(t-T+2)-heaviside(t-T-4);
y= int(x*h,T,0,10) %y is the signal that represents the convolution
fplot(y) %to plot y
axis ([-6 15 -0.3 0.3]) %values to show on the x-axis
title('Convolution function of x(t) and h(t)') %title of the plot
xlabel('(t)'),ylabel('y(t)=x(t)*h(t)') %axis labels



%1201139
%A =1 , B=3
%x(t)=(3/pi.*k).*exp((-1i.*pi/2).*exp(1i.*k.*t);
%h(t) = exp(-3.*t);
clc
clearAllMemoizedCaches;

sum=1; %sum = A =1

t=0:.1:7;
    for k=-101:2:101 %this goes through the odd values of k
        
    x=(5/pi.*k).*exp((-1i.*pi)/2).*exp(1i*k.*t); %x(t)
    sum=sum+x; %sum = the result of adding the previos sum to x
    end %ending of the k-forloop


h= exp(-5.*t);
    
hF = fft(h);%h(f) is the fourier transform of h


xF = fft(x);%x(f) is the fourier transform of x

hMagnitude = abs(hF); %magnitude of y
hAngle = angle (hF); %angle of y

subplot (2,1,1); %subplotting the first graph
plot(hMagnitude);
xlabel('f'),ylabel('Magnitude of h(f)') %the titles of the axis
subplot (2,1,2); %subplotting the seconed graph
plot(hAngle);
xlabel('f'),ylabel('Phase of h(f)'); %the titles of the axis

