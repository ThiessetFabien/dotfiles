function cln --wraps='sudo pacman -Sc' --description 'alias cln=sudo pacman -Sc'
  sudo pacman -Sc $argv
        
end
