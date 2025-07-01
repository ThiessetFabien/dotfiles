function cln --wraps='sudo pacman -Sc --noconfirm' --description 'alias cln=sudo pacman -Sc --noconfirm'
  sudo pacman -Sc --noconfirm $argv
        
end
