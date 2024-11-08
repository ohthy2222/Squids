function animateSquid ()

% global params
global cmd;
global mouseCmd;
global playerX;
global playerY;

oceanImage = "OceanImage.png";
birdImage = "SmallBird.png";
orangethImage = "OrangethOwens.png";
greenethHeadImage = "GreenethHead.png";
[oceanHeight, oceanWidth] = drawOcean(oceanImage);
## [owensHeight,owensWidth] = drawOwens (greenethHeadImage);

% command param
cmd = "null";
mouseCmd = "null";

oceanClock = 0;

% player params
playerX = round(oceanWidth/2);
playerY = round(oceanHeight/2);
playerTheta = 0;
playerBodySize = 100;
playerHeadSize = 30;
netSize = 20;
playerColor = [0 0 1];
playerLineWidth = 2;
playerSpearX = 0;
playerSpearY = 0;
playerHealth = 100;

% squid creation
  squidColor = [.2 .1 .6];
  squidStripeColor = [0 1 0];
  squidWidth = 4;
  squidSize = 50;
 % squid movement
  squidDeltaTheta = pi/2;
  squidForwardMove = 100;

  % starting squid location
  squidX=500;
  squidY=400;
  squidTheta = 0;

  %squid caught
  squidCaught = 0;
  totalSquidsCaught = 0; % the total number of squids

  % text spots
  healthStatusLocation = [100, 200];
  squidsCaughtLocation = [100, 125];
  healthBarRed = [1, 0, 0];

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
  fishBiteDamage = 10;

  % Owens time
  xOwens = 100;
  yOwens = 100;
% Speed of movement
  xOwensSpe = 25;
  yOwensSpe = 1;

##  [owensHeight, owensWidth, owensHandle] = drawOwens(greenethHeadImage, xOwens, yOwens);

  % original parameters
  toggleState = false;
  squidHandle = []; % squid's here right now

  % keyboard being called
 ## set(gcf, 'KeyPressFcn', @keyPressed);

  isRunning = true; % keep the loop running

 ## owensHandle = imshow(greenethHeadImage, 'XData', [xOwens, xOwens + size(greenethHeadImage, 2)], 'YData', [yOwens, yOwens + size(greenethHeadImage, 1)]); % draw moment
  % time to animate
% ---------------------------------- animate loop --------------------------------------------
 while (true) % run forever
##  while isRunning && clock <= 500
hold on; % keep axises and plots for everything
oceanClock = oceanClock + 1; % give clock a starting value

% let the game end
    if (cmd == "q" || playerHealth <=0)
      if(cmd == "q")
        disp("Quitting ...");
      else
       text(oceanWidth/2, oceanHeight/2, "Game Over!!!", 'FontSize', 80, 'Color', healthBarRed);
      endif
      pause(2);
      close();
      break;
    endif

% change health and catch status
myMessage = strcat('Health', ' ');
healthStatusMessage = strcat(myMessage, num2str(playerHealth));
healthHandle = text(healthStatusLocation(1), healthStatusLocation(2), healthStatusMessage, 'FontSize', 20, 'Color', healthBarRed);
catchStatusMessage = strcat('Squids Caught ', num2str(totalSquidsCaught));
squidsCaughtHandle = text(squidsCaughtLocation(1), squidsCaughtLocation(2), catchStatusMessage, 'FontSize', 20, 'Color', healthBarRed);

% Move Player
if(cmd == "a" || cmd == "d" || cmd == "w" || cmd == "s")
[playerX, playerY, playerTheta] = movePlayer (playerX, playerY, playerTheta, cmd);
endif


%---------------------player stuff--------------------------------------
% Draw Player
[playerHandle, playerSpearX, playerSpearY] = drawPlayer (playerX, playerY, playerTheta, playerBodySize, playerHeadSize, netSize, playerColor, playerLineWidth, oceanClock);

squidCaught = isSquidCaught(playerSpearX, playerSpearY, squidX, squidY, squidSize)

% check if the squid has to be caught
if(squidCaught == 1)
  totalSquidsCaught = squidCaught + 1;
  squidCaught = 0;
  squidX = squidSize*2;
  squidY = 2*squidSize + squidForwardMove + rand*(oceanHeight - 4*squidSize - squidForwardMove);
  squidColor = [rand rand rand];
  stripeColor = [rand rand rand];
  squidStripeColor = stripeColor;
endif

##if(squidCaught == 0)
##  squidCaught = isSquidCaught(playerSpearX, playerSpearY, squidX, squidY, squidSize)
##endif

% command back to null
cmd = "null";
% --------------------fish stuff----------------------------------------
  % move fish
  fishX = fishX + fishForwardMove;


  % check fish
  [fishX, fishY] = checkFishBoundary(fishX,fishY,oceanWidth,oceanHeight,fishRadius);

    % draw fish
 fishHandle = drawFish(fishRadius, fishX, fishY, fishColor, fishLineWidth);

 % is player bitten
 playerBitten = isPlayerBitten(playerX, playerY, fishX, fishY, playerBodySize);

  if(playerBitten == 1)
   playerHealth = playerHealth - fishBiteDamage;
  endif

 if(squidCaught == 0)
% --------------------squid stuff----------------------------------------
% rotate by theta radians
squidPoints = getSquid(squidSize, oceanClock);
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

% draw squid
squidHandle = drawSquid(squidSize, squidColor, squidStripeColor, squidWidth, oceanClock, squidX, squidY, squidTheta);

  % toggle the squid on
##  if toggleState
##    if ~isempty(squidHandle) && ishandle(squidHandle)
##        delete(squidHandle);
##        squidHandle = [];
##    endif
##    set(owensHandle, 'Visible', 'on');
##    set(owensHandle, 'XData', [xOwens, xOwens + owensWidth], 'YData', [yOwens, yOwens + owensHeight]);
##  else
##    if isempty(squidHandle) || ~ishandle(squidHandle)
##    squidHandle = drawSquid(squidSize, squidColor, squidWidth, oceanClock, squidX, squidY, squidTheta);
##    else
##          for i = 1:length(squidHandle)
##            set(squidHandle(i), 'XData', squidRotated(1,:) + squidX, 'YData', squidRotated(2,:) + squidY);
##          endfor
##    endif
##  set(owensHandle,'Visible','off');
##   % rotate parameters, start'r up
#### else
#### Insert Greeneth toggles
##  endif
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

 pause(0.03);

% we have to increment the clock manually, or else the code freezes every time we toggle between images
oceanClock = oceanClock + 1;

delete(squidHandle);

delete(playerHandle);
delete(circleHandle);
delete(fishHandle);



endwhile

##  % calleth the keyeth func
##  function keyPressed(~,event)
##    if strcmp(event.Key, 'k') % press the 'k' button on the keyboard to toggle
##      toggleState = ~toggleState; % switcheth squideth and greeneth
##    elseif strcmp(event.Key, 'escape')
##      isRunning = false; % stop the animation
##    endif
##  endfunction

endfunction
