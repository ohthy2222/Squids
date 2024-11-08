function mouseMotion_callback (src, event)

global mouseX;
global mouseY;
global mousePreviousX;
global mousePreviousY;
global mouseCmd;

% save old mouse spot
mousePreviousX = mouseX;
mousePreviousY = mouseY;

% retrieve current mouse spot
coords = get(gca, 'CurrentPoint'); % Get current mouse coordinates in the plot

mouseX = coords(1,1);
mouseY = coords(1,2);

## pause(.1)

% retrieve current mouse spot again
coords = get(gca, 'CurrentPoint'); % Get current mouse coordinates in the plot

mouseX = coords(1,1);
mouseY = coords(1,2);

% retrieve cross product of current and previous mouse spot relative to the player
##mouseRotation = getCrossProduct();
mouseRotation = (mousePreviousX - playerX)*(mouseY - playerY) - (mouseX - playerX)*(mousePreviousY - playerY);

% set player rotation command
if(mouseRotation > 0)
   mouseCmd = "c"; % rotate clockwise
elseif(mouseRotation < 0)
       mouseCmd = "a"; % rotate counter-clockwise
else
       mouseCmd = "n"; % no rotation
endif

endfunction
