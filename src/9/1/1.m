	
clientsNumber = 300; % ���������� �������� (N_users)
jobsPerSec = 12 / 60; % �����. ���������� ������ �� ������ ������������ � ��� (N_tranz)
jobSize = 4.8; % ������� ������ ������� � ������� (Kib)
procFreq = 14e8; % �������� ������� ���������� ������� (��) 
operationTacts = 5; % ������� ���������� ������ �� ��������� 1 �������� 
jobOperationsNumber = 3000000; % ������� ���������� �������� ��� ��������� 1 ������� (N_op)
responseSize = 3200; % ������� ������ ������ ������� (Kib)
serversNumber = 1; % ���������� �������� (������������� ���������)
connectionSpeed = 100000; % Kibps
connectionsNumber = 2; % ���������� ������� ������/��������

%%
% C����. �p��� ��p����� ������ (T_trans_t) (���)
jobTransitionTime = jobSize / (connectionSpeed * connectionsNumber)

% C����. �p��� ��p����� ������ (T_trans_a) (���)
responseTransitionTime = responseSize / (connectionSpeed * connectionsNumber)

% ����. ����� �p������p� ��p��p� (���)
tactDuration = 1 / procFreq

% C������ ����. ���������� ����� ���p���� (T_oper) (���)
operationTime = operationTacts * tactDuration

% C����. �p��� ��p������ ������ �p������p�� (T_work_t) (���)
jobProcessorTime = jobOperationsNumber * operationTime

% �p����� ������������ ������������ ������ (T_adopt_t) (���)
jobServiceTime = jobProcessorTime
%%
% C����. �p��� ����� ������������� ������ (T_mt) (���)
jobsArrivingInterval = 1 / (jobsPerSec * clientsNumber)

% ������������� ����������� ������ (L1) (������/���)
lambda = 1 / jobsArrivingInterval
% ������������� ������������ ������ (M1) (������/���)
mu = 1 / jobServiceTime

% H��p���� 1 ������� (P1)
roServer = lambda / (mu * serversNumber)

% H��p���� ������� ��������� ������������(U)
%systemUtilization = min(serverTotalBusyTime / T, 1);
systemUtilization = min(roServer, 1)

% �p�������� ����������� ������� ��������� ������������ (LU) (������/���)
LU = min(lambda, mu * serversNumber)

%%
% ��������� ����������
roByN = roServer * serversNumber;

% ���������� ������� �������
K1=0;
for i=0:serversNumber-1
K1 = K1 + power(roByN,i);
end
K2=0;
for i=0:serversNumber
K2 = K2 + power(roByN,i);
end

K = (K1/lambda)/(K2/lambda);

C = (1-K)/(1-roServer*K); % ������� �������

% ������� ���������� ������ � �������:
omega = C*roServer/(1-roServer)

% ������� ���������� ������ � �������:
q = omega + serversNumber * roServer

% �p����� �p��� �������� ������ � �������(Tw ) (���)
Tomega = (C/serversNumber)*jobServiceTime/(1-roServer)

% �p����� �p��� �������� � ������� ��� ����� ������� ��������(Tq) (���)
Tq = Tomega + jobServiceTime

% �p����� �p��� �������� ������� (T_wait) (���)
responseTime = responseTransitionTime + jobTransitionTime + Tq

% ���������� ������� ���������� ������ � �������
SigmaTq = jobServiceTime / (serversNumber*(1-roServer))...
* sqrt(C*(2-C)+serversNumber*serversNumber*(1-roServer)*(1-roServer))

% ���������� ���������� ��������� ������ � �������
SigmaOmega = (1/(1-roServer)) * sqrt(C*roServer*(1+roServer-C*roServer))

%%
% ����������� ������� �������
systemOutageProbability = 1 - systemUtilization

% ����������� ������� �������
serverOutageProbability = 1 - roServer

%%
fprintf('������������� ��������� ������ �������� (������/���):\tmu = %f\n', mu);
fprintf('����������� �������� �������������� ���������� (�������):\troServer = %f\n', roServer);
fprintf('������� ����� ������������ ������ �������� (�):\tTs = %f\n', jobServiceTime);
fprintf('������� �����, ������� ������ ������ ������� � ������� ������� (�):\tTomega = %f\n', Tomega);
fprintf('������� �����, ������� ������ ��������� � ������� ������ (�):\tTq = %f\n', Tq);
fprintf('������� ����� ������� � ������:\tomega = %f\n', omega);
fprintf('������� ���������� ��������� ������ � �������:\tq = %f\n', q);
fprintf('����������� ���������� �������� ������� ���������� ������ � ������� (�):\tSigmaTq = %f\n', SigmaTq);
fprintf('����������� ���������� ���������� ��������� ������ � �������:\tSigmaOmega = %f\n', SigmaOmega);
fprintf('����������� ������� �������:\tP0 = %f\n', serverOutageProbability);
fprintf('�p����� �p��� �������� ������� (���):\tT = %f\n', responseTime);
