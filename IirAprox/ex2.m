close all;


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
load('filtiir.mat')

% figure,freqz(Num1b,Den1b);
% figure,freqz(Num2b,Den2b);
% figure,freqz(Num3b,Den3b);
% 
% figure,freqz(Num1c,Den1c);
% figure,freqz(Num2c,Den2c);
% figure,freqz(Num3c,Den3c);
% 
% figure,freqz(Num1e,Den1e);
% figure,freqz(Num2e,Den2e);
% figure,freqz(Num3e,Den3e);

s_f_1b = filter(Num1b,Den1b,s);
S_F_1b = fft(s_f_1b);
S_F_1b = abs(2*S_F_1b/L);
S_F_1b =fftshift(S_F_1b);   

s_f_1c = filter(Num1c,Den1c,s);
S_F_1c = fft(s_f_1c);
S_F_1c = abs(2*S_F_1c/L);
S_F_1c =fftshift(S_F_1c);   

s_f_1e = filter(Num1e,Den1e,s);
S_F_1e = fft(s_f_1e);
S_F_1e = abs(2*S_F_1e/L);
S_F_1e =fftshift(S_F_1e);  


s_f_2b = filter(Num2b,Den2b,s);
S_F_2b = fft(s_f_2b);
S_F_2b = abs(2*S_F_2b/L);
S_F_2b =fftshift(S_F_2b);  

s_f_2c = filter(Num2c,Den2c,s);
S_F_2c = fft(s_f_2c);
S_F_2c = abs(2*S_F_2c/L);
S_F_2c =fftshift(S_F_2c);   

s_f_2e = filter(Num2e,Den2e,s);
S_F_2e = fft(s_f_2e);
S_F_2e = abs(2*S_F_2e/L);
S_F_2e =fftshift(S_F_2e);  


s_f_3b = filter(Num3b,Den3b,s);
S_F_3b = fft(s_f_3b);
S_F_3b = abs(2*S_F_3b/L);
S_F_3b =fftshift(S_F_3b);  

s_f_3c = filter(Num3c,Den3c,s);
S_F_3c = fft(s_f_3c);
S_F_3c = abs(2*S_F_3c/L);
S_F_3c =fftshift(S_F_3c);   

s_f_3e = filter(Num3e,Den3e,s);
S_F_3e = fft(s_f_3e);
S_F_3e = abs(2*S_F_3e/L);
S_F_3e =fftshift(S_F_3e);  


%% Gráficos
figure;
freq = Fs*(-(L/2):(L/2)-1)/L;
subplot(2,1,1),plot(t,s);
title('Sinal')
xlabel('t')
ylabel('s(t)')
subplot(2,1,2),plot(freq,S)
axis([-1000 1000 0 1])
title('Espectro de Amplitude de s(t)')
xlabel('f (Hz)')
ylabel('|S(f)|')

% Filtro 1

figure;
subplot(3,1,1),plot(freq,S_F_1b)
title('Espectro de Amplitude do sinal Filtrado 1 (Butterworth)')
axis([-1000 1000 0 1])
xlabel('f (Hz)')
ylabel('|S(f)|')

subplot(3,1,2),plot(freq,S_F_1c)
title('Espectro de Amplitude do sinal Filtrado 1 (Chebyshev)')
axis([-1000 1000 0 1])
xlabel('f (Hz)')
ylabel('|S(f)|')

subplot(3,1,3),plot(freq,S_F_1e)
title('Espectro de Amplitude do sinal Filtrado 1 (Elíptico)')
axis([-1000 1000 0 1])
% set_xticks(-1000:50:1000)
xlabel('f (Hz)')
ylabel('|S(f)|')

% Filtro 2

figure;
subplot(3,1,1),plot(freq,S_F_2b)
title('Espectro de Amplitude do sinal Filtrado 2 (Butterworth)')
axis([-1000 1000 0 1])
xlabel('f (Hz)')
ylabel('|S(f)|')

subplot(3,1,2),plot(freq,S_F_2c)
title('Espectro de Amplitude do sinal Filtrado 2 (Chebyshev)')
axis([-1000 1000 0 1])
xlabel('f (Hz)')
ylabel('|S(f)|')

subplot(3,1,3),plot(freq,S_F_2e)
title('Espectro de Amplitude do sinal Filtrado 2 (Elíptico)')
axis([-1000 1000 0 1])
% set_xticks(-1000:50:1000)
xlabel('f (Hz)')
ylabel('|S(f)|')

% Filtro 3

figure;
subplot(3,1,1),plot(freq,S_F_3b)
title('Espectro de Amplitude do sinal Filtrado 3 (Butterworth)')
axis([-1000 1000 0 1])
xlabel('f (Hz)')
ylabel('|S(f)|')

subplot(3,1,2),plot(freq,S_F_3c)
title('Espectro de Amplitude do sinal Filtrado 3 (Chebyshev)')
axis([-1000 1000 0 1])
xlabel('f (Hz)')
ylabel('|S(f)|')

subplot(3,1,3),plot(freq,S_F_3e)
title('Espectro de Amplitude do sinal Filtrado 3 (Elíptico)')
axis([-1000 1000 0 1])
% set_xticks(-1000:50:1000)
xlabel('f (Hz)')
ylabel('|S(f)|')