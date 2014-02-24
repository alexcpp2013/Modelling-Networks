%% б) Розрахунок пропускної здатності для дискретного каналу.
M = 4;
%Rb = 19; Rs = Rb ./log2(M);
% 1) без кодування
Pber = 0.01479;
Cduskr = Rb * (log2(M) + Pber*log2(Pber/(M-1)) + (1-Pber)*log2(1-Pber))
% 2) з кодуванням
Pber_cod = 0.00003258;
Cduskr_cod = Rb * (log2(M) + Pber_cod*log2(Pber_cod/(M-1)) + (1-Pber_cod)*log2(1-Pber_cod))
