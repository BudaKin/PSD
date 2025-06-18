% EXEMPLO 5.4

% Projete um filtro rejeita-faixa que satisfaça as especificações a seguir, usando a janela de Kaiser:

% Ap = 1,0 dB
% Ar = 45 dB

% Ωp1 = 800 Hz
% Ωr1 = 950 Hz
% Ωr2 = 1050 Hz
% Ωp2 = 1200 Hz
% Ωs = 6000 Hz

Ap = 1;
Ar = 45;
Omega_p1 = 800;
Omega_r1 = 950;
Omega_r2 = 1050;
Omega_p2 = 1200;
Omega_s = 6000;
delta_p = (10^(0.05*Ap) - 1)/(10^(0.05*Ap) + 1);
delta_r = 10^(-0.05*Ar);
F = [Omega_p1 Omega_r1 Omega_r2 Omega_p2];
A = [1 0 1];
ripples = [delta_p delta_r delta_p];
[M,Wn,beta,FILTYPE] = kaiserord(F,A,ripples,Omega_s);
kaiser_win = kaiser(M+1,beta);
h = fir1(M,Wn,FILTYPE,kaiser_win,'noscale');
figure(1)
stem(0:M,h)
ylabel('h[n]');
xlabel('n)');
title('Resposta ao Impulso');

[H,w]=freqz(h,1,2048,Omega_s);
figure(2)
plot(w,20*log10(abs(H)))
axis([0 Omega_s/2 -90 10])
ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (Hz)');
title('Resposta em Frequência');
