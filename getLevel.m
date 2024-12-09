function level = getLevel ()

global cmd;

% location params
levelLocation = [1000, 500];

% choose you level
levelMessage = 'Choose Your Level 1-9';


levelMessageHandle = text(levelLocation(1), levelLocation(2), levelMessage, 'FontSize', 20, 'Color', [0, 0, 0]);

while(true)
  if( cmd == '1' || cmd == '2' || cmd == '3' || cmd == '4' || cmd == '5' || cmd == '6' || cmd == '7' || cmd == '8' || cmd == '9')
    level = str2num(cmd);
    break;
  endif
  pause(1);
endwhile

delete(levelMessageHandle);

endfunction
