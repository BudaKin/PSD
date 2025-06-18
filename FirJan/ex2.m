% 2. Projete um filtro que satisfaça as especificações a seguir, usando a janela de Kaiser:
% a)
% • Ap = 1,0 dB
% • Ar = 40 dB
% • Ωp = 1000 rad/s
% • Ωr = 1200 rad/s
% • Ωs = 5000 rad/s

% _____________________________________
% b)
% • Ap = 1,0 dB
% • Ar = 40 dB
% • Ωr = 1000 rad/s
% • Ωp = 1200 rad/s
% • Ωs = 5000 rad/s

% _____________________________________
% c)
% • Ap = 1,0 dB
% • Ar = 80 dB
% • Ωr1 = 800 rad/s
% • Ωp1 = 1000 rad/s
% • Ωp2 = 1400 rad/s
% • Ωr2 = 1600 rad/s
% • Ωs = 10000 rad/s

Ap = 1;
Ar = 45;
Omega_r1 = 800;
Omega_p1 = 1000;
Omega_p2 = 1400;
Omega_r2 = 1600;
Omega_s = 10000;

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



