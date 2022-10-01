#!/usr/bin/fish

if test (cat /sys/class/power_supply/ADP0/online)
  echo " "
else
  echo ""
end
