function retval = readKeyboard (input1, input2)



% Create a figure for the GUI
f = figure('KeyPressFcn', @(src, event) keypress_callback(event), ...
            'Name', 'Keyboard Reader', ...
            'NumberTitle', 'off', ...
            'MenuBar', 'none', ...
            'Position', [100, 100, 300, 200]); % Set the figure size

% command params
cmd = "null";

% Move Player
if (cmd == "a" || cmd == "d" || cmd == "w")
[playerX,playerY,playerTheta] = movePlayer (playerX,PlayerY,playerTheta,cmd);
cmd = 'null';
endif

% Check Player

% Draw Player
drawPlayer (playerX, playerY, playerTheta, ...
                              playerBodySize, playerHeadSize, netSize, ...
                              playerColor, playerLineWidth, clock)


%-----------------------------
% Ken's code in animateSquid()
function keypress_callback(event)

  % set the command
  cmd = event.Key;

% check for 'q' to quit
if strcmp(cmd, 'q')
  disp('Quitting...');
  close(f); % Close the figure
end
endfunction



endfunction
