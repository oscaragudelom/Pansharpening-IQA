function q = opinion_aware(image)
load('SS.mat')
load('SVMmodel.mat');
load('features.mat');
dmosGM = sqrt(dmos(1:end/2).*dmos(end/2+1:end));
val = Features_Group(image,'normal+color+norcol');
[~, val, ~] = scaleSVM(features, val, features, 0, 1);
predictedScores = svmpredict(dmosGM, val, bestModel);
q = lognonfun(predictedScores,'fun',bestBeta);
end
