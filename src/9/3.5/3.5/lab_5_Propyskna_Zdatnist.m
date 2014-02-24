%%% ��������
%% 3. ����� ������
%% 3.1. �) ���������� ��������� �������� ������������ ��������� ������
%% ������ ���� ��������� ������ ����� ������ �������
N = 12;               % ����� �� ������
n = 2;                % ����� ����� (1 ��� 2)
Nvar = N + 12;       % ����� ������� 2 �����
W = Nvar              % ������ ����� �����������
Rb = Nvar             % ����� ��������
Tb = 1/Rb             % ��������� ���
%% ���������� ��������� �������� ������������ ��������� ������
EbNodB = (1/4) * Nvar + 5  % ��������� ����㳿 ��� �� ����������� ������� ���������
Cawgn = W .* log2(1 + (10.^(0.1 .* EbNodB)) .* Rb ./ W)
%Cawgn = W .* log2(1 + (10 .^(0.1 .* EbNodB)) .* Cawgn ./ W)
plot(EbNodB,Cawgn,'ok'); grid on; hold on

%% ������ �������� ��������� �������� �� EbNo ��� ������� ������ �����
%% �������
EbNo = [0 : 1: 10];
Cawgn = W .* log2(1 + (10.^(0.1 .* EbNo)) .* (Rb ./ W));
%Cawgn = W .* log2(1 + (10.^(0.1 .* EbNo)) .* (Cawgn ./ W));
plot(EbNo,Cawgn); grid on
xlabel('Eb/No, ��'); ylabel('Cawgn, ��/�');

%% �) ���������� ��������� �������� ��� ����������� ������.
M = 4;
%Rb = 19; Rs = Rb ./log2(M);
% 1) ��� ���������
Pber = 0.01479;
Cduskr = Rb * (log2(M) + Pber*log2(Pber/(M-1)) + (1-Pber)*log2(1-Pber))
% 2) � ����������
Pber_cod = 0.00003258;
Cduskr_cod = Rb * (log2(M) + Pber_cod*log2(Pber_cod/(M-1)) + (1-Pber_cod)*log2(1-Pber_cod))

%% 3.3. ���������� ��������� MSI, S/N.
a = 1;
b = 0.3;
MSI = 20 .* log10(a ./ b)
SN = 20 .* log10(a ./ (a-b))
%% 3.4. ���������� ������ ����� ����������� �������.
