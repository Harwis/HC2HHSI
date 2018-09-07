clear all, close all, clc
vis = imread('VIS.png');
nir = imread('NIR.png');
nir = imresize(nir, [964, 1296]);
figure,  
subplot(1, 2, 1), imshow(vis), title('Colour image')
subplot(1, 2, 2), imshow(nir), title('Near-infrared image')

hc = cat(3, vis, nir);
[hyper_hue, saturation, intensity] = hc2hhsi(hc);
figure, 
subplot(2, 3, 1), imshow(hyper_hue(:,:, 1), []), impixelinfo, title('hyper-hue 1')
subplot(2, 3, 2), imshow(hyper_hue(:,:, 2),[]), impixelinfo, title('hyper-hue 2')
subplot(2, 3, 3), imshow(hyper_hue(:,:, 3), []), impixelinfo, title('hyper-hue 3')
subplot(2, 3, 4), imshow(saturation, []), impixelinfo, title('Saturation')
subplot(2, 3, 5), imshow(intensity, []), impixelinfo, title('Intensity')

disp('hh1:')
max(max(hyper_hue(:,:, 1)))
disp('hh2:')
max(max(hyper_hue(:,:, 2)))
disp('hh3:')
max(max(hyper_hue(:,:, 3)))
disp('sat:')
max(max(saturation))
disp('int:')
max(max(intensity))


%%
% imwrite(hyper_hue(:,:,1), 'hyper_hue1.png')
% imwrite(hyper_hue(:,:,2), 'hyper_hue2.png')
% imwrite(hyper_hue(:,:,3), 'hyper_hue3.png')
% imwrite(saturation, 'saturation.png' )
% imwrite(intensity, 'intensity.png')



