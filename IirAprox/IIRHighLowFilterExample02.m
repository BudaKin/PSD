
load chirp

sound(y,Fs)
pause
t = (0:length(y)-1)/Fs;

L=length(y);
 
Y = fft(y);
Y = abs(2*Y/L);
Y = fftshift(Y);      
freq = Fs*(-(L/2):(L/2)-1)/L;
figure,plot(freq,Y)
title('Espectro de Amplitude do sinal original')
xlabel('f (Hz)')
ylabel('|Y(f)|')


figure
freqz(bhi,ahi)

%%

outhi = filter(bhi,ahi,y);
figure
subplot(2,1,1)
plot(t,y)
title('Original Signal')
subplot(2,1,2)
plot(t,outhi)
title('Highpass Filtered Signal')
xlabel('Time (s)')

sound(outhi,Fs)
pause

L=length(outhi);
 
OUTHI = fft(outhi);
OUTHI = abs(2*OUTHI/L);
OUTHI = fftshift(OUTHI);      
freq = Fs*(-(L/2):(L/2)-1)/L;
figure,plot(freq,OUTHI)
title('Espectro de Amplitude do Sinal de alta frequência ')
xlabel('f (Hz)')
ylabel('|S(f)|')


%%
outlo = filter(blo,alo,y);
figure
subplot(2,1,1)

plot(t,y)
title('Original Signal')
subplot(2,1,2)
plot(t,outlo)
title('Lowpass Filtered Signal')
xlabel('Time (s)')

sound(outlo,Fs)
pause

OUTLO = fft(outlo);
OUTLO = abs(2*OUTLO/L);
OUTLO = fftshift(OUTLO);      
freq = Fs*(-(L/2):(L/2)-1)/L;
figure,plot(freq,OUTLO)
title('Espectro de Amplitude do Sinal de Baixa Frequência')
xlabel('f (Hz)')
ylabel('|S(f)|')
