function animateSquid ()


imageName = "OceanImage.png";
[oceanHeight, oceanWidth] = drawOcean(imageName);

  squidColor = [.2 .1 .6];
  squidWidth = 4;
  squidSize = 50;

  % bubbles
  numBubbles = 3;
  bubbleMaxRadius = 20;
  bubbleMinRadius = 5;
maxRadius = oceanHeight;
 radius = maxRadius*rand();
 bubbleColor = [.2, .1, .7]
 bubbleLineWidth = 3
 bubbleStep = 50;

  for i = 1: numBubbles

    bubbleRadius(i) = rand()*bubbleMaxRadius + bubbleMinRadius;
    bubbleX(i) = rand() * oceanWidth;
    bubbleY(i) = oceanHeight;

  endfor

 % circle definitions (for the bubble)

  radius = 20;
  xCenter = 500;
  yCenter = 1000;
  circleColor = [.2 .1 .7];
  circleLineWidth = 5;
  DyCircle = 50;

  % time to animate

  Dx=500;
  Dy=400;
% ---------------------------------- animate loop --------------------------------------------
  for( clock = 1:500)

  [Dx , Dy] = checkBoundary (Dx,Dy,oceanHeight,oceanWidth,2*squidSize);
   [xCenter , yCenter] = checkBoundary (Dx,Dy,oceanHeight,oceanWidth,radius);

  yCenter = yCenter - DyCircle;

Dx = (Dx + 20);

% turn
squidTehta = squidTheta + squidDeltaTheta;
Dx = Dx + squidForwardMove*cos(squidTheta);
Dy = Dy + squidForwardMove*cos(squidTheta);

   squidHandle = drawSquid(squidSize,squidColor,squidWidth,clock,Dx,Dy);

   for i = 1: numBubbles

   circleHandle(i) = drawCircle(bubbleRadius(i),bubbleX(i),bubbleY(i),bubbleColor,bubbleLineWidth);
    bubbleX(i) = rand() * oceanWidth;
    bubbleY(i) = rand() * oceanHeight;

endfor

% create more bubbles

  for i = 1: numBubbles

   bubbleY(i) = bubbleY(i)-bubbleStep;

endfor

% make sure bubbles stay in boundaries
  for i = 1: numBubbles

   [bubbleX,bubbleY] = checkBoundary (Dx,Dy,oceanHeight,oceanWidth,radius);

endfor


if (yCenter - 2*radius < 0)
  yCenter = oceanHeight - 2*radius;

  endif


pause(.05);
delete(squidHandle);


for i = 1: numBubbles

   delete(circleHandle(i));

  endfor

  endfor




endfunction
