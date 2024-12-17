function isDamaged = isDamageTaken (X, Y, damagerX, damagerY, hitBox)

% calc the space between damager and the damaged
a = X - damagerX;
b = Y - damagerY;

d = sqrt(a^2 + b^2);

if (d < hitBox)
  isDamaged = 1;
else
  isDamaged = 0;
endif

endfunction
