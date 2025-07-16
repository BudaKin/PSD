clear all; close all; clc;

Ap = 0.915;
Ar = 13.98;
Wp = 0.2 * pi;
Wr = 0.3 * pi;
Ts = 2;

% H(s) = 2.43 * 10^(-3) (1)/(s^(6) + 1.42 s^(5) + s^(4) + 0.45 s^(3) + 0.135 s^(2) + 25.61 * 10^(-3) s + 2.430 * 10^(-3))
nums=[2.43e-3];
dens=[1 1.42 1 0.45 0.135 25.61e-3 2.43e-3];
[num, den] = bilinear(nums, dens, 1/Ts)
figure,freqz(num,den);
axis([0 1 -110 10])


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