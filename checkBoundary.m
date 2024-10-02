function [newX , newY] = checkBoundary (X,Y,oceanHeight,oceanWidth,objectRadius)
% start squid checks

% in bounds
newX=X;
newY=Y;

% check if X is out of bounds
if (X > oceanWidth - objectRadius) % westeth check
  newX = objectRadius;
  elseif (X < objectRadius) % easteth check
  newX = oceanWidth - objectRadius;
  endif

  % check if Y is out of bounds
  if (Y < objectRadius) % northeth check
  newY = ceanHeight - objectRadius;

elseif (Y > oceanHeight - objectRadius) % southeth check
  newY = objectRadius;
endif

% end squid checks

endfunction
