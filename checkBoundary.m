function [newX , newY] = checkBoundary (X,Y,oceanHeight,oceanWidth,objectRadius)

% X and Y in bounds
newX = X;
newY = Y;

% check if X is out of bounds
if (X > oceanWidth - objectRadius) % westeth check
  newX = objectRadius;
  newY=Y;
  elseif (X < objectRadius) % easteth check
  newX = oceanWidth - objectRadius;
  newY=Y;
  endif

  % check if Y is out of bounds
  if (Y > oceanHeight - objectRadius) % southeth check
  newY = objectRadius;
  newX = X;
elseif (Y < objectRadius) % northeth check
  newY = oceanHeight - objectRadius;
  newX = X;
endif

endfunction
