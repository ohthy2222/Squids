function circleHandle = drawCircle (radius,xCenter,yCenter,circleColor,circleLineWidth)

% get the points of circle
circleMatrix = getCircle(radius,0);

% bring in the big guns (getTranslate)
T = getTranslate(xCenter,yCenter);

% translated circle
circleMatrix = T*circleMatrix;

x = circleMatrix(1,:);
y = circleMatrix(2,:);

circleHandle = line(x,y);
set(circleHandle,'Color',circleColor);
set(circleHandle,'LineWidth',circleLineWidth);
endfunction
