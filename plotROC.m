%% ���������������ROC��
function ROC = plotROC(data)
% data : n x 2����
%   ��һ������ʵ��ǩ��0-���ԣ�1-���ԣ��ڶ����Ƿ��������������[0,1]

nCase = size(data,1);
rp = sum(data(:,2));% ��ʵ��������
rn = nCase - rp;% ��ʵ��������
%  f<t������,f>=t������
data = sortrows(data,1,'descend');

%     % ԭʼ��
% TP = 0;
% FP = 0;
% ROC = zeros(nCase,2);
% for ii = 1:nCase
% %     t = data(ii,1); % ��ֵɨ��ֻ�����ݵ���������
%     pp = ii ;% Ԥ������������[1,ii]
%     pn = nCase - ii ;% Ԥ������������[ii+1,nCase]
% %     TP = sum(data(1:ii,2));
%     TP = TP + data(ii,2);
% %     FP = sum(~data(1:ii,2));
%     FP = pp - TP;
%     TPR = TP/rp;
%     FPR = FP/rn;
%     ROC(ii,:) = [FPR,TPR];
% end

%     % ѹ����
ROC = zeros(nCase+1,2);
for ii = 1:nCase
    if data(ii,2)
        ROC(ii+1,1) = ROC(ii,1);
        ROC(ii+1,2) = ROC(ii,2) + 1;
    else
        ROC(ii+1,1) = ROC(ii,1) + 1;
        ROC(ii+1,2) = ROC(ii,2);
    end
end
ROC = ROC/diag([rn,rp]);
AUC = calcAUC(ROC);

figure('Color','w');
plot(ROC(:,1),ROC(:,2));
hold on
plot([0:0.1:1]',[0:0.1:1]','--','Color',[1,1,1]*0.5)
axis equal
xlim([-0.02,1.02]) 
ylim([-0.02,1.02])
grid on
xlabel('FPR')
ylabel('TPR')
title(['ROC  (AUC = ',num2str(AUC),' )'])

end

function AUC = calcAUC(ROC)
AUC = 0;
for ii = 1:size(ROC,1)-1
    AUC = AUC + abs(diff(ROC(ii+[0,1],1)))*mean(ROC(ii+[0,1],2));
end
end