% 3. Crie um sinal de entrada composto de três componentes senoidais,
% nas frequências 50 Hz, 350 Hz e 900 Hz, com Ωs = 2 kHz, com 
% amplitudes de 5, 2 e 1, respectivamente. Projete um filtro usando as janelas
% retangular, Hamming, Hanning e Blackman para eliminar as componentes de 50 e 900 Hz.

clear all; close all; clc;

%% Sinal
freq1 = 50;
freq2 = 350;
freq3 = 900;

tmin = 0;
tmax = 2;
Fs=2000;
Ts=1/Fs;
L=(tmax-tmin)/Ts;
t=0:Ts:tmax-Ts;
s = 5*sin(2*pi*freq1*t) + 2*sin(2*pi*freq2*t) + sin(2*pi*freq3*t);
S = fft(s);
S = abs(2*S/L);
S = fftshift(S);
freq = Fs*(-(L/2):(L/2)-1)/L;

figure
subplot(2,1,1),plot(t,s);
title('Sinal')
xlabel('t')
ylabel('s(t)')
subplot(2,1,2),plot(freq,S)
axis([-1000 1000 0 5])
title('Espectro de Amplitude de s(t)')
xlabel('f (Hz)')
ylabel('|S(f)|')

M = 71;
Omega_c1 = 250;
Omega_c2 = 750;
Omega_s = 2000;
wc1 = Omega_c1*2*pi/Omega_s;
wc2 = Omega_c2*2*pi/Omega_s;
%% Resposta ao impulso do filtro ideal h[n]
n = [-1*((M-1)/2):(M-1)/2];
h_n = ((sin(wc2.*n) - sin(wc1.*n))./(pi.*n)); %resposta ao impulso para n≠0
h_n(((M-1)/2)+1) = (wc2 - wc1)/pi; %resposta ao impulso para n=0
w_hamm = 0.54 + 0.46*cos(2*n.*pi/(M));%coeficientes da janela de hamming
w_hann = 0.5 + 0.5*cos(2*n.*pi/(M));%coeficientes da janela de hanning
w_black = 0.42+0.5*cos(2*n.*pi/(M))+0.08*cos(4*n.*pi/(M)); %coeficientes da janela de blackman
h_ret = h_n;
h_hamm = w_hamm.*h_n;
h_hann = w_hann.*h_n;
h_black = w_black.*h_n;
figure
freqz(h_ret,1);
title('Filtro FIR passa-faixa - Janela Retangular')

figure
freqz(h_hamm,1);
title('Filtro FIR passa-faixa - Janela de Hammming')

figure
freqz(h_hann,1);
title('Filtro FIR passa-faixa - Janela de Hanning')

figure
freqz(h_black,1);
title('Filtro FIR passa-faixa - Janela de Blackman')


%% Sinais filtrados

figure

s_f_h_ret = filter(h_ret,1,s);
S_F_h_ret = fft(s_f_h_ret);
S_F_h_ret = abs(2*S_F_h_ret/L);
S_F_h_ret = fftshift(S_F_h_ret);
subplot(2,2,1),plot(freq,S_F_h_ret)
title('Espectro de Amplitude do sinal Filtrado (Ret)')
xlabel('f (Hz)')
ylabel('|S(f)|')
axis([-1000 1000 0 5])


h_hamm = w_hamm.*h_n;
s_f_h_hamm = filter(h_hamm,1,s);
S_F_h_hamm = fft(s_f_h_hamm);
S_F_h_hamm = abs(2*S_F_h_hamm/L);
S_F_h_hamm = fftshift(S_F_h_hamm);
subplot(2,2,2),plot(freq,S_F_h_hamm)
title('Espectro de Amplitude do sinal Filtrado (Hamm)')
xlabel('f (Hz)')
ylabel('|S(f)|')
axis([-1000 1000 0 5])


h_hann = w_hann.*h_n;
s_f_h_hann = filter(h_hann,1,s);
S_F_h_hann = fft(s_f_h_hann);
S_F_h_hann = abs(2*S_F_h_hann/L);
S_F_h_hann = fftshift(S_F_h_hann);
subplot(2,2,3),plot(freq,S_F_h_hann)
title('Espectro de Amplitude do sinal Filtrado (Hann)')
xlabel('f (Hz)')
ylabel('|S(f)|')
axis([-1000 1000 0 5])


h_black = w_black.*h_n;
s_f_h_black = filter(h_black,1,s);
S_F_h_black = fft(s_f_h_black);
S_F_h_black = abs(2*S_F_h_black/L);
S_F_h_black = fftshift(S_F_h_black);
subplot(2,2,4),plot(freq,S_F_h_black)
title('Espectro de Amplitude do sinal Filtrado (Black)')
xlabel('f (Hz)')
ylabel('|S(f)|')
axis([-1000 1000 0 5])