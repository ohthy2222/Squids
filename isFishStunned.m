function fishStunned = isFishStunned (lightningX, lightningY, fishX, fishY, lightningFlash, hitBoxSize)

lightningBolts = length(lightningFlash);
fishStunned = 0;

for (i=1: lightningBolts)

  if(lightningFlash(i) == 1)
    % calc the space between lightning and the fish
    d = getDistance(fishX, fishY, lightningX(i), lightningY(i));
    dx = fishX - lightningX(i)
    dy = fishY - lightningY(i)
    if (d < hitBoxSize)
      fishStunned = 1;
    endif

  endif

endfor

endfunction
