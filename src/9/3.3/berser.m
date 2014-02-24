%% ���������� ���������� BER ��� MATLAB 7.0.
% ���
EbN0 = 0:1:15; 
linEbN0 = 10.^(EbN0(:).*0.1);
M = 4; % ����������� ���������
% ��������� ������
codeRate = 1/2; 
constlen = 7; 
k = log2(M); 
codegen = [171 133];
tblen = 32;     % traceback length
trellis = poly2trellis(constlen, codegen);
dspec = distspec(trellis, 7);
% ���������� ���������� BER 
expVitBER = bercoding(EbN0, 'conv', 'hard', codeRate, dspec);
semilogy(EbN0, expVitBER, 'g');  
xlabel('Eb/No (dB)'); ylabel('BER');
title('�������������� ��� R=1/2, K=7 �����. ���� �� QPSK � Hard Decision');
grid on; axis([0 15 10e-7 10e-3]); legend('�������� ����', 0);
