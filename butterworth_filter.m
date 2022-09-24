f = 10;
Fs = 500;
n = 0:1/Fs:1;

input_signal = sin(2*pi*f*n);
subplot(3,1,1);
plot(n, input_signal);

%add noise to the input_signal

noisy_signal = input_signal + rand(1, length(input_signal));
% subplot(3, 1, 2);
% plot(n, noisy_signal);
% title('noisy signal');

len = length(noisy_signal);
point_powerof_two = 2^nextpow2(len);
frequency_domain_signal = abs(fft(noisy_signal, point_powerof_two));
frequency_bin = 0:point_powerof_two-1;

subplot(3, 1, 3);
plot(frequency_bin, frequency_domain_signal);
title('FFT');

%Butterworth bandpass- 8-18 Hz

%cutoff frequency 8 and 18, normalized with 2/Fs; 2*Fs/2*Fs = 1; total
%points 512

Wc = [8 20]*2/Fs;
order = 5;

%problem with this two statements
[b, a] = butter(order, Wc, 'bandpass');
%[h, w] = freqz(b, a, 1024, Fs);


%Filter noisy signal
filter_signal = takeLook(b, a, noisy_signal);
subplot(3, 1, 2);
plot(n, filter_signal);
