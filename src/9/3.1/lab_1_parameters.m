%% lab_1_parameters.m
N = 2;               % ����� �� ������
n = 2;                % ����� ����� (1 ��� 2)
Nvar = N + 12;       % ����� ������� 2 �����

Rb = Nvar*64000       % ����� ��������
Tb = 1/Rb             % ��������� ���
Rs = Rb/2             % ��������� ��������
Ts = 1/Rs             % ��������� �������

Td = Ts/128           % ��� �������������

Fc = 2*pi*Rs          % ������ �������

EbNodB = (1/4) * Nvar + 5 % ��������� ����㳿 ��� �� ����������� ������� ���������
