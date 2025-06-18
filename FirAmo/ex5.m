% 5. Projete um filtro passa-faixa tipo III usando o método da amostragem em frequência que satisfaça a
% especificação a seguir:
% M = 52
% Ωr1 = 2 rad/s
% Ωp1 = 3 rad/s
% Ωp2 = 7 rad/s
% Ωr2 = 8 rad/s
% Ωs = 20,0 rad/s
% - Agora aumente o número de amostras, mantendo sua paridade. Compare com os resultados da
% questão 3.

clear all
M = 52;
N = M+1;
Omega_r1 = 2;
Omega_p1 = 3;
Omega_p2 = 7;
Omega_r2 = 8;
Omega_s = 20;
kp1 = floor(N*Omega_p1/Omega_s);
kr1 = floor(N*Omega_r1/Omega_s);
kp2 = floor(N*Omega_p2/Omega_s);
kr2 = floor(N*Omega_r2/Omega_s);
if (kp1-kr1)>1
kp1=kr1+1;
end
if (kr2-kp2)>1
kp2=kr2-1;
end
A= [zeros(1,kr1+1) ones(1,kp2-kp1+1) zeros(1,M/2-kr2+1)];
k = 1:M/2;
for n=0:M,
h(n+1) = 2*sum((-1).^(k+1).*A(k+1).*sin(pi.*k*(1+2*n)/N));
end;
h = h./N;
% freqz(h,1,2048)
figure
[H,w]=freqz(h,1,2048,Omega_s);
plot(w,20*log10(abs(H)))
%axis([0 5 -50 10])
ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (rad/s)');
title('Resposta em Frequência');

figure(2)
stem(h)
ylabel('Resposta ao impulso');
xlabel('amostras (n)');