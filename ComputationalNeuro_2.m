%% Walt Tatera 
load('data2.mat');

%% Problem 1
siz1 = size(data(1,:))/250
siz22 = size(data(2,:))/250

%% Problem 2
x = 0:0.004:135.4840;
figure(1)
plot(x, data(1,:))
title('Channel 1 Raw Data')
xlabel('Time (s)')
ylabel('Voltage')

figure(2)
plot(x, data(2,:))
title('Channel 22 Raw Data')
xlabel('Time (s)')
ylabel('Voltage')
% find the alpha,beta etc rhythym

%% Problem 3
figure(3)
data1 = data(1,:);
[c, lags] = xcov(data1, data1, 'coeff');
plot(lags, c)
title('Channel 1 AutoCorr')

figure(4)
data22 = data(2,:);
[c, lags] = xcov(data22, data22, 'coeff');
plot(lags, c)
title('Channel 22 AutoCorr')
% zoom in on the plots for analysis

%% Problem 5
y1 = filter(Num, 1, data(1,:));

figure(5)
plot(x, data(1,:))
hold on
plot(x, y1, 'LineWidth', 1.5)
title('Channel 1 Filter')
xlabel('Time (s)')
ylabel('Voltage')

%% Problem 6
y22 = filter(Num, 1, data(2,:));

figure(6)
plot(x, y1)
hold on
plot(x, y22)
title('Channel 1 & Channel 22 Filters')
xlabel('Time (s)')
ylabel('Voltage')


%% Problem 7
y1fit = filtfilt(Num, 1, data(1,:));
% y22fit = filtfilt(Num, 1, data(2,:));

figure(7)
plot(x, data(1,:))
hold on
plot(x, y1, 'LineWidth', 1.5)
hold on
plot(x, y1fit, 'LineWidth', 1.5)
title('Channel 1 Filter Problem 7')
xlabel('Time (s)')
ylabel('Voltage')

% figure(8)
% plot(x, data(2,:))
% hold on
% plot(x, y22, 'LineWidth', 1.5)
% hold on
% plot(x, y22fit, 'LineWidth', 1.5)
% title('Channel 22 Filter Problem 7')
% xlabel('Time (s)')
% ylabel('Voltage')



