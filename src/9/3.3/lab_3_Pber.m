%% lab_3_Pber.m
% 1. Графіки експериментальних Pber та Pber_cod від EbNodB 
% в діапазоні [0:10].
figure;
EbNoVec = [5.0:1.0:15.0];
% Код для експериментальної BER для завантаження з SIMULINK
PberVec = [];
Pber_codVec = [];
opts = simset('SrcWorkspace','Current',...
   'DstWorkspace','Current');
% Робимо рівень шуму змінним.
set_param('lab_3_qpsk_viterbi/AWGN Channel',...
    'EsNodB','EbNodB+10*log10(1/2)');
% Моделюємо багатократні моменти.
for n = 1:length(EbNoVec)
    EbNodB = EbNoVec(n);
    sim('lab_3_qpsk_viterbi',0.03,opts);
    PberVec(n,:) = Pber;
    Pber_codVec(n,:) = Pber_cod;
    semilogy(EbNoVec(n),PberVec(n,1),'ok'); % Графік точок.
    hold on;
    semilogy(EbNoVec(n),Pber_codVec(n,1),'om');
    drawnow;
    xlabel('Eb/No (dB)'); ylabel('Bit Error Rate');
    title('Bit Error Rate (BER)');
    legend('Pber','Pbercod');
    axis([5 15 1e-5 1]); grid on;
end
hold on;

% 2. Визначення Pber та Pber_cod для заданого EbNo та зображення цих точок
% на графіку.
EbNodB = 6.4
sim('lab_3_qpsk_viterbi',0.03,opts);
PberVec(1,:) = Pber;
Pber_codVec(1,:) = Pber_cod;

Pber = PberVec(1,1)
Pber_cod = Pber_codVec(1,1)

semilogy(EbNodB,PberVec(1,1),'sr'); % Графік точок.
hold on;
semilogy(EbNodB,Pber_codVec(1,1),'sb');
