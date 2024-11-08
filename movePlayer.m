function [newX,newY,newTheta] = movePlayer (playerX,playerY,playerTheta,cmd);

forwardMove = 50;
thetaMove = pi/12;
newX = playerX;
newY = playerY;
newTheta = playerTheta;

if (cmd == "w") % move forward
  newX = playerX + forwardMove*cos(playerTheta);
  newY = playerY + forwardMove*sin(playerTheta);
endif

if (cmd == "d") % rotate clockwise
  newTheta = playerTheta + thetaMove;
endif

if (cmd == "a") % rotate counter clockwise
  newTheta = playerTheta - thetaMove;
endif

if (cmd == "s") % move forward
  newX = playerX - forwardMove*cos(playerTheta);
  newY = playerY - forwardMove*sin(playerTheta);
endif

endfunction
