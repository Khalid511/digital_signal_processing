f1 = 4; f2 = 8; f3 = 12;

a1 = 10; a2 = 20; a3 = 40;

t = 0:0.001:1;


x1 = a1*cos(2*pi*f1*t);
% subplot(4, 1, 1)
% plot(t, x1)
% xlabel('t (sec)')
% ylabel('x1(t)')
% title('Cos wave');



x2 = a2*cos(2*pi*f2*t);
% subplot(4, 1, 2)
% plot(t, x2)
% xlabel('t (sec)')
% ylabel('x2(t)')

x3 = a3*cos(2*pi*f3*t);
% subplot(4,1,3)
% plot(t, x3)
% xlabel('t (sec)')
% ylabel('x3(t)');

signal = x1+x2+x3;

%subplot(2,1,1)
hold on
plot(t, signal, 'b')
xlabel('t (sec)')
ylabel('x3(t)');

%sampling
fs = 24;
T = 1/fs;
nmin = 0; nmax = 1/T;
n = nmin:nmax;
com_signal = a1*cos(2*pi*f1*n*T) + a2*cos(2*pi*f2*n*T) + a3*cos(2*pi*f3*n*T);
%subplot(4, 1, 1);
plot(n*T, com_signal, 'g');


%Quantization

bits = 8;
level = 2^bits;
max_val = max(com_signal);
min_val = min(com_signal);

step_size = (max_val-min_val)/level;

new_signal = com_signal/step_size;
new_signal = round(new_signal);
new_signal = new_signal*step_size;
plot(n*T, new_signal, 'r');

