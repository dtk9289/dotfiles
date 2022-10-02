#!/usr/bin/fish
set ibusEngine (ibus engine)
if test (count $argv) -gt 0 && test $argv = "switch"
  #print status
  if test $ibusEngine = "Bamboo"
    ibus engine xkb:us::eng > /dev/null
    echo E
  else
    ibus engine Bamboo
    echo V
  end
else
  if test $ibusEngine = "Bamboo"
    echo V
  else
    echo E
  end
end
