function yarn_convention
  if [ (count $argv) != 0 ]
    yarn $argv
  else 
    yarn -v
  end 
end
