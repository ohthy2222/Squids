function [lightningHandle, lightningPointX, lightningPointY] = drawLightning (lightningSize, lightningColor, lightningWidth, lightningClock, lightningX, lightningY, lightningTheta)

thisClock = mod(lightningClock, 2);


% get the lightning points for a lightning of size lightningSize from getLightning
lightning = getLightning(lightningSize, lightningClock);

% rotate by theta radians
R = getRotate(lightningTheta);
lightning = R*lightning;

%Translate the lightning by deltaX, deltaY from the origin.
T = getTranslate(lightningX,lightningY);
lightning = T*lightning;

pt1 = lightning(:,1);
pt2 = lightning(:,2);
pt3 = lightning(:,3);
pt4 = lightning(:,4);
pt5 = lightning(:,5);

lightningPointX = pt3(1);
lightningPointY = pt3(2);

  handle1 = drawLine(pt1,pt2,lightningColor,lightningWidth);
  handle2 = drawLine(pt2,pt3,lightningColor,lightningWidth);
  handle3 = drawLine(pt1,pt4,lightningColor,lightningWidth);
  handle4 = drawLine(pt5,pt1,lightningColor,lightningWidth);

if (thisClock == 0)
  handle5 = drawLine(pt2,pt3,lightningColor,lightningWidth);
  handle6= drawLine(pt4,pt5,lightningColor,lightningWidth);
else
  handle5 = drawLine(pt2,pt5,lightningColor,lightningWidth);
  handle6= drawLine(pt4,pt3,lightningColor,lightningWidth);
endif

lightningHandle = [handle1, handle2, handle3, handle4, handle5, handle6];

endfunction

