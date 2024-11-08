function retval = keypress_callback (src, event)
global cmd;

% set the command_line_path
cmd = event.Key;

endfunction
