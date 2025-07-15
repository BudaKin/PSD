close all
clear all
clc

%% EXEMPLO 6.3  
% Projete um filtro digital passa-faixa Elíptico, Butterworth, Chebyshev1 e Chebyshev2  que satisfaça as seguintes especificações:  
% Ap = 0,5 dB  
% Ar = 65 dB  
% Ωr1 = 850 rad/s  
% Ωp1 = 980 rad/s  
% Ωp2 = 1020 rad/s  
% Ωr2 = 1150 rad/s  
% Ωs = 10 000 rad/s   

% Diniz, Paulo S. R.; Silva, Eduardo A. B. da; Netto, Sergio L.. Processamento Digital de Sinais: Projeto e Análise de Sistemas (p. 412). Edição do Kindle. 
%%
Ap = 0.5;
Ar = 65;
Wr1 = 850/5000;
Wr2 = 1150/5000;
Wp1 = 980/5000;
Wp2 = 1020/5000;
Wp = [Wp1 Wp2];
Wr = [Wr1 Wr2];

%% Butterworth
[N1,Wn1] = buttord(Wp,Wr,Ap,Ar)%definição da ordem do filtro 
[B1,A1] = butter(N1,Wn1);%função para filtro butterworth 
[H1,W1] = freqz(B1,A1,2048,10000);%vetores da resposta em frequência 
figure 
plot(W1,20*log10(abs(H1)))
axis([700 1200 -150 10])
title('Filtro Butterworth')
Z1 = roots(B1);%zeros da função de transferência 
P1 = roots(A1);%polos da função de transferência 



%% Chebyshev1   
[N2,Wn2] = cheb1ord(Wp,Wr,Ap,Ar);%definição da ordem do filtro 
[B2,A2] = cheby1(N2,Ap,Wn2);%função para filtro chebyshev tipo 1 
[H2,W2] = freqz(B2,A2,2048,10000);%vetores da resposta em frequência 
figure 
plot(W2,20*log10(abs(H2)))
axis([700 1200 -150 10])
title('Filtro Chebyshev I')
Z2 = roots(B2)%zeros da função de transferência 
P2 = roots(A2)%polos da função de transferência 



%% Chebyshev2   
[N3,Wn3] = cheb2ord(Wp,Wr,Ap,Ar);%definição da ordem do filtro 
[B3,A3] = cheby2(N3,Ar,Wr);%função para filtro chebyshev tipo 2 
[H3,W3] = freqz(B3,A3,2048,10000);%vetores da resposta em frequência 
figure 
plot(W3,20*log10(abs(H3)))
axis([700 1200 -150 10])
title('Filtro Chebyshev II')
Z3 = roots(B3)%zeros da função de transferência 
P3 = roots(A3);%polos da função de transferência clo


%% Eliptico 
[N4,Wn4] = ellipord(Wp,Wr,Ap,Ar);%definição da ordem do filtro 
[B4,A4] = ellip(N4,Ap,Ar,Wn4);%função para filtro elíptico 
[H4,W4] = freqz(B4,A4,2048,10000);%vetores da resposta em frequência 
figure
plot(W4,20*log10(abs(H4)))
axis([700 1200 -150 10])
title('Filtro Elíptico')
Z4 = roots(B4)%zeros da função de transferência 
P4 = roots(A4)%polos da função de transferência 

