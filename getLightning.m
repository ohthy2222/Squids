function lightningHandle = getLightning(lightningSize, lightningClock)

lightningShake = 5;
##thisClock = mod(lightningClock, 2);
##
##if (thisClock == 0)

pt1 = [0; 0; 1];
pt2 = [lightningSize; 0; 1];
pt3 = [0; -lightningSize/10; 1];
pt4 = [-lightningSize; 0; 1];
pt5 = [0; lightningSize/10; 1];

##else
##
##  pt1 = [lightningShake; 0; 1];
##  pt2 = [lightningSize+lightningShake; 0; 1];
##  pt3 = [lightningSize/2)+lightningShake; (lightningSize/4); 1];
##  pt4 = [2*lightningSize+lightningShake; (lightningSize/4); 1];
##  pt5 = [(3*lightningSize)/2)+lightningShake; (lightningSize/2); 1];
##  pt6 = [3*lightningSize+lightningShake, lightningSize/2; 1];
##
##endif

lightningHandle = [pt1, pt2, pt3, pt4, pt5];

endfunction
