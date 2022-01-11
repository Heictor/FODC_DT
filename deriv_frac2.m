clear all; close all; clc;

%% Amostra da função y com iterações iguais a h
h = 0.02; 
t = 0.0:h:1.0;
% y = 2*t-1*t.^2;
C = 1*10^-3; % F
V0 = 3; % V
R = 50;  % Ohm
L = 10; % Henry

% y = V0*exp(-1*(t/R*C))
y = exp(-10*t) + 11*t.*exp(-10*t)+1;


%% Derivada de ordem 1
% dy = 2 - 2*t;
% dy = (1100.*t.*exp(-10.*t) - 120.*exp(-10.*t)) + 20.*(exp(-10*t) - 110.*t.*exp(-10.*t)) +...
%       100*(exp(-10.*t) + 11.*t.*exp(-10.*t)+1);
dy = exp(-10*t) + 11*t.*exp(-10*t)+1;

%% Cálculo de derivadas fracionárias com diferentes ordens 
ordem = [0.1:0.1:0.9];
ordem_01 = linspace(0.0,0.9,41);

yd = zeros( length(ordem), length(t) );
for i=1:length(ordem)
% Acessa deriv_frac
    yd(i,:) = deriv_frac( ordem(i), y, h );
end

    
%% Plot dos resultados
%% Figure 1
figure(1) % Superfície gerada a partir de alpha, t e y
[X,Y] = meshgrid(t,ordem);
% mesh(X,Y,yd);
surfc(X,Y,yd);
% axis equal;
title(sprintf('Derivadas de ordem não-Inteira: %.2f ≤ alpha ≤ %.2f', ...
      ordem(1), ordem(end)));
xlabel('Valores de t')
ylabel('Valores de \alpha')
zlabel('Valores de D^\alphai(t)')
grid on

%% Figure 2 
figure(2) % Função primitiva e suas derivadas inteira e não-inteiras 
plot(t,y,'-b',t,yd,'-r',"LineWidth",1.5)
xlabel('t [s]')
ylabel('D^\alpha i(t) [A]')
legend({'i(t)','D^\alphai(t)'},'Location','NorthEast','NumColumns',1)
title('Differential Equation Graph    0.1 ≤ \alpha ≤ 1.0')
% axis([0 2 0 2])
axis([0 1 -2 10])
grid on

%% Figure 3 
figure(3) % Derivadas não-Inteiras de ordem alpha
plot(t,yd(1,:),'-.k',t,yd(2,:),'-.r',t,yd(3,:),'-.b',t,yd(4,:),'-k',t,yd(5,:),'-r',...
     t,yd(6,:),'-b',t,yd(7,:),'--k',t,yd(8,:),'--r',t,yd(9,:),'--b',"LineWidth",1)
xlabel('t [s]')
ylabel('D^\alphai(t) [A]')
legend({'d^0^.^1i(t)','d^0^.^2i(t)','d^0^.^3i(t)','d^0^.^4i(t)','d^0^.^5i(t)',...
        'd^0^.^6i(t)','d^0^.^7i(t)','d^0^.^8i(t)','d^0^.^9i(t)'},'Location',...
       'NorthEast','NumColumns',3)
title('Non-Integer Order Differential Equations 0.1 ≤ \alpha ≤ 0.9')
% axis([0 2 0 2])
axis([0 1 -2 10])
grid on

%% Figure 4
figure(4) % Derivadas não-inteiras: alpha = 0.1, 0.2 e 0.3
% plot(t,yd(1,:),'-b',t,yd(2,:),'-r',t,yd(3,:),'-k',t,yd(4,:),':b',t,dy,'-.g',...
%      t_01,veloc_01,'ob',t_02,veloc_02,'or',t_03,veloc_03,'ok',t_04,veloc_04,'ob',...
%      "LineWidth",2,'MarkerSize',10,"Markerfacecolor",'y')

plot(t,yd(1,:),'-b',t,yd(2,:),'-r',t,yd(3,:),'-k',t,yd(4,:),':b',t,y,'-.g',...
     "LineWidth",2,'MarkerSize',10,"Markerfacecolor",'y')
xlabel('t [s]')
ylabel('D^\alphai(t) [A]')
legend({'d^0^.^1i(t)','d^0^.^2i(t)','d^0^.^3i(t)','d^0^.^4i(t)','d^1^.^0i(t)'},...
        'Location','NorthEast','NumColumns',1)
title('0.1 ≤ \alpha ≤ 0.4')
% axis([0 2 0 2])
axis([0 1 0 10])
grid on

%% Figure 5
figure(5) % Derivadas não-inteiras: alpha = 0.4, 0.5 e 0.6
% plot(t,yd(4,:),'-b', t,yd(5,:),'-r',t,yd(6,:),'-k',t,yd(7,:),':b',t,dy,'-.g',...
%      t_04,veloc_04,'ob',t_05,veloc_05,'or',t_06,veloc_06,'ok',t_07,veloc_07,'ob',...
%      "LineWidth",2,'MarkerSize',10,"Markerfacecolor",'y')
plot(t,yd(4,:),'-b', t,yd(5,:),'-r',t,yd(6,:),'-k',t,yd(7,:),':b',t,y,'-.g',...
     "LineWidth",2,'MarkerSize',10,"Markerfacecolor",'y')
xlabel('t [s]')
ylabel('D^\alphai(t) [A]')
legend({'d^0^.^4i(t)','d^0^.^5i(t)','d^0^.^6i(t)','d^0^.^7i(t)','d^1^.^0i(t)'},...
        'Location','NorthEast','NumColumns',1)
title('0.4 ≤ \alpha ≤ 0.7')
% axis([0 2 0 2])
axis([0 1 -0.5 10])
grid on

%% Figure 8
figure(6) % Derivadas não-inteiras: alpha = 0.7, 0.8 e 0.9
% plot(t,yd(7,:),'-b',t,yd(8,:),'-r',t,yd(9,:),'-k',t,RL095,'-m',t,dy,'-.g',...
%      t_07,veloc_07,'ob',t_08,veloc_08,'or', t_09,veloc_09,'ok',...
%      t_095, veloc_095,'om',"LineWidth",2,'MarkerSize', 10, "Markerfacecolor",'y')

plot(t,yd(7,:),'-b',t,yd(8,:),'-r',t,yd(9,:),'-k',t,y,'-.g',...
     "LineWidth",2,'MarkerSize', 10, "Markerfacecolor",'y')
xlabel('t [s]')
ylabel('D^\alphai(t) [A]')
legend({'d^0^.^7i(t)','d^0^.^8i(t)','d^0^.^9i(t)','d^1^.^0i(t)','d^1^.^0i(t)'},...
        'Location','NorthEast','NumColumns',1)
title('0.7 ≤ \alpha ≤ 0.9')
% axis([0 2 0 2])
axis([0 1 -2 10])
grid on

%% Figure 7
figure(7) % v(t) para 0.1 ≤ alpha ≤ 0.9
[X,Y] = meshgrid(t,ordem);
% mesh(X,Y,yd);
s = meshz(X,Y,yd,'FaceAlpha','1.0');
% axis equal;
title(sprintf('Derivadas de ordem não-Inteira: %.2f ≤ alpha ≤ %.2f', ...
      ordem(1), ordem(end)));
xlabel('Valores de t')
ylabel('Valores de \alpha')
zlabel('Valores de D^\alphai(t)')
legend({'v(t)'},'Location','NorthEast','NumColumns',1)
title('v(t) para 0.1 ≤ \alpha ≤ 0.9')
% axis([0 2 -2 2])
grid on
% Para o Excel
%Mag_y = length(yd(1,:))
A = yd';
B = y';
xlswrite('DT.xlsx', A,1,'B2:J52');
xlswrite('DT.xlsx', B,1,'N2:N52');
