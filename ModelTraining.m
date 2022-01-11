%% Model Training

%% Running Classification Leaner Interface
classificationLearner()
%view(trainedModel1.ClassificationTree,'Mode','graph')

%% About Trained Model
trainedModel;
trainedModelOpt;
save('MyWorkspace','trainedModel')
save('MyWorkspace','trainedModelOpt')