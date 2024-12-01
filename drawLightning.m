function lightningHandle = drawLightning (lightningSize, lightningColor, lightningWidth, lightningclock, lightningX, lightningY, lightningTheta)

thisClock = mod(lightningClock, 2);


% get the lightning points for a lightning of size lightningSize from getLightning
lightning = getlightning(lightningSize, lightningClock);

% rotate by theta radians
R = getRotate(lightningTheta);
lightning = R*lightning;

%Translate the lightning by deltaX, deltaY from the origin.
T = getTranslate(lightningX,lightningY);
lightning = T*lightning;

pt1 = lightningPoint(:,1);
pt2 = lightningPoint(:,2);
pt3 = lightningPoint(:,3);
pt4 = lightningPoint(:,4);
pt5 = lightningPoint(:,5);

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

