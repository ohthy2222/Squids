function [handle, spearX, spearY] = drawPlayer (playerX, playerY, playerTheta, ...
                              playerBodySize, playerHeadSize, netSize, ...
                              playerColor, playerLineWidth, oceanClock)

% get the player points for player at the origin
[player, firstHeadPoint] = getPlayer (playerBodySize,playerHeadSize,netSize, oceanClock);
[playerRows, lastHeadPoint] = size(player);

% rotate player
R = getRotate(playerTheta);
player = R*player;

% translate player
T = getTranslate(playerX,playerY);
player = T*player;

% body
pt1 = player(:,1); % top of spine
pt6 = player(:,6);
pt7 = player(:,7); % hip
pt8 = player(:,8); % right foot
pt9 = player(:,9); % right flipper
pt10 = player(:,10); % left foot
pt11 = player(:,11); % left flipper

% tank =
pt3 = player(:,3);
pt4 = player(:,4);
pt5 = player(:,5);

% arm
pt2 = player(:,2);
pt13 = player(:,13);

% net
pt12 = player(:,12);
pt14 = player(:,14);

% spear variables
spearX = pt12(1);
spearY = pt12(2);


% head
xHeadPoints = player(1,firstHeadPoint:lastHeadPoint);
yHeadPoints = player(2,firstHeadPoint:lastHeadPoint);

handle(1) = drawLine(pt1,pt7,playerColor,playerLineWidth); % body
handle(2) = drawLine(pt7,pt8,playerColor,playerLineWidth); % right leg
handle(3) = drawLine(pt8,pt9,playerColor,playerLineWidth); % right flipper
handle(4) = drawLine(pt7,pt10,playerColor,playerLineWidth); % left leg
handle(5) = drawLine(pt10,pt11,playerColor,playerLineWidth); % left flipper
handle(6) = drawLine(pt5,pt4,playerColor,playerLineWidth); % tank bottom
handle(7) = drawLine(pt4,pt3,playerColor,playerLineWidth); % tank side
handle(8) = drawLine(pt3,pt2,playerColor,playerLineWidth); % tank top
handle(9) = drawLine(pt12,pt14,playerColor,playerLineWidth); % stick
handle(10) = drawLine(pt2,pt13,playerColor,playerLineWidth); % arm
handle(11) = line(xHeadPoints,yHeadPoints); % head
set(handle(11),'Color',playerColor);
set(handle(11),'LineWidth',playerLineWidth);


endfunction
