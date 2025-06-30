if status is-interactive
    # Commands to run in interactive sessions can go here

    alias cat="bat"
    alias ls="eza -la --icons"


end

# pnpm
set -gx PNPM_HOME "/home/fabien/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
