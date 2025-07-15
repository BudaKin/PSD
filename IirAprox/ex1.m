clear all; close all; clc;

Ap = 0.915;
Ar = 13.98;
Wp = 0.2 * pi;
Wr = 0.3 * pi;

[N,Wn] = buttord(Wp,Wr,Ap,Ar,'s'); % definição da ordem do filtro
[B,A] = butter(N,Wn,'s');
[H,W] = freqs(B,A,2048); % vetores da resposta em frequência 
figure 
plot(W/2/pi,20*log10(abs(H)))
axis([0 1 -110 10])
xlabel('Frequência (rad/s)')
ylabel('Reposta de Módulo')
figure 
plot(W/2/pi,angle(H))
axis([0 1 -5 5])
xlabel('Frequência (rad/s)')
ylabel('Reposta de Fase')