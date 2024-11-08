function playerBitten = isPlayerBitten (playerX, playerY, teethX, teethY, hitBox)

% calc the space between spear and squidCaught
a = playerX - teethX;
b = playerY - teethY;

d = sqrt(a^2 + b^2);

if (d < hitBox)
  playerBitten = 1;
else
  playerBitten = 0;
endif

endfunction
