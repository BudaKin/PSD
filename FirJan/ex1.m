% 1.Projete um filtro passa-faixa usando a janela de Hamming, a janela de Hanning e janela de 
% Blackman que satisfaça a especificação a seguir.
% • M = 10, 100, 1000
% • Ωc1 = 10 rad/s
% • Ωc2 = 35 rad/s
% • Ωs = 100 rad/s

clear all; close all; clc;

% com M = 10, ou 100, ou 1000
M = 10;
Omega_c1 = 10;
Omega_c2 = 35;
Omega_s = 100;
wc1 = Omega_c1*2*pi/Omega_s; wc2 = Omega_c2*2*pi/Omega_s;
n = 1:M/2;
h0 = (wc2 - wc1)/pi;
haux = (sin(wc2.*n) - sin(wc1.*n))./(pi.*n);
h_ideal = [fliplr(haux) h0 haux];
h_ret=h_ideal;
[H_ret,w]=freqz(h_ret,1,2048,Omega_s);
figure(1)
plot(w,20*log10(abs(H_ret)))

ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (rad/s)');
title('Resposta em Frequência - Janela Retangular');

h_aux=hamming(M+1);
h_ham=h_ideal.*h_aux';
[H_ham,w]=freqz(h_ham,1,2048,Omega_s);
figure(2)
plot(w,20*log10(abs(H_ham)))
ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (rad/s)');
title('Resposta em Frequência - Janela de Hamming');

h_aux=hanning(M+1);
h_han=h_ideal.*h_aux';
[H_han,w]=freqz(h_han,1,2048,Omega_s);
figure(3)
plot(w,20*log10(abs(H_han)))
ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (rad/s)');
title('Resposta em Frequência - Janela de Hanning')

h_aux=blackman(M+1);
h_black=h_ideal.*h_aux';
[H_black,w]=freqz(h_black,1,2048,Omega_s);
figure(4)
plot(w,20*log10(abs(H_black)))
ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (rad/s)');
title('Resposta em Frequência - Janela de Blackman')

