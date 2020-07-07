%% �����������������+������ֵ������+ROC
%% goodClassifier
% goodClassifier = load('classifier.mat').goodClassifier;
goodClassifier = getCurveFromPic('goodClassifier.png');

plotCurve(goodClassifier)
nCase = size(goodClassifier,1);

realClass = zeros(nCase,1);
tmp = round(0.8*nCase); % ʵ������80%������
realClass(1:tmp) = 1;

roc_good = plotROC([goodClassifier,realClass]);

%% badClassifier
% badClassifier = load('classifier.mat').badClassifier;
goodClassifier = getCurveFromPic('badClassifier.png');

plotCurve(badClassifier)
nCase = size(badClassifier,1);

realClass = zeros(nCase,1);
tmp = round(0.8*nCase); % ʵ������80%������
realClass(1:tmp) = 1;

roc_bad = plotROC([badClassifier,realClass]);

%% �������ݣ��ڰױ��������⻭����ɫ���ߣ������ͼƬ��������
[file,path] = uigetfile(...
    {'*.png';'*.jpg';'*.jpeg';'*.bmp';'*.*'},'File Selector');
picfile = [path,file];
newClassifier = getCurveFromPic(picfile);
plotCurve(newClassifier)
nCase = size(newClassifier,1);

realClass = zeros(nCase,1);
tmp = round(0.8*nCase); % Ĭ��ǰ80%������
realClass(1:tmp) = 1;

roc = plotROC([newClassifier,realClass]);
