function player = getPlayer (playerBodySize,netSize,torsoSize)

% body
bodyPoint1 = [-bodySize;0;1];
bodyPoint2 = [bodySize;0;1];

bodyPoints = [bodyPoint1,bodyPoint2];

% head
head = getCircle(playerHeadSize,0)
T = getTranslate(bodySize,0);
headPoints = T*head;

% body =

% arm
% arm =

% legs

% leg =

% oxygen tank

% tank =

%net

% net =

%playerHandle

player = [headPoints,bodyPoint1,bodyPoint2];

endfunction
