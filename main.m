%% main
close all
clear all
clc
%% Extract Data From Original Table
DataExtraction;

figure(1)
hold on
x1 = NumData(:,1);
x2 = NumData(:,2);
x3 = NumData(:,3);
x4 = NumData(:,4);
x5 = NumData(:,5);
x6 = NumData(:,6);
x7 = NumData(:,7);
x8 = NumData(:,8);
x9 = NumData(:,9);

plot(x1,x2,'b')
plot(x1,x3,'r')
plot(x1,x4,'g')
plot(x1,x5,'b--')
plot(x1,x6,'r--')
plot(x1,x7,'g--')
plot(x1,x8,'b-.')
plot(x1,x9,'r-.')

legend('x2','x3','x4','x5','x6','x7','x8','x9')
grid on

hold off
%% Run Initial Tree

InitialTree %dtree = Decision Tree
view(dtree,'mode','graph') %View Decision Tree
view(dtree,'mode','text') %View Decision Tree
%% Run trainClassifier (Exported as Function)

[trainedClassifier, validationAccuracy] = trainClassifier(NumData,target)
view(trainedClassifier.ClassificationTree,'Mode','graph')

%% Load trainModel (Exported as Model)
load('MyWorkspace','trainedModel');
view(trainedModel.ClassificationTree,'Mode','graph')

%% Evaluating New Data
%To make predictions on a new predictor column matrix, X: 
%yfit = trainedModel.predictFcn(X) 
EvaluatingNewData;

