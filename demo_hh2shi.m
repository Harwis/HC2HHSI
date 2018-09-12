% This demo shows how to transfrom a four-dimensional hypercube to the hhsi
% space. 
clear all, close all, clc

% Read RGB-colour and near-infrared images
vis = imread('VIS.png');
nir = imread('NIR.png');
nir = nir(2:965, :); % Make the nir image have the same size as the vis image. 
figure,  
subplot(1, 2, 1), imshow(vis), title('Colour image')
subplot(1, 2, 2), imshow(nir), title('Near-infrared image')

% Catenate the nir and vis images to a four-dimensional hypercube.
hc = cat(3, nir, vis);

% Transfrom the hypercube 'hc' to hhsi sapce
[hyper_hue, saturation, intensity] = hc2hhsi(hc);
figure, 
subplot(2, 3, 1), imshow(hyper_hue(:,:, 1), []), impixelinfo, title('hyper-hue 1')
subplot(2, 3, 2), imshow(hyper_hue(:,:, 2),[]), impixelinfo, title('hyper-hue 2')
subplot(2, 3, 3), imshow(hyper_hue(:,:, 3), []), impixelinfo, title('hyper-hue 3')
subplot(2, 3, 4), imshow(saturation, []), impixelinfo, title('Saturation')
subplot(2, 3, 5), imshow(intensity, []), impixelinfo, title('Intensity')




