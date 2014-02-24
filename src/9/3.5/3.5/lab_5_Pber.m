%%% ��������
%% 3.2. 
% a) ������� ����������������� Pber �� Pber_cod �� EbNodB 
% � ������� [0:10].
figure;
EbNoVec = [0:1.0:13.0];
% ��� ��� ���������������� BER ��� ������������ � SIMULINK
PberVec = [];
Pber_codVec = [];
opts = simset('SrcWorkspace','Current',...
   'DstWorkspace','Current');
% ������ ����� ���� ������.
set_param('lab_5_qpsk_viterbi_sqrt/AWGN Channel',...
    'EsNodB','EbNodB+10*log10(1/2)');
% ��������� ����������� �������.
for n = 1:length(EbNoVec)
    EbNodB = EbNoVec(n);
    sim('lab_5_qpsk_viterbi_sqrt',5000,opts);
    PberVec(n,:) = Pber;
    Pber_codVec(n,:) = Pber_cod;
    semilogy(EbNoVec(n),PberVec(n,1),'ok'); % ������ �����.
    hold on;
    semilogy(EbNoVec(n),Pber_codVec(n,1),'om');
    drawnow;
    xlabel('Eb/No (dB)'); ylabel('Bit Error Rate');
    title('Bit Error Rate (BER)');
    legend('Pber','Pbercod');
    axis([0 13 1e-5 1]); grid on;
end
hold on;

% �) ���������� Pber �� Pber_cod ��� �������� EbNo �� ���������� ��� �����
% �� �������.
EbNodB = 13.0
sim('lab_5_qpsk_viterbi_sqrt',5000,opts);
PberVec(1,:) = Pber;
Pber_codVec(1,:) = Pber_cod;

Pber = PberVec(1,1)
Pber_cod = Pber_codVec(1,1)

semilogy(EbNodB,PberVec(1,1),'sr'); % ������ �����.
hold on;
semilogy(EbNodB,Pber_codVec(1,1),'sb');
