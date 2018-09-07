function [hh, sat, int] =  hc2hhsi(hc) 
%Transform an n-dimensional hypercube to hyper-hue, saturation and intensity

% Citation:
% Liu, H., Lee, S., & Chahl, J. (2017). Transformation of a high-dimensional color space for material classification. 
% Journal of the Optical Society of America A, 34(4), 523-532, doi:10.1364/josaa.34.000523.

% Input:  hc: hyperCube (rows x cols x dims) in double or uint8 image format.
% Output: hh: hypHue (rows x cols x (dims-1)) in double image format
%         sat:  saturation (rows x cols) in double image format
%         int:  intensity (rows x cols) in double image format

% Author: Huajian Liu

if isa(hc, 'uint8')
    hc = im2double(hc);
end

%% Calculate the components c
% c(:,:,1) is correpsonding to c1 in the paper, c(:,:,2) is correpsonding to c2 and so on. 
% To speed up, allocate a memory for c.
[rows, cols, dims] = size(hc);
c = zeros(rows, cols, dims-1);
for i = 1:dims - 1
    nonZeroEle = dims + 1 - i; % nonZeroEle is the number of non-zero elements of a base unit vector u1, u2,...
    c(:,:,i) = sqrt(nonZeroEle - 1) / sqrt(nonZeroEle) .* hc(:,:,i) - (1 / (sqrt(nonZeroEle - 1)*sqrt(nonZeroEle))) .* sum( hc(:,:,i+1:dims), 3);
end

%% Normalise the norm of c to 1 to obtain hyper-hue:hh
% Norm of c
c_norm = zeros(rows, cols);
for i = 1:dims - 1
    c_norm = c(:, :, i) .^2 + c_norm;
end
c_norm = sqrt(c_norm);

% Denominator cannot be 0
c_norm = c_norm + (c_norm == 0) .* 1e-10;     
c_norm = repmat(c_norm,[1 1 dims-1]);
hh = c ./ c_norm;

%% Saturation 
sat = max(hc, [], 3) - min(hc, [], 3);

%% Intensity
int = 1/dims .* sum(hc, 3);
end
