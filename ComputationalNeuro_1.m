%% Walt Tatera 

load('data1.mat');

%% Problem 1
%Cell 1 Raster
figure(1);
hold on;
for i = 1:numel(cell_1(:,1))
    plot(cell_1(i, :), ones(1, numel(cell_1(1, :))) * i, "+");
end
ylim([0 25]);
title('Cell Raster');
ylabel('Trial Number');
xlabel('Time (s)');

%Cell 2 Raster
figure(2);
hold on;
for i = 1:numel(cell_2(:,1))
    plot(cell_2(i, :), ones(1, numel(cell_2(1, :))) * i, "+");
end
ylim([0 11]);
title('Cell 2 Raster');
ylabel('Trial Number');
xlabel('Time (s)');

%Cell 3 Raster
figure(3);
hold on;
for i = 1:numel(cell_3(:,1))
    plot(cell_3(i, :), ones(1, numel(cell_3(1, :))) * i, "+");
end
ylim([0 11]);
title('Cell 3 Raster');
ylabel('Trial Number');
xlabel('Time (s)');

%Cell 4 Raster
figure(4);
hold on;
for i = 1:numel(cell_4(:,1))
    plot(cell_4(i, :), ones(1, numel(cell_4(1, :))) * i, "+");
end
ylim([0 11]);
title('Cell 4 Raster');
ylabel('Trial Number');
xlabel('Time (s)');

%% Problem 2

cell1_less2 = find(cell_1(1,:) < 2);
cell1_avgLess = mean(cell_1(cell1_less2(1), cell1_less2(end)));
cell1_greater2 = find(cell_1(1,:) > 2);
cell1_avgGreater = mean(cell_1(cell1_greater2(1), cell1_greater2(end)));

cell2_less2 = find(cell_2(1,:) < 2);
cell2_avgLess = mean(cell_2(cell2_less2(1), cell2_less2(end)));
cell2_greater2 = find(cell_2(1,:) > 2);
cell2_avgGreater = mean(cell_2(cell2_greater2(1), cell2_greater2(end)));

cell3_less2 = find(cell_3(1,:) < 2);
cell3_avgLess = mean(cell_3(cell3_less2(1), cell3_less2(end)));
cell3_greater2 = find(cell_3(1,:) > 2);
cell3_avgGreater = mean(cell_3(cell3_greater2(1), cell3_greater2(end)));

cell4_less2 = find(cell_4(1,:) < 2);
cell4_avgLess = mean(cell_4(cell4_less2(1), cell4_less2(end)));
cell4_greater2 = find(cell_4(1,:) > 2);
cell4_avgGreater = mean(cell_4(cell4_greater2(1), cell4_greater2(end)));

prob2 = [cell1_avgLess, cell1_avgGreater;...
    cell2_avgLess, cell2_avgGreater;...
    cell3_avgLess, cell3_avgGreater;...
    cell4_avgLess, cell4_avgGreater;]

%% Problem 3

figure(5)
histogram(diff(cell_1, 1, 2), 2500)
title('Cell 1 Interspike Histogram')
xlabel('Difference between sequential spikes (s)')
ylabel('Frequency')
figure(6)
histogram(diff(cell_3, 1, 2), 2500)
title('Cell 3 Interspike Histogram')
xlabel('Difference between sequential spikes (s)')
ylabel('Frequency')

%% Problem 4
% Peri Graph Cell 2(200 ms)
peri_cell_2_1 = [];
for i = 1:85
    foundIndx = find(cell_2 >= (0.2 * (i - 1)) & cell_2 < (0.2 * i));
    peri_cell_2_1 = [peri_cell_2_1, length(foundIndx)];
end
p = (1/.2)*(1/10);
peri_cell_2_1 * p;
figure(7)
bar(peri_cell_2_1)
title('Cell 2 PSTH (200ms)')

% Peri Graph Cell 2(50 ms)
peri_cell_2_2 = [];
for i = 1:340
    foundIndx = find(cell_2 >= (0.05 * (i - 1)) & cell_2 < (0.05 * i));
    peri_cell_2_2 = [peri_cell_2_2, length(foundIndx)];
end
p = (1/.05)*(1/10);
peri_cell_2_2 * p;
figure(8)
bar(peri_cell_2_2)
title('Cell 2 PSTH (50ms)')

% Peri Graph Cell 4(200 ms)
peri_cell_4_1 = [];
for i = 1:85
    foundIndx = find(cell_4 >= (0.2 * (i - 1)) & cell_4 < (0.2 * i));
    peri_cell_4_1 = [peri_cell_4_1, length(foundIndx)];
end
p = (1/.2)*(1/10);
peri_cell_4_1 * p;
figure(9)
bar(peri_cell_4_1)
title('Cell 4 PSTH (200ms)')

% Peri Graph Cell 4(50 ms)
peri_cell_4_2 = [];
for i = 1:340
    foundIndx = find(cell_4 >= (0.05 * (i - 1)) & cell_4 < (0.05 * i));
    peri_cell_4_2 = [peri_cell_4_2, length(foundIndx)];
end
p = (1/.05)*(1/10);
peri_cell_4_2 * p;
figure(10)
bar(peri_cell_4_2)
title('Cell 4 PSTH (50ms)')

%% Problem 5
% Cell 1 AutoCorrelation 50 ms
bin50hist = [];
for i = 1:10
    [binC50 edge] = histcounts(cell_1(i,:), 340);
    bin50hist = [bin50hist binC50];
end
figure(11)
bar(xcov(bin50hist, 'coeff'));
title('Autocorrelation 50ms Cell 1');

% Cell 1 AutoCorrelation 200 ms
bin200hist = [];
for i = 1:10
    [binC200 edge] = histcounts(cell_1(i,:), 85);
    bin200hist = [bin200hist binC200];
end
figure(12)
bar(xcov(bin200hist, 'coeff'));
title('Autocorrelation 200ms Cell 1');

% Cell 1 AutoCorrelation 50 ms
bin50hist = [];
for i = 1:10
    [binC50 edge] = histcounts(cell_3(i,:), 340);
    bin50hist = [bin50hist binC50];
end
figure(13)
bar(xcov(bin50hist, 'coeff'));
title('Autocorrelation 50ms Cell 3');

% Cell 1 AutoCorrelation 200 ms
bin200hist = [];
for i = 1:10
    [binC200 edge] = histcounts(cell_3(i,:), 85);
    bin200hist = [bin200hist binC200];
end
figure(14)
bar(xcov(bin200hist, 'coeff'));
title('Autocorrelation 200ms Cell 3');

%% Problem 6
% Cell 1 & 3 Cross Correlation 50 ms
bin50hist1 = [];
bin50hist2 = [];
for i = 1:10
    [binC501 edge] = histcounts(cell_1(i,:), 340);
    [binC502 edge] = histcounts(cell_3(i,:), 340);
    bin50hist1 = [bin50hist1 binC501];
    bin50hist2 = [bin50hist2 binC502];
end
figure(15)
bar(xcov(bin50hist1, bin50hist2, 'coeff'));
title('crosscorrelation 50ms Cell 1 & 3');

%% Problem 7
% Cell 1 & 2 cross correlation
bin50hist1 = [];
bin50hist2 = [];
for i = 1:10
    [binC501 edge] = histcounts(cell_1(i,:), 340);
    [binC502 edge] = histcounts(cell_2(i,:), 340);
    bin50hist1 = [bin50hist1 binC501];
    bin50hist2 = [bin50hist2 binC502];
end
figure(16)
bar(xcov(bin50hist1, bin50hist2, 'coeff'));
title('crosscorrelation 50ms Cell 1 & 2');

% Cell 3 & 4 cross correlation
bin50hist1 = [];
bin50hist2 = [];
for i = 1:10
    [binC501 edge] = histcounts(cell_3(i,:), 340);
    [binC502 edge] = histcounts(cell_4(i,:), 340);
    bin50hist1 = [bin50hist1 binC501];
    bin50hist2 = [bin50hist2 binC502];
end
figure(17)
bar(xcov(bin50hist1, bin50hist2, 'coeff'));
title('crosscorrelation 50ms Cell 3 & 4');

%% Problem 8
% Cell 1 Raster
figure(18);
hold on;
for i = 1:numel(cell_toss(:,1))
    plot(cell_toss(i, :), ones(1, numel(cell_toss(1, :))) * i, "+");
end
ylim([0 11]);
title('Cell Toss Raster');
ylabel('Trial Number');
xlabel('Time (s)');

% Cell toss interspike histogram
figure(19)
histogram(diff(cell_toss, 1, 2), 2500)
title('Cell Toss Interspike Histogram')
xlabel('Difference between sequential spikes (s)')
ylabel('Frequency')

% Peri Graph Cell Toss(50 ms)
peri_cell_toss = [];
for i = 1:340
    foundIndx = find(cell_toss >= (0.05 * (i - 1)) & cell_toss < (0.05 * i));
    peri_cell_toss = [peri_cell_toss, length(foundIndx)];
end
p = (1/.05)*(1/10);
peri_cell_toss * p;
figure(20)
bar(peri_cell_toss)
title('Cell Toss PSTH (50ms)')

% Cell Toss AutoCorrelation 50 ms
bin50hist = [];
for i = 1:10
    [binC50 edge] = histcounts(cell_toss(i,:), 340);
    bin50hist = [bin50hist binC50];
end
figure(21)
bar(xcov(bin50hist, 'coeff'));
title('Autocorrelation 50ms Cell toss');

% Cell 3 & toss cross correlation
bin50hist1 = [];
bin50hist2 = [];
for i = 1:10
    [binC501 edge] = histcounts(cell_3(i,:), 340);
    [binC502 edge] = histcounts(cell_toss(i,:), 340);
    bin50hist1 = [bin50hist1 binC501];
    bin50hist2 = [bin50hist2 binC502];
end
figure(22)
bar(xcov(bin50hist1, bin50hist2, 'coeff'));
title('crosscorrelation 50ms Cell 3 & toss');

% Cell 1 & toss cross correlation
bin50hist1 = [];
bin50hist2 = [];
for i = 1:10
    [binC501 edge] = histcounts(cell_1(i,:), 340);
    [binC502 edge] = histcounts(cell_toss(i,:), 340);
    bin50hist1 = [bin50hist1 binC501];
    bin50hist2 = [bin50hist2 binC502];
end
figure(23)
bar(xcov(bin50hist1, bin50hist2, 'coeff'));
title('crosscorrelation 50ms Cell 1 & toss');

% Cell 2 & toss cross correlation
bin50hist1 = [];
bin50hist2 = [];
for i = 1:10
    [binC501 edge] = histcounts(cell_2(i,:), 340);
    [binC502 edge] = histcounts(cell_toss(i,:), 340);
    bin50hist1 = [bin50hist1 binC501];
    bin50hist2 = [bin50hist2 binC502];
end
figure(24)
bar(xcov(bin50hist1, bin50hist2, 'coeff'));
title('crosscorrelation 50ms Cell 2 & toss');

% Cell 4 & toss cross correlation
bin50hist1 = [];
bin50hist2 = [];
for i = 1:10
    [binC501 edge] = histcounts(cell_4(i,:), 340);
    [binC502 edge] = histcounts(cell_toss(i,:), 340);
    bin50hist1 = [bin50hist1 binC501];
    bin50hist2 = [bin50hist2 binC502];
end
figure(25)
bar(xcov(bin50hist1, bin50hist2, 'coeff'));
title('crosscorrelation 50ms Cell 4 & toss');
