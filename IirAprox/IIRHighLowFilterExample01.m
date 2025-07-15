
close all
 
%% Sinal 
tmin = 0;             
tmax = 2;
Fs=1000;
Ts=1/Fs;
L=(tmax-tmin)/Ts;

t=0:Ts:tmax-Ts;             
s = 5*sin(2*pi*50*t) + 2*sin(2*pi*300*t);
S = fft(s);
S = abs(2*S/L);
S = fftshift(S);  

%% Filtros IIR importados do filterDesigner  wp=0.2 wr=0.3 low e wp=0.8 wr=0.6
figure,freqz(num_low,den_low);

 
s_f_low = filter(num_low,den_low,s);
S_F_low = fft(s_f_low);
S_F_low = abs(2*S_F_low/L);
S_F_low=fftshift(S_F_low);      

figure,freqz(num_high,den_high);
 
s_f_high = filter(num_high,den_high,s);
S_F_high = fft(s_f_high);
S_F_high = abs(2*S_F_high/L);
S_F_high=fftshift(S_F_high);      

%% Gráficos
freq = Fs*(-(L/2):(L/2)-1)/L;
subplot(4,1,1),plot(t,s);
title('Sinal')
xlabel('t')
ylabel('s(t)')
subplot(4,1,2),plot(freq,S)
title('Espectro de Amplitude de s(t)')
xlabel('f (Hz)')
ylabel('|S(f)|')
subplot(4,1,3),plot(freq,S_F_low)
title('Espectro de Amplitude do sinal Filtrado - baixa frequência')
xlabel('f (Hz)')
ylabel('|S(f)|')
subplot(4,1,4),plot(freq,S_F_high)
title('Espectro de Amplitude do sinal Filtrado - alta frequência')
xlabel('f (Hz)')
ylabel('|S(f)|')
 
