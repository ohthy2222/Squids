function animateSquid ()

oceanImage = "OceanImage.png";
birdImage = "SmallBird.png";
orangethImage = "OrangethOwens.png";
greenethHeadImage = "GreenethHead.png";
[oceanHeight, oceanWidth] = drawOcean(oceanImage);
## [owensHeight,owensWidth] = drawOwens (greenethHeadImage);

##% player params
##playerX = round (oceanWidth/2);
##playerY = round (oceanHeight/2);
##playerTheta = 0;
##playerBodySize = 100;
##playerHeadSize = 30;
##netSize = 20;
##playerColor = [0 0 1];
##playerLineWidth = 2;
##
##playerHandle = drawPlayer (playerX, playerY, playerTheta,
##                              playerBodySize, playerHeadSize, netSize,
##                              playerColor, playerLineWidth);

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

  % Owens time
  xOwens = 100;
  yOwens = 100;
% Speed of movement
  xOwensSpe = 25;
  yOwensSpe = 1;

  [owensHeight, owensWidth, owensHandle] = drawOwens(greenethHeadImage, xOwens, yOwens);

  % original parameters
  toggleState = false;
  squidHandle = []; % squid's here right now

  % keyboard being called
  set(gcf, 'KeyPressFcn', @keyPressed);

  isRunning = true; % keep the loop running

 ## owensHandle = imshow(greenethHeadImage, 'XData', [xOwens, xOwens + size(greenethHeadImage, 2)], 'YData', [yOwens, yOwens + size(greenethHeadImage, 1)]); % draw moment
  % time to animate
% ---------------------------------- animate loop --------------------------------------------
  clock = 1; % give clock a starting value
  while isRunning && clock <= 500
hold on; % keep axises and plots for everything
% --------------------fish stuff----------------------------------------
  % move fish
  fishX = fishX + fishForwardMove;


  % check fish
  [fishX,fishY] = checkBoundary(fishX,fishY,oceanWidth,oceanHeight,fishRadius);

    % draw fish
 fishHandle = drawFish(fishRadius, fishX, fishY, fishColor, fishLineWidth);

% --------------------squid stuff----------------------------------------
% rotate by theta radians
squidPoints = getSquid(squidSize, clock);
R = getRotate(squidTheta);
squidRotated = R*squidPoints;
squidX = squidX + squidForwardMove*cos(squidTheta);
squidY = squidY + squidForwardMove*sin(squidTheta);
squidX = squidX + squidForwardMove;


squidTheta = squidTheta + squidDeltaTheta;

%check squid
  [squidX,squidY] = checkBoundary (squidX,squidY,oceanHeight,oceanWidth,2*squidSize);

% GREENETH BECOMETH SQUIDDETH
xOwens = squidX;
yOwens = squidY;

  % toggle the squid on
if toggleState
  if ~isempty(squidHandle) && ishandle(squidHandle)
        delete(squidHandle);
        squidHandle = [];
  endif
  set(owensHandle, 'Visible', 'on');
  set(owensHandle, 'XData', [xOwens, xOwens + owensWidth], 'YData', [yOwens, yOwens + owensHeight]);
else
  if isempty(squidHandle) || ~ishandle(squidHandle)
    squidHandle = drawSquid(squidSize, squidColor, squidWidth, clock, squidX, squidY, squidTheta);;
  else
        for i = 1:length(squidHandle)
          set(squidHandle(i), 'XData', squidRotated(1,:) + squidX, 'YData', squidRotated(2,:) + squidY);
        endfor
  endif
  set(owensHandle,'Visible','off');
   % rotate parameters, start'r up
## else
## Insert Greeneth toggles
endif
##R = getRotate(squidTheta);
##
##% rotate the squid again
##squid = getSquid(squidSize, clock);
##squidTheta = squidTheta + squidDeltaTheta;
##squid = R*squid;
##squidNewX = squidX + 2*squidForwardMove*cos(squidTheta);
##squidNewY = squidY + 2*squidForwardMove*sin(squidTheta);

%-------------------OWENS---------------------------------------------------

##
##  % Hide and seek squid
##  if ~isempty(squidHandle)
##    delete(squidHandle);
##    squidHandle = [];
##  endif

% checketh greeneth

% CALLETH FORTHETH THE GREENETH
##[owensHeight, owensWidth, owensHandle] = drawOwens(greenethHeadImage, xOwens, yOwens);
##set(owensHandle, 'XData', [xOwens, xOwens + owensWidth], 'YData', [yOwens, yOwens + owensHeight]);

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
% make all of the objects appear again
 drawnow;


 pause(.1);

% we have to increment the clock manually, or else the code freezes every time we toggle between images
clock = clock + 1;

delete(circleHandle);
delete(fishHandle);
  if ~isempty(squidHandle) && ishandle(squidHandle)
    delete(squidHandle);
  endif

endwhile

  % calleth the keyeth func
  function keyPressed(~,event)
    if strcmp(event.Key, 'k') % press the 'k' button on the keyboard to toggle
      toggleState = ~toggleState; % switcheth squideth and greeneth
    elseif strcmp(event.Key, 'escape')
      isRunning = false; % stop the animation
    endif
  endfunction

endfunction
