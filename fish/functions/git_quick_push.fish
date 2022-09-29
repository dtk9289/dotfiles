function git_quick_push
  if [ (count $argv) ]
    begin
      git add .
      git commit -a -m $argv
      git push
    end
  end 
end
