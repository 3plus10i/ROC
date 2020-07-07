function plot_curve(f)
%% ��������f
% f = getCurveFromPic;
% f = getCurveFromPic('goodClassifier');
% f = getCurveFromPic('badClassifier');

nCase = length(f);
figure('Color','w');
plot(f,'Color',[1,1,1]*0.5,'LineWidth',1.2);
xlabel('Case')
ylabel('Signal(Probability)')
hold on

%% ������ֵ��������ֵ��
t = [0.9,0.7,0.2,0.02]; % ��������������ֵ
% ѭ����ɫ
colormap = jet;
tmp = round(linspace(1,length(colormap),length(t)+1));
colormap = colormap(tmp(1:end-1),:);
for ii = 1:length(t)
    plot(t(ii)*ones(nCase,1),'--','Color',colormap(ii,:),'LineWidth',1)
    text(length(f)+10,t(ii),['t_',num2str(ii)])
    hold on
end
% title('ģ�͵õ��ĸ��ʺͼ��ֲ�ͬ����ֵλ��')


%% ʶ������g
figure('Color','w');
% ��ʵ���Ҳ���Ի�
realClass = zeros(nCase,1);
tmp = round(0.8*nCase); % ʵ������80%������
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
% title('���ò�ͬ��ֵʱ��ʶ����')
% text(length(f)/2-120,1.6*(length(t)+1),'���ò�ͬ��ֵʱ��ʶ����')

