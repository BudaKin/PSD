% EXEMPLO 5.2
% Projete um filtro que satisfaça as especificações a seguir:
% M = 50
% Ωc1 = π/4 rad/s
% Ωc2 = π/2 rad/s
% Ωs = 2π rad/s

M = 50;
Omega_c1 = pi/4;
Omega_c2 = pi/2;
ws = 2*pi;
wc1 = Omega_c1*2*pi/ws; wc2 = Omega_c2*2*pi/ws;
n = 1:M/2;
h0 = 1 - (wc2 - wc1)/pi;
haux = (sin(wc1.*n) - sin(wc2.*n))./(pi.*n);
h = [fliplr(haux) h0 haux];
[H,w]=freqz(h,1,2048,ws);
plot(w,20*log10(abs(H)))
axis([0 ws/2 -90 10])
ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (rad/s)');
title('Resposta em Frequência');
