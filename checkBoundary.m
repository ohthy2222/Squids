function [newX , newY] = checkBoundary (X,Y,oceanHeight,oceanWidth,objectRadius)
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
else % X and Y in bounds
newX = X;
newY = Y;

endif

endfunction
