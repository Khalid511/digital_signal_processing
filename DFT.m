Fs = 8000;
nx = 0:1/Fs:1;
input_signal = sin(2*pi*1500*nx) + 0.5*sin(2*pi*1785*nx + 3*pi/4);

%Perform 8 point DFT
len = 8;
n = 0:len-1;
% subplot(2, 2, 2);
% plot(n, input_signal(1:len));


y = calculate_dft(input_signal, -1, len, 1);
subplot(2, 2, 1)
stem(n, abs(y));

subplot(2, 2, 2);
real_part = real(y);
stem(n, real_part);

subplot(2, 2, 3);
stem(n, imag(y));


% dft_output = zeros(1, len);
% for j=1:len
%     for k = 1:len
%         dft_output(j) = dft_output(j) + input_signal(k)*exp(-1i*2*pi*(k-1)*(j-1)/len);
%     end
% end
% 
% magnitude = abs(dft_output);
% realP = real(dft_output);
% imgP = imag(dft_output);
% 
% subplot(2, 2, 1);
% stem(n, magnitude);
% subplot(2, 2, 2);
% stem(n, realP);


inverse_dft = calculate_dft(y, 1, len, len);
subplot(2, 2, 4)
plot(n, inverse_dft);