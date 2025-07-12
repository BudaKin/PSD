clear all; close all; clc;

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