function plot_curve(f)
%% 概率曲线f
% f = getCurveFromPic;
% f = getCurveFromPic('goodClassifier');
% f = getCurveFromPic('badClassifier');

nCase = length(f);
figure('Color','w');
plot(f,'Color',[1,1,1]*0.5,'LineWidth',1.2);
xlabel('Case')
ylabel('Signal(Probability)')
hold on

%% 给定阈值，画出阈值线
t = [0.9,0.7,0.2,0.02]; % 给定几个典型阈值
% 循环颜色
colormap = jet;
tmp = round(linspace(1,length(colormap),length(t)+1));
colormap = colormap(tmp(1:end-1),:);
for ii = 1:length(t)
    plot(t(ii)*ones(nCase,1),'--','Color',colormap(ii,:),'LineWidth',1)
    text(length(f)+10,t(ii),['t_',num2str(ii)])
    hold on
end
% title('模型得到的概率和几种不同的阈值位置')


%% 识别曲线g
figure('Color','w');
% 真实情况也可以画
realClass = zeros(nCase,1);
tmp = round(0.8*nCase); % 实际上有80%的阳性
realClass(1:tmp) = 1;
subplot(length(t)+1,1,1);
plot(realClass,'k','LineWidth',2);
ylabel('Reality')

g = zeros(length(f),length(t));
for ii = 1:length(t)
    pos = f>t(ii);
    g(pos,ii) = 1;
    subplot(length(t)+1,1,ii+1);
    plot(g(:,ii),'Color',colormap(ii,:),'LineWidth',2);
    ylabel(['t_',num2str(ii)])
end
xlabel('Case')
% title('设置不同阈值时的识别结果')
% text(length(f)/2-120,1.6*(length(t)+1),'设置不同阈值时的识别结果')

