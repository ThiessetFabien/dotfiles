if status is-interactive
    # Commands to run in interactive sessions can go here

end

# pnpm
set -gx PNPM_HOME "/home/fabien/.local/share/pnpm"

if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# bun
set -Ux PATH $HOME/.bun/bin $PATH

# postgresql variable
set -x PGUSER fabien

export PATH="$HOME/.local/bin:$PATH"
