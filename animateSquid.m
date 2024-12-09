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

% get the level of the game
  level = getLevel();
  squids = level;

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
  squidsCaught = 0;
##  totalSquidsCaught = 0; % the total number of squids

  % text spots
  healthStatusLocation = [100, 200];
  squidsCaughtLocation = [100, 125];
  healthBarRed = [1, 0, 0];
  % help message creation
  helpMessageX = 800;
  helpMessageY = 800;
  helpMessageColor = [1,1,1];

  % bomb creation
  numBombs = 4;
  bombRadius = 30;
  bombColor = [0, 0, 0];
  bombLineWidth = 3;
  bombStep = 50;

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
  fishTeethX = 0;
  fishTeethY = 0;
  fishBiteDamage = 10; %amount deducted from player's health when bitten
  fishStunTime = 10;
  fishStunTimer = 0;
  fishGotStunned = 0;

  % lightning params
  lightningSize = 100;
  lightningWidth = 6;
  lightningColor = [1, 1, 0];
  lightningMove = oceanWidth/5;
  lightningMaxFlashes = 10;
  lightningX      = zeros(1,lightningMaxFlashes);
  lightningY      = zeros(1,lightningMaxFlashes);
  lightningTheta  = zeros(1,lightningMaxFlashes);
  lightningFlash  = zeros(1,lightningMaxFlashes);
  lightningHandle = zeros(6, lightningMaxFlashes);

  % Owens time
  xOwens = 100;
  yOwens = 100;
% Speed of movement
  xOwensSpe = 25;
  yOwensSpe = 1;

##  [owensHeight, owensWidth, owensHandle] = drawOwens(greenethHeadImage, xOwens, yOwens);

  % original parameters
##  toggleState = false;
##  squidHandle = []; % squid's here right now

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

% display help message
    text(helpMessageX, helpMessageY, 'help!!!', 'FontSize', 16, 'Color', helpMessageColor);

% change health status
myMessage = strcat('Health ', ' ');
healthStatusMessage = cstrcat(myMessage, num2str(playerHealth));
healthHandle = text(healthStatusLocation(1), healthStatusLocation(2), healthStatusMessage, 'FontSize', 20, 'Color', healthBarRed);

% change catch status
catchStatusMessage = cstrcat('Squids Caught ', num2str(squidsCaught));
squidsCaughtHandle = text(squidsCaughtLocation(1), squidsCaughtLocation(2), catchStatusMessage, 'FontSize', 20, 'Color', healthBarRed);

%---------------------player stuff--------------------------------------
% Move Player
  if(cmd == "a" || cmd == "d" || cmd == "w" || cmd == "s")
    [playerX, playerY, playerTheta] = movePlayer (playerX, playerY, playerTheta, cmd);
  endif

% Draw Player
[playerHandle, playerSpearX, playerSpearY] = drawPlayer (playerX, playerY, playerTheta, playerBodySize, playerHeadSize, netSize, playerColor, playerLineWidth, oceanClock);

squidsCaught = isSquidCaught(playerSpearX, playerSpearY, squidX, squidY, squidSize);

% check if the squid has to be caught
  if(squidsCaught == 1)
    squidsCaught = squidsCaught + 1;
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
% --------------------fish stuff----------------------------------------
 % check whether fish is stunned or not
 fishGotStunned = isFishStunned (lightningX, lightningY, fishX, fishY, lightningFlash, 2*fishRadius);

 if(fishGotStunned)
  fishStunTimer = fishStunTime;
 endif

 if(fishStunTimer == 0)
  fishX = fishX + fishForwardMove;
 endif

 % move fish
  fishX = fishX + fishForwardMove;

  % check fish
  [fishX, fishY] = checkFishBoundary(fishX,fishY,oceanHeight,oceanWidth,fishRadius);

    % draw fish
 fishHandle = drawFish(fishRadius, fishX, fishY, fishColor, fishLineWidth);

 % did the fish deal damage to the player
 playerBitten = isDamageTaken(playerX, playerY, fishTeethX, fishTeethY, playerBodySize);
 if (playerBitten)
   playerHealth = playerHealth - 10;
 endif

 % is player bitten
 playerBitten = isDamageTaken(playerX, playerY, fishX, fishY, playerBodySize);

  if(playerBitten == 1)
   playerHealth = playerHealth - fishBiteDamage;
  endif

 if(squidsCaught == 0)
% --------------------squid stuff----------------------------------------
% rotate by theta radians
##squidTheta = squidTheta + pi/3;
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
%--------------------lightning stuff-----------------------------------------------------------------------------
  % have player create lightning
  if (cmd == "l")

    for (i = 1:lightningMaxFlashes)

      if (lightningFlash(i) == 0)
        lightningFlash(i) = 1;
        lightningX(i) = playerSpearX;
        lightningY(i) = playerSpearY;
        lightningTheta(i) = playerTheta;
        i = lightningMaxFlashes + 1;
      endif

    endfor

  endif

    % move lightning
  for (i = 1: lightningMaxFlashes)

    if (lightningFlash(i) > 0)

    lightningX(i) = lightningX(i) + lightningMove*cos(lightningTheta(i));
    lightningY(i) = lightningY(i) + lightningMove*sin(lightningTheta(i));

    endif

  endfor

  % check boundary for lightning
  for (i = 1: lightningMaxFlashes)

    [lightningX(i), lightningY(i), lightningFlash(i)] = checkLightningBoundary (lightningX(i), lightningY(i), oceanWidth, oceanHeight, lightningSize, lightningFlash(i));

  endfor

  % only create lightning if there isn't lightning on screen
  for (i = 1: lightningMaxFlashes)

    if (lightningFlash(i) > 0)

    [lightningHandle(:,i), lightningPointX(i), lightningPointY(i)] = drawLightning (lightningSize, lightningColor, lightningWidth, oceanClock, lightningX(i), lightningY(i), lightningTheta(i));

    endif

  endfor


##% make all of the objects appear again
## drawnow;

 cmd = "null";

 pause(0.1);

% we have to increment the clock manually, or else the code freezes every time we toggle between images
oceanClock = oceanClock + 1;

% update fish timer
  if(fishStunTimer > 0)
    fishStunTimer = fishStunTimer - 1;
  endif

% delete everything
if (squidsCaught == 0)
  delete(squidHandle);
endif
delete(healthHandle);
delete(playerHandle);
delete(circleHandle);
delete(fishHandle);
delete(squidsCaughtHandle);
  for (i = 1: lightningMaxFlashes)
    if (lightningFlash(i) > 0)
    delete(lightningHandle(:,i));
    endif
  endfor

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
