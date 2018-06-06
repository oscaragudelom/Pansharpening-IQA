function [shape, std] = estimateGGDParamGoodall(vec)
% Gaussian fit based on the moment matching technique described in: K.
% Shari and A. Leon-Garcia, "Estimation of shape parameter for generalized
% gaussian distributions in subband decompositions of video," IEEE
% Transactions on Circuits and Systems for Video Technology, vol. 5, no. 1,
% pp. 52{56, 1995.
%
% Input:
% vec   = vector of NSS coefficients
%
% Output:
% shape = shape parameter (\alpha) of GGD
% std   = standard deviation parameter (\sigma) of GGD

gam = 0.2:0.001:10;
nr_gam = (gamma(1./gam).*gamma(3./gam))./((gamma(2./gam)).^2);

variance = mean(vec.^2);
std = sqrt(variance);

rho = variance/(mean(abs(vec)))^2;
[~, array_position] = min((nr_gam - rho).^2);
shape  = gam(array_position);