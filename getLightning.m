function lightningHandle = getLightning (point1, point2, color, width)

lightningShake = 5;

if (mod(lightningClock,2) == 0)

  pt1 = [-1.5*lightningSize; -0.25*lightningSize; 1];
  pt2 = [-0.5*lightningSize; -0.25*lightningSize; 1];
  pt3 = [lightningSize/2); 0; 1];
  pt4 = [0; 0; 1];
  pt5 = [0.5*lightningSize; 0; 1];
  pt6 = [0; 0.25*lightningSize; 1];
  pt7 = [1.5*lightningSize, 0.25*lightningSize; 1];

else

  pt1 = [lightningShake; 0; 1];
  pt2 = [lightningSize+lightningShake; 0; 1];
  pt3 = [lightningSize/2)+lightningShake; (lightningSize/4); 1];
  pt4 = [2*lightningSize+lightningShake; (lightningSize/4); 1];
  pt5 = [(3*lightningSize)/2)+lightningShake; (lightningSize/2); 1];
  pt6 = [3*lightningSize+lightningShake, lightningSize/2; 1];


endfunction
