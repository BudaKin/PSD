% EXEMPLO 5.3

% Projete um filtro rejeita-faixa que satisfaça as especificações a seguir usando as janelas retangular, de Hamming, de Hann e de Blackman:

% M = 80 Ωc1 = 2000 rad/s Ωc2 = 4000 rad/s Ωs = 10 000 rad/s

clear all
M = 80;
Omega_c1 = 2000;
Omega_c2 = 4000;
Omega_s = 10000;
wc1 = Omega_c1*2*pi/Omega_s; wc2 = Omega_c2*2*pi/Omega_s;
n = 1:M/2;
h0 = 1 - (wc2 - wc1)/pi;
haux = (sin(wc1.*n) - sin(wc2.*n))./(pi.*n);
h_ideal = [fliplr(haux) h0 haux];
h_ret=h_ideal;
[H_ret,w]=freqz(h_ret,1,2048,Omega_s);
figure(1)
plot(w,20*log10(abs(H_ret)))
axis([0 Omega_s/2 -90 10])

ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (rad/s)');
title('Resposta em Frequência - Janela Retangular');

h_aux=hamming(M+1);
h_ham=h_ideal.*h_aux';
[H_ham,w]=freqz(h_ham,1,2048,Omega_s);
figure(2)
plot(w,20*log10(abs(H_ham)))
axis([0 Omega_s/2 -90 10])
ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (rad/s)');
title('Resposta em Frequência - Janela de Hamming');

h_aux=hanning(M+1);
h_han=h_ideal.*h_aux';
[H_han,w]=freqz(h_han,1,2048,Omega_s);
figure(3)
plot(w,20*log10(abs(H_han)))
axis([0 Omega_s/2 -150 10])
ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (rad/s)');
title('Resposta em Frequência - Janela de Hanning')

h_aux=blackman(M+1);
h_black=h_ideal.*h_aux';
[H_black,w]=freqz(h_black,1,2048,Omega_s);
figure(4)
plot(w,20*log10(abs(H_black)))
axis([0 Omega_s/2 -150 10])
ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (rad/s)');
title('Resposta em Frequência - Janela de Blackman')
