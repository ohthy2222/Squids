function animateSquid ()


oceanImage = "OceanImage.png";
birdImage = "SmallBird.png";
##orangethImage = "OrangethreplaceImage.png";
[oceanHeight, oceanWidth] = drawOcean(oceanImage);
[replaceImageHeight, replaceImageWidth] = drawReplaceImage(birdImage);
##[replaceImageHeight, replaceImageWidth] = drawReplaceImage(orangethImage)

% squid creation
  squidColor = [.2 .1 .6];
  squidWidth = 4;
  squidSize = 50;
 % squid movement
  squidDeltaTheta = pi/2;
  squidForwardMove = 100;

  % starting squid location
  squidX=500;
  squidY=400;
  squidTheta = 0;

  % bubble creation
  numBubbles = 3;
  bubbleMaxRadius = 20;
  bubbleMinRadius = 5;
maxRadius = oceanHeight;
 bubbleColor = [.2, .1, .7];
 bubbleLineWidth = 3;
 bubbleStep = 50;

  for i = 1: numBubbles

    bubbleRadius(i) = rand()*bubbleMaxRadius + bubbleMinRadius;
    bubbleX(i) = rand() * oceanWidth;
    bubbleY(i) = oceanHeight;

  endfor

   %create fish
  fishX = 200;
  fishY = 500;
  fishRadius = 50;
  fishForwardMove = 100;
  fishColor = [1, 0, 0];
  fishLineWidth = 3;

  % time to animate
% ---------------------------------- animate loop --------------------------------------------
  for( clock = 1:500)

% --------------------fish stuff----------------------------------------
  % move fish
  fishX = fishX + fishForwardMove;


  % check fish
  [fishX,fishY] = checkBoundary(fishX,fishY,oceanWidth,oceanHeight,fishRadius);

    % draw fish
 fishHandle = drawFish(fishRadius, fishX, fishY, fishColor, fishLineWidth);

% --------------------squid stuff----------------------------------------

theta = squidTheta;
R = getRotate(squidTheta);

% rotate by theta radians
squid = getSquid(squidSize, clock);
squidTheta = squidTheta + squidDeltaTheta;
squid = R*squid;
squidX = squidX + 2*squidForwardMove*cos(squidTheta);
squidY = squidY + 2*squidForwardMove*sin(squidTheta);


% move squid
squidX = (squidX + squidForwardMove);

%check squid
  [squidX,squidY] = checkBoundary (squidX,squidY,oceanHeight,oceanWidth,2*squidSize);

   squidHandle = drawSquid(squidSize,squidColor,squidWidth,clock,squidX,squidY,squidTheta);

% --------------------bubble stuff-----------------------------------------
   % move bubbles
   for i = 1: numBubbles

     bubbleY(i) = bubbleY(i) - rand()*bubbleStep;

   endfor

   % check bubble
 for i = 1: numBubbles
 [bubbleX(i) , bubbleY(i)] = checkBoundary (bubbleX(i),bubbleY(i),oceanHeight,oceanWidth,bubbleRadius(i));

endfor

% draw bubbles
   for i = 1: numBubbles

   circleHandle(i) = drawCircle(bubbleRadius(i),bubbleX(i),bubbleY(i),bubbleColor,bubbleLineWidth);

endfor


pause(.05);
delete(squidHandle);
delete(circleHandle);
delete(fishHandle);

  endfor

endfunction
