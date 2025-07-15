clear all; close all; clc;

load('matlab.mat')

%% Sinal
freq1 = 770;
freq2 = 852;
freq3 = 941;

tmin = 0;
tmax = 2;
Fs=8000;
Ts=1/Fs;
L=(tmax-tmin)/Ts;
t=0:Ts:tmax-Ts;
s = sin(2*pi*freq1*t) + sin(2*pi*freq2*t) + sin(2*pi*freq3*t);
S = fft(s);
S = abs(2*S/L);
S = fftshift(S);
freq = Fs*(-(L/2):(L/2)-1)/L;

%% Filtros IIR importados do filterDesigner 
figure,freqz(num_low1,den_low1);
figure,freqz(num_low2,den_low2);
figure,freqz(num_low3,den_low3);

s_f_low1 = filter(num_low1,den_low1,s);
S_F_low1 = fft(s_f_low1);
S_F_low1 = abs(2*S_F_low1/L);
S_F_low1 =fftshift(S_F_low1);   

s_f_low2 = filter(num_low2,den_low2,s);
S_F_low2 = fft(s_f_low2);
S_F_low2 = abs(2*S_F_low2/L);
S_F_low2 =fftshift(S_F_low2);  

s_f_low3 = filter(num_low3,den_low3,s);
S_F_low3 = fft(s_f_low3);
S_F_low3 = abs(2*S_F_low3/L);
S_F_low3 =fftshift(S_F_low3);  

%% Gráficos
figure;
freq = Fs*(-(L/2):(L/2)-1)/L;
subplot(2,1,1),plot(t,s);
title('Sinal')
xlabel('t')
ylabel('s(t)')
subplot(2,1,2),plot(freq,S)
xlim([-1000, 1000])
title('Espectro de Amplitude de s(t)')
xlabel('f (Hz)')
ylabel('|S(f)|')

figure;
subplot(3,1,1),plot(freq,S_F_low1)
title('Espectro de Amplitude do sinal Filtrado 1')
xlim([-1000, 1000])
xlabel('f (Hz)')
ylabel('|S(f)|')

subplot(3,1,2),plot(freq,S_F_low2)
title('Espectro de Amplitude do sinal Filtrado 2')
xlim([-1000, 1000])
xlabel('f (Hz)')
ylabel('|S(f)|')

subplot(3,1,3),plot(freq,S_F_low3)
title('Espectro de Amplitude do sinal Filtrado 3')
xlim([-1000, 1000])
% set_xticks(-1000:50:1000)
xlabel('f (Hz)')
ylabel('|S(f)|')