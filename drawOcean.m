function [height,width] = drawOcean (imageName)
% drawOcean take the name of an image as its argument
% and returns the height and width of the image


% clear figures
clf;

% create the new game figure
figure(1);

% read the background image
image = imread(imageName);

% get the size of the image
[height,width]=size(image);

% display the image
imshow(imageName);



endfunction
