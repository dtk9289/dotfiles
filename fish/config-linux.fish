if type -q exa
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
end

if status --is-login
  command -v sway && sway
end
