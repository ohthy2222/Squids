function [playerX,playerY,playerTheta] = movePlayer (playerX,PlayerY,playerTheta,cmd);

forwardMove = 50;
thetaMove = pi/12;

if (cmd == "w") % move forward
  playerX = playerX + forwardMove*cos(playerTheta);
  playerY = playerY + forwardMove*sin(playerTheta);
endif

if (cmd == "d") % rotate clockwise
  playerTheta = playerTheta + thetaMove;
endif

if (cmd == "a") % rotate counter clockwise
  playerTheta = playerTheta - thetaMove;
endif

endfunction
