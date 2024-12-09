function [player, firstHeadPoint] = getPlayer (playerBodySize,netSize,torsoSize, oceanClock)
% playerBodySize is the distance from the origin to the base of the head

% Player point numbers
%
%     /\8
%    /  \           4____________3
%   9    \__________|_____________|
%        /7         5     6      2|
%  11\   /              (0,0)     |
%     \/10
%
%
%
%
%
%
legCycleTicks = 20;
legLength = playerBodySize;
legAngle = (2 * pi/legCycleTicks)*oceanClock;

% command param
cmd = "null";

% params for flippers
flipperSize = playerBodySize;
flipperAngle = pi;
flipperMaxAngle = pi/4;
flipperLagAngle = pi/180;

% params for legs
legAngleMax = pi/4;
legAngleTicks = 20;
legLength = playerBodySize;

##% spear params
##
##
##% params for lightning electrocuteth
##laserX = =3
##
##
##if (cmd == "l")
##
##  lightningHandle = getLightning(laserX, laserY, flashColor, lightningWidth);
##
##endif

% animate leg during move commands
if (cmd == "w")

  legAngleRight = pi + legAngleMax*sin(2*pi*gameClock/legAngleTicks);
  legAngleLeft = pi - legAngleMax*sin(2*pi*gameClock/legAngleTicks);

  if(cos(2*pi*gameClock/legAngleTicks)>0)
  flipperAngleRight = legAngleRight - flipperMaxAngle;
  else
  flipperAngleRight = legAngleRight + flipperMaxAngle;
  endif

  if(-cos(2*pi*gameClock/legAngleTicks)>0)
  flipperAngleLeft = legAngleLeft - flipperMaxAngle;
  else
  flipperAngleLeft = legAngleLeft + flipperMaxAngle;
  endif

else
  legAngleRight = pi;
  legAngleLeft = pi;
  flipperAngleRight = legAngleRight - flipperMaxAngle;
  flipperAngleLeft = legAngleLeft + flipperMaxAngle;
endif



if ( cmd == "a" || cmd == "d" || cmd == "w")
  legAngleRight = pi + legAngleMax*sin(2*pi*oceanClock/legAngleTicks);
  legAngleLeft = pi + legAngleMax*cos(2*pi*oceanClock/legAngleTicks);

  flipperAngleRight = legAngleMax + flipperMaxAngle*sin(2*pi*oceanClock/legAngleTicks);
  flipperAngleLeft = legAngleMax + flipperMaxAngle*cos(2*pi*oceanClock/legAngleTicks);
else
  flipperAngleRight = pi;
  flipperAngleLeft = pi + flipperMaxAngle;
  legAngleRight = pi;
  legAngleLeft = pi + legAngleMax;
endif

% body
pt1 = [playerBodySize;0;1]; % top of spine
pt6 = [0;0;1];
pt7 = [-playerBodySize;0;1]; % hip
pt8 = [pt7(1) + legLength*cos(legAngleRight); pt7(2) + legLength*sin(legAngleRight);1]; % right foot
%pt9 = [pt8(1)-flipperSize*sin(flipperAngleRight); pt8(2)-flipperSize*cos(flipperAngleRight);1]; % right flipper
pt9 = [pt8(1);pt8(2);1];
pt10 = [pt7(1) + legLength*cos(legAngleLeft); pt7(2) + legLength*sin(legAngleLeft);1]; % left foot
pt11 = [pt10(1) - flipperSize*sin(flipperLagAngle); pt10(2) - flipperSize*cos(flipperLagAngle);1]; % left flipper

% tank =
pt2 = [0.7*playerBodySize;0;1]; % top of the tank
pt3 = [0.7*playerBodySize;-0.2*playerBodySize;1];
pt4 = [-0.7*playerBodySize;-0.2*playerBodySize;1];
pt5 = [-0.7*playerBodySize;0;1];

% neck


% body =



% arm
pt2 = [0.7*playerBodySize; 0; 1]; %shoulder
pt13 = [0.7*playerBodySize; 0.5*playerBodySize; 1]; % hand

% legs

% leg =

% oxygen tank

%net
pt12 = [0; 0.5*playerBodySize; 1]; %hand
pt14 = [2.0*playerBodySize; 0.5*playerBodySize; 1]; % tip of spear

% head
headRadius = playerBodySize/4;
headPoints = getCircle(headRadius,0); % head at the origin/belly button
T = getTranslate(headRadius+playerBodySize,0); % get head translation matrix
##head = getCircle(playerHeadSize,0)
headPoints = T*headPoints;

% make return vaiable
player = [pt1,pt2,pt3,pt4,pt5,pt6,pt7,pt8,pt9,pt10,pt11,pt12,pt13,pt14, headPoints];
firstHeadPoint = 15;

endfunction
