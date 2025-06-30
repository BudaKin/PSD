% 4. Crie um sinal de entrada composto de três componentes senoidais, nas frequências 770 Hz, 
% 852 Hz e 941 Hz, com Ωs = 8 kHz. Projete três filtros passa-faixa digitais, o primeiro com 
% frequência central em 770 Hz, o segundo em 852 Hz e o terceiro em 941 Hz. Para o primeiro 
% filtro, as extremidades das faixas de rejeição estão nas frequências 697 e 852; para o 
% segundo, em 770 e 941 Hz; para o terceiro. Em 852 e 1209 Hz. Nos três filtros, a atenuação 
% mínima na faixa de rejeição é 60 dB.

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

%% Filtro 1 (passa-faixa 697 e 852 hz)

M = 401;
Omega_c1 = 700;
Omega_c2 = 800;
Omega_s = 8000;
wc1 = Omega_c1*2*pi/Omega_s;
wc2 = Omega_c2*2*pi/Omega_s;

%% Resposta ao impulso do filtro ideal h[n]
n = [-1*((M-1)/2):(M-1)/2];
h_n = ((sin(wc2.*n) - sin(wc1.*n))./(pi.*n)); %resposta ao impulso para n ≠ 0
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
title('Filtro 1 FIR passa-faixa - Janela Retangular')

figure
freqz(h_hamm,1);
title('Filtro 1 FIR passa-faixa - Janela de Hammming')

figure
freqz(h_hann,1);
title('Filtro 1 FIR passa-faixa - Janela de Hanning')

figure
freqz(h_black,1);
title('Filtro 1 FIR passa-banda - Janela de Blackman')

%% Gráficos do sinal
figure
subplot(3,1,1),plot(t,s);
title('Sinal')
xlabel('t')
ylabel('s(t)')
subplot(3,1,2),plot(freq,S)
title('Espectro de Amplitude de s(t)')
xlabel('f (Hz)')
ylabel('|S(f)|')

h_hamm = w_hamm.*h_n;
h_hann = w_hann.*h_n;
h_black = w_black.*h_n;
s_f_h_ret = filter(h_ret,1,s);
S_F_h_ret = fft(s_f_h_ret);
S_F_h_ret = abs(2*S_F_h_ret/L);
S_F_h_ret = fftshift(S_F_h_ret);
subplot(3,1,3),plot(freq,S_F_h_ret)
title('Espectro de Amplitude do sinal Filtrado 1')
xlabel('f (Hz)')
ylabel('|S(f)|')
ylim([0, 1])