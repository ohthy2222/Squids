function bombHandle = drawBombs (radius,xCenter,yCenter,bombColor,bombLineWidth)

% get the points of circle
circleMatrix = getCircle(radius,0);

% bring in the big guns (getTranslate)
T = getTranslate(xCenter,yCenter);

% translated circle
circleMatrix = T*circleMatrix;

x = circleMatrix(1,:);
y = circleMatrix(2,:);

bombHandle(1) = line(x,y);
set(bombHandle,'Color',bombColor);
set(bombHandle,'LineWidth',bombLineWidth);

bombHandle(2) = patch(x, y, bombColor);
endfunction
