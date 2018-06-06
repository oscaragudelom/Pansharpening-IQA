function [shape, meanparam, betal, betar, leftstd, rightstd] = estimateAGGDParamGoodall(vec)
% Assymetric gaussian fit based on the moment matching technique described
% in: K. Shari and A. Leon-Garcia, "Estimation of shape parameter for
% generalized gaussian distributions in subband decompositions of video,"
% IEEE Transactions on Circuits and Systems for Video Technology, vol. 5,
% no. 1, pp. 52{56, 1995.
%
% Input:
% vec       = vector of NSS coefficients
%
% Output:
% shape     = shape parameter (v) of AGGD
% meanparam = mean parameter (\eta) of AGGD
% betal     = \beta_l parameter of AGGD
% betar     = \beta_r parameter of AGGD
% leftstd   = left standard deviation parameter (\sigma_l) of AGGD
% rightstd  = right standard deviation parameter (\sigma_r) of AGGD

vec2 = vec.^2;
% get left and right parts of coefficients
left_vec2 = vec2(vec<0);
right_vec2 = vec2(vec>0);

gam   = 0.2:0.001:10;
r_gam = ((gamma(2./gam)).^2)./(gamma(1./gam).*gamma(3./gam));

leftvar            = mean(left_vec2);
leftstd            = sqrt(leftvar);
rightvar           = mean(right_vec2);
rightstd           = sqrt(rightvar);
variance           = mean(vec.^2);

gammahat           = leftstd/rightstd;
rhat               = (mean(abs(vec)))^2/variance;
rhatnorm           = (rhat*(gammahat^3 +1)*(gammahat+1))/((gammahat^2 +1)^2);
[~, array_position] = min((r_gam - rhatnorm).^2);
shape              = gam(array_position);

gam1 = gamma(1/shape); gam2 = gamma(2/shape); gam3 = gamma(3/shape);
aggdratio = sqrt(gam1/gam3);

betal              = leftstd*aggdratio;
betar              = rightstd*aggdratio;

meanparam          = (betar - betal)*(gam2/gam1);