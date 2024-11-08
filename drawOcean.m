function [oceanHeight,oceanWidth] = drawOcean (imageName)
% drawOcean take the name of an image as its argument
% and returns the height and width of the image


% clear figures
clf;

% create the new game figure
figure(1);

% read the background image
image = imread(imageName);

% get the size of the image
[oceanHeight,oceanWidth]=size(image);

% display the image
imshow(imageName);

% give the game a title
title("Squids", 'FontSize', 30)

% set listeners for keyboard and mouse
set(gcf, 'KeyPressFcn', @(src, event)keypress_callback(src,event));
##set(gcf, 'WindowButtonMotionFcn', @(src, event) mouseMotion_callback(src,event));

endfunction
