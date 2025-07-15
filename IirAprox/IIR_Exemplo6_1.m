%% EXEMPLO 6.1 
% Projete um filtro passa-faixa que satisfaça as especificações abaixo usando os métodos de aproximação de Butterworth, de Chebyshev e elíptico:  
% Ap = 1,0 dB  
% Ar = 40 dB  
% Ωr1 = 1394π rad/s  
% Ωp1 = 1510π rad/s  
% Ωp2 = 1570π rad/s 
% Ωr2 = 1704π rad/s  

% Diniz, Paulo S. R.; Silva, Eduardo A. B. da; Netto, Sergio L.. Processamento Digital de Sinais: Projeto e Análise de Sistemas (p. 399). Edição do Kindle. 
%%
close all; clear all; pkg load signal;

Ap =1;
Ar = 40;
Wr1 = 1394*pi;
Wp1 = 1510*pi;
Wp2 = 1570*pi;
Wr2 = 1704*pi;
Wp = [Wp1 Wp2];
Wr = [Wr1 Wr2];


[N1,Wn1] = buttord(Wp,Wr,Ap,Ar,'s');%definição da ordem do filtro 
[B1,A1] = butter(N1,Wn1,'s');
[H1,W1] = freqs(B1,A1,2048);%vetores da resposta em frequência 
figure 
plot(W1/2/pi,20*log10(abs(H1)))
axis([600 1000 -90 10])
figure 
plot(W1/2/pi,angle(H1))
axis([600 1000 -3 3])


[N2,Wn2] = cheb1ord(Wp,Wr,Ap,Ar,'s');%definição da ordem do filtro 
[B2,A2] =  cheby1(N2,Ap,Wp,'s');
[H2,W2] = freqs(B2,A2,2048);%vetores da resposta em frequência 
figure 
plot(W2/2/pi,20*log10(abs(H2)))
axis([600 1000 -90 10])
figure 
plot(W2/2/pi,angle(H2))
axis([600 1000 -3 3])


[N3,Wn3] = ellipord(Wp,Wr,Ap,Ar,'s');%definição da ordem do filtro 
[B3,A3] =  ellip(N3,Ap,Ar,Wn3,'s');
[H3,W3] = freqs(B3,A3,2048);%vetores da resposta em frequência 
figure 
plot(W3/2/pi,20*log10(abs(H3)))
axis([600 1000 -90 10])
figure 
plot(W3/2/pi,angle(H3))
axis([600 1000 -3 3])

figure
plot(W1/2/pi,20*log10(abs(H1)),'r')
hold on
plot(W2/2/pi,20*log10(abs(H2)),'g')
hold on
plot(W3/2/pi,20*log10(abs(H3)),'b')
axis([600 1000 -90 10])


