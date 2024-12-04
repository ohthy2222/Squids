function [newX, newY, newFlash] = checkLightningBoundary (X, Y, oceanWidth, oceanHeight, borderSize, flash)

% X and Y in bounds
newX = X;
newY = Y;
newFlash = flash;

% check if lightningX stays in the Ocean
if (X > oceanWidth - borderSize) % westeth check
  newX = 0;
  newY = 0;
  newFlash = 0;
elseif (X < borderSize) % easteth check
  newX = 0;
  newY = 0;
  newFlash = 0;
endif

  % check if lightningY is out of bounds
if (Y > oceanHeight - borderSize) % southeth check
  newY = 0;
  newX = 0;
  newFlash = 0;
elseif (Y < borderSize) % northeth check
  newY = 0;
  newX = 0;
  newFlash = 0;
endif

endfunction
