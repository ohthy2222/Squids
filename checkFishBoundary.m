function [newX, newY] = checkFishBoundary (X, Y, oceanHeight, oceanWidth, fishSize)

% X and Y in bounds
newX = X;
newY = Y;

% check if fishX stays in the Ocean
if (X > oceanWidth - fishSize) % westeth check
  newX = fishSize;
  newY = Y;
  newY = fishSize + rand*(oceanHeight - 2*fishSize);
  elseif (X < fishSize) % easteth check
  newX = oceanWidth - fishSize;
  newY = Y;
  endif

  % check if Y is out of bounds
  if (Y > oceanHeight - fishSize) % southeth check
  newY = fishSize;
  newX = X;
elseif (Y < fishSize) % northeth check
  newY = oceanHeight - fishSize;
  newX = X;
endif

endfunction
