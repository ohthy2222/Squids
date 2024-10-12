function fishHandle = drawFish (radius, xCenter, yCenter, fishColor, fishLineWidth, clock)

% compute tickTok
tickTock = mod(clock,2);

if(tickTock == 0)
mouthAngle = pi/6;
elsemouthAngle = 0;
endif

mouthAngle = pi/6;
circleMatrix = getCircle(radius,mouthAngle);

% get the translation matrix
T = getTranslate(xCenter,yCenter);

% translate the circle
circleMatrix = T*circleMatrix;

% extract the x and y coordinates of the translate...
x = circleMatrix(1,:);
y = circleMatrix(2,:);

x = [x,xCenter,x(1)];
y = [y,yCenter,y(1)];


% circle of radius r about the xCenter, yCenter
fishBodyHandle = line(x,y);

% eating time
if(tickTock ==0)
xMouth = [x(length(x)-teethSize),xCenter,x(teethSize)];
yMouth = [y(length(y)-teethSize), yCenter, y(teethSize)];
else
xMouth = [xCenter,x(1)];
yMouth = [yCenter,y(1)];
endif

fishMouthHandle = line(xMouth,yMouth);

%tail
xTail(1) = x(round(length(x)/2));
yTail(1) = y(round(length(y)/2));

xTail(2) = xTail(1)-radius;
yTail(2) = yTail(1)+radius;

xTail(3) = xTail(1)-radius;
yTail(3) = yTail(1)-radius;

xTail(4) = xTail(1);
yTail(4) = yTail(1);

fishTailHandle = line(xTail,yTail);

fishHandle = [fishBodyHandle,fishMouthHandle,fishTailHandle];
set(fishHandle,'Color',fishColor);
set(fishHandle,'LineWidth',fishLineWidth);




endfunction
