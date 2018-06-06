function F = Features_Group( I ,group1)
[~,~,L,K]=size(I);
if nargin == 1
    group1 = 'normal';
end
for k = 1:K
        t=[];
        tc=[];
        if contains(group1,'color') || contains(group1,'norcol')
            Cimage = normalize(chromams(I(:,:,:,k)));
            ChromaGoodallFeats1 = computeGoodallFeatures(Cimage(:,:,1));
            ChromaGoodallFeats2 = computeGoodallFeatures(Cimage(:,:,2));
            tc = [ChromaGoodallFeats1' ChromaGoodallFeats2'];
        end
        if contains(group1,'normal') || contains(group1,'norcol')
            for l = 1:L
                GoodallFeats = computeGoodallFeatures(I(:,:,l,k));
                t = [t GoodallFeats'];
            end
        end
        if contains(group1,'normal')
            F.normal(k,:) = t;
        end
        if contains(group1,'color')
            F.color(k,:) = tc;
        end
        if contains(group1,'norcol')
            F.norcol(k,:) = [t tc];
        end
        
end
end

