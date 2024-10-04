function [replaceImageHeight,replaceImageWidth] = drawReplaceImage (imageName)

 replaceImageSize = 50;

 hold on

% read the background image
image = imread(imageName);

% get the size of the image
  [replaceImageHeight,replaceImageWidth] = size(image);

% display the image
imshow(imageName);



endfunction
