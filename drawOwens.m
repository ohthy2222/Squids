function [owensHeight,owensWidth, owensHandle] = drawOwens (imageName, xOwens, yOwens)
##% parameter moment
##figure(1);

% read the image
img = imread(imageName);
imgScalar = 0.1;
img = imresize(img, imgScalar);
hold on; % keep that background image up bro

% initial position of image including the x- and y-data
owensHandle = image('CData', img, 'XData', [0 size(img, 2)], 'YData', [0 size(img, 1)]);

% get the size of the image
  [owensHeight,owensWidth, ~] = size(img);

##% display the image
##imshow(imageName);
##hold on;

##for time = 1:500
##% current x- and y-data
##originalXData = get(owensHandle, 'XData');
##originalYData = get(owensHandle, 'YData');
##
##% change data from above
##newXData = originalXData + xOwensSpe;
##newYData = originalYData + yOwensSpe;
##
##% now use that to change the position of image
##set(owensHandle, 'XData', newXData, 'YData', newYData);
##
##pause(0.1);
##end
##
##hold off;

endfunction
