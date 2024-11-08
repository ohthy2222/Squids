function squidHandle = drawSquid (squidSize, color, stripeColor, width, clock, x, y, theta)

% get the squid points for a squid of size squidSize from getSquid
squid = getSquid(squidSize, clock);

% rotate by theta radians
R = getRotate(theta);
squid = R*squid;

%Translate the squid by deltaX, deltaY from the origin.
T = getTranslate(x,y);
squidPoints = T*squid;

pt1 = squidPoints(:,1);
pt2 = squidPoints(:,2);
pt3 = squidPoints(:,3);
pt4 = squidPoints(:,4);
pt5 = squidPoints(:,5);
pt6 = squidPoints(:,6);
pt7 = squidPoints(:,7);
pt8 = squidPoints(:,8);
pt9 = squidPoints(:,9);
pt10 = squidPoints(:,10);
pt11 = squidPoints(:,11);
pt12 = squidPoints(:,12);

  handle1 = drawLine(pt1,pt2,color,width);
  handle2 = drawLine(pt2,pt3,color,width);
  handle3 = drawLine(pt3,pt1,color,width);

  handle4 = drawLine(pt4,pt5,color,width);
  handle5 = drawLine(pt5,pt6,color,width);
  handle6 = drawLine(pt7,pt8,color,width);
  handle7 = drawLine(pt8,pt9,color,width);

   handle8 = drawLine (pt1,pt2,color,width);
   handle9 = drawLine (pt2,pt3,color,width);
   handle10 = drawLine (pt3,pt1,color,width);
   handle11 = drawLine (pt4,pt5,color,width);
   handle12 = drawLine (pt5,pt6,color,width);
   handle13 = drawLine (pt12,pt1,stripeColor,width);
   handle14 = drawLine (pt4,pt10,stripeColor,width);
   handle15 = drawLine (pt7,pt11,stripeColor,width);

squidHandle = [handle1, handle2, handle3, handle4, handle5, handle6, handle7, handle8, handle9, handle10, handle11, handle12, handle13, handle14, handle15];
endfunction

