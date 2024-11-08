function squidCaught = isSquidCaught (spearX, spearY, squidX, squidY, squidSize)

% calc the space between spear and squidCaught
a = squidX - spearX;
b = squidY - spearY;

d = sqrt( a^2 + b^2);

if (d < squidSize)
  squidCaught = 1;
else
  squidCaught = 0;
endif

endfunction
