%% 分类器输出概率曲线+几种阈值分类结果+ROC
%% goodClassifier
% goodClassifier = load('classifier.mat').goodClassifier;
goodClassifier = getCurveFromPic('goodClassifier.png');

plotCurve(goodClassifier)
nCase = size(goodClassifier,1);

realClass = zeros(nCase,1);
tmp = round(0.8*nCase); % 实际上有80%的阳性
realClass(1:tmp) = 1;

roc_good = plotROC([goodClassifier,realClass]);

%% badClassifier
% badClassifier = load('classifier.mat').badClassifier;
goodClassifier = getCurveFromPic('badClassifier.png');

plotCurve(badClassifier)
nCase = size(badClassifier,1);

realClass = zeros(nCase,1);
tmp = round(0.8*nCase); % 实际上有80%的阳性
realClass(1:tmp) = 1;

roc_bad = plotROC([badClassifier,realClass]);

%% 任意数据（在白背景上随意画出黑色曲线，保存成图片读进来）
[file,path] = uigetfile(...
    {'*.png';'*.jpg';'*.jpeg';'*.bmp';'*.*'},'File Selector');
picfile = [path,file];
newClassifier = getCurveFromPic(picfile);
plotCurve(newClassifier)
nCase = size(newClassifier,1);

realClass = zeros(nCase,1);
tmp = round(0.8*nCase); % 默认前80%是阳性
realClass(1:tmp) = 1;

roc = plotROC([newClassifier,realClass]);
