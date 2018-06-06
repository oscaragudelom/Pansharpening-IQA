function chroma = chromams( MS )
lab=convertRGBToLAB(MS(:,:,3:-1:1));
% Get the A and B components of the LAB color space.
A = double(lab(:,:,2));
B = double(lab(:,:,3));
% Compute the chroma map.
chroma(:,:,1) = sqrt(A.*A + B.*B);
lab=convertRGBToLAB(MS(:,:,4:-1:2));
% Get the A and B components of the LAB color space.
A = double(lab(:,:,2));
B = double(lab(:,:,3));
% Compute the chroma map.
chroma(:,:,2) = sqrt(A.*A + B.*B);
end

