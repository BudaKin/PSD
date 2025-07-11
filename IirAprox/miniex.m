pkg load signal

% raízes do polinomio de 8a ordem
roots([0.5088^2 0 0 0 0 0 0 0 1]) 
% Resultam em 8 raízes
% Pegar metade (a que possui parte real negativa)
poly([-1.0939 + 0.4531i
  -1.0939 - 0.4531i
  -0.4531 + 1.0939i
  -0.4531 - 1.0939i
   ])

% raízes do polinomio de 12a ordem
roots([0.234256 0 0 0 0 0 0 0 0 0 0 0 1])
% Resultam em 12 raízes
% Pegar metade (a que possui parte real negativa)
poly([
  -1.0901 + 0.2921i
  -1.0901 - 0.2921i
  -0.7980 + 0.7980i
  -0.7980 - 0.7980i
  -0.2921 + 1.0901i
  -0.2921 - 1.0901i
  ])
# exemplo
  b = [0.4913]; a = [1 0.9883 1.2384 0.4913]; Fs = 2;
  [bd, ad] = bilinear(b,a,Fs)
# do exercicio
  b = 2.0660; a = [64e6 13.95e6 1.521e6 105.12e3 4.843e3 142.46 2.0660]; Fs = 0.5;
  [bd, ad] = bilinear(b,a,Fs)