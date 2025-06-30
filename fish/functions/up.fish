function up --wraps='yay -Syu' --wraps='yay -Syu --noconfirm' --description 'alias up=yay -Syu --noconfirm'
  yay -Syu --noconfirm $argv
        
end
