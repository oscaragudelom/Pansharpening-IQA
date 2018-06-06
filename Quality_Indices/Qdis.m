function res=Qdis(fused,pristineModel,m)
% Dependencies:
% - To compute steerable pyramid coefficients: matlabPyrTools.
%   Available: http://www.cns.nyu.edu/lcv/software.php
% - To compute MVG model: EmGm.
%   Available: http://www.mathworks.com/matlabcentral/fileexchange/26184-em-algorithm-for-gaussian-mixture-model--em-gmm-
%
% Input:
% fused            = fused image whose quality needs to be computed
% pristineModel    = MVG NSS-feature model
% group (optional) = groups of NSS-features to be computed from the
% fused image, by default it computes all NSS-features. Note: the number of
% features must be the same as the pristine model's
% 
% Output:
% res              = quality of input fused image. Higher values indicate
% worse quality.

% Take default group of features

% Get the Covariance matrix and Mean vector of the pristine model
cov_prisparam = pristineModel.Sigma;
mu_prisparam = pristineModel.mu;

% compute image features

features = Features_Group( fused ,m);
% get model of fused image
[~,model,~] = mixGaussEm(struct2array(features)',1);
cov = model.Sigma;
mu = model.mu;

% calculate Mahalanobis distance
invcov_param = pinv((cov_prisparam + cov)/2);
res = sqrt((mu_prisparam - mu)'*invcov_param*(mu_prisparam - mu));