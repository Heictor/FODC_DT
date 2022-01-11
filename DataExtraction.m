%% Data extraction from table

% NumData: Numerical Data
% TxtData: Extract String Data
% RawData: Whole data from table (Abstract)
[NumData,TxtData,RawData] = xlsread('DaTa.xlsx',1,'A1:K52');

% The results
target = TxtData(2:52,11);

save('MyWorkspace','target','NumData')