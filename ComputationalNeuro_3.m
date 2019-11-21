%% Walt Tatera 
%% Problem 1
load('data2.mat');
[C,LAGS] = xcov(data(1,:),data(2,:),'coeff');
figure(1)
plot(LAGS*.004,C)
% xlim([-1 1])
xlabel('Time Lag (s)')
title('Channel 1 & 22')

%% Problem 2 blue is first filt, orange is second filt
load('ECoG.mat');
f1 = filtfilt(Num1,1,LFP);
f2 = filtfilt(Num2,1,LFP);
figure(2)
hold on
plot(t,f1)
plot(t,f2)
title('Problem 2')

%% Problem 3 LOOK AT AGAIN
load('mvt_spikes.mat');

figure(3)
hold on
for k = 1:25
    fired = find(left(k,:) == 1);
    for i = 1:numel(fired)
        spike = t(fired(i));
        plot(spike, k, "+k")
    end
end
xline(0, "b");
ylim([0 26]);
xlim([-1001 1000]);
title('Cell Raster Left');
ylabel('Trial Number');
xlabel('Time (ms)');

figure(4)
hold on
for k = 1:25
    fired = find(right(k,:) == 1);
    for i = 1:numel(fired)
        spike = t(fired(i));
        plot(spike, k, "+k")
    end
end
xline(0,"b");
ylim([0 26]);
xlim([-1001 1000]);
title('Cell Raster Right');
ylabel('Trial Number');
xlabel('Time (ms)');

%% Problem 4
%right
sum = 0;
for i = 1:numel(right(:,1))
    sum = sum + numel(find(right(i,(1:1001))));
end
beforeStimRight = sum / 25
sum = 0;
for i = 1:numel(right(:,1))
    sum = sum + numel(find(right(i,(1002:2000))));
end
afterStimRight = sum / 25

%left
sum = 0;
for i = 1:numel(left(:,1))
    sum = sum + numel(find(left(i,(1:1001))));
end
beforeStimLeft = sum / 25
sum = 0;
for i = 1:numel(left(:,1))
    sum = sum + numel(find(left(i,(1002:2000))));
end
afterStimLeft = sum / 25

%% Problem 5

leftTimes = [];
for i = 1:numel(right(:,1))
    for j = 1:numel(right(1,:))
        if right(i,j) == 1
            temp = t(j) / 1000;
            leftTimes = [leftTimes temp];
        end
    end
end
leftTimes = sort(leftTimes);
figure(6)
histogram(leftTimes,-100:.01:100)
xlim([-1 1])
title('Peristimulus Time Histogram Right 10ms bins')
xlabel('Time (ms)')

rightTimes = [];
for i = 1:numel(left(:,1))
    for j = 1:numel(left(1,:))
        if left(i,j) == 1
            temp = t(j) / 1000;
            rightTimes = [rightTimes temp];
        end
    end
end
rightTimes = sort(rightTimes);
figure(7)
histogram(rightTimes,-100:.01:100)
xlim([-1 1])
title('Peristimulus Time Histogram Left 10ms bins')
xlabel('Time (ms)')

%% Problem 6
times = [leftTimes rightTimes];
times = sort(times);
times = times * 1000;
timesBefore = times(1:1949);
timesAfter = times(1949:end);

figure(8)
N = histcounts(timesBefore, -100:0.01:0);
[c, lags] = xcov(N, 'coeff');
plot(lags, c);
title('Before Stim Autocorrelation')
xlabel('Time (ms)')

figure(9)
N = histcounts(timesAfter, 0:0.01:100);
[c, lags] = xcov(N, 'coeff');
plot(lags, c);
title('After Stim Autocorrelation')
xlabel('Time (ms)')
%% Problem 7 flip signs of cx,cy,cz is the answer
bx = 9;
by = 3;
bz = -5;
k = sqrt(bx^2 + by^2 + bz^2);

cx = bx / k;
cy = by / k;
cz = bz / k;
mVec = [-cx, -cy, -cz]
