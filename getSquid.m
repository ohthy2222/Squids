function squid = getSquid (squidSize, clock)

%frame = 0
frame = mod(clock,2);
if (frame == 0)
% body
pt1 = [squidSize ; 0 ; 1];
pt2 = [0 ; squidSize ; 1];
pt3 = [0 ; -squidSize ; 1];

%left leg
pt4 = [0 ; squidSize/2 ; 1];
pt5 = [-squidSize ; 0 ; 1];
pt6 = [-2*squidSize ; squidSize/2 ; 1];

%right leg
pt7 = [0 ; -squidSize/2 ; 1];
pt8 = [-squidSize ; -squidSize ; 1];
pt9 = [-2*squidSize ; -squidSize/2 ; 1];

% straight stripes
    pt10 = [squidSize/2 ; squidSize/2 ; 1];
    pt11 = [squidSize/2 ; -squidSize/2 ; 1];
    pt12 = [0 ; 0 ; 1];

    elseif( frame == 1)

    % body
pt1 = [squidSize ; 0 ; 1];
pt2 = [0 ; squidSize ; 1];
pt3 = [0 ; -squidSize ; 1];

%left leg
pt4 = [0 ; squidSize/2 ; 1];
pt5 = [-squidSize ; squidSize ; 1];
pt6 = [-2*squidSize ; squidSize/2 ; 1];

%right leg
pt7 = [0 ; -squidSize/2 ; 1];
pt8 = [-squidSize ; 0 ; 1];
pt9 = [-2*squidSize ; -squidSize/2 ; 1];

% straight stripes
    pt10 = [squidSize/2 ; squidSize/2 ; 1];
    pt11 = [squidSize/2 ; -squidSize/2 ; 1];
    pt12 = [0 ; 0 ; 1];

    else
    % body
pt1 = [squidSize ; 0 ; 1];
pt2 = [0 ; squidSize ; 1];
pt3 = [0 ; -squidSize ; 1];

%left leg
pt4 = [0 ; squidSize/2 ; 1];
pt5 = [-squidSize ; 0 ; 1];
pt6 = [-2*squidSize ; squidSize/2 ; 1];

%right leg
pt7 = [0 ; -squidSize/2 ; 1];
pt8 = [-squidSize ; 0 ; 1];
pt9 = [-2*squidSize ; -squidSize/2 ; 1];

% straight stripes
    pt10 = [squidSize/2 ; squidSize/2 ; 1];
    pt11 = [squidSize/2 ; -squidSize/2 ; 1];
    pt12 = [0 ; 0 ; 1];
  endif

squid = [pt1, pt2, pt3, pt4, pt5, pt6, pt7, pt8, pt9, pt10, pt11, pt12];

endfunction
