# ssh-agentの設定
if [ -z "$SSH_AUTH_SOCK" ]; then
   RUNNING_AGENT="`ps -ax | grep 'ssh-agent -s' | grep -v grep | wc -l | tr -d '[:space:]'`"
   if [ "$RUNNING_AGENT" = "0" ]; then
        ssh-agent -s &> $HOME/.ssh/ssh-agent
   fi
   eval `cat $HOME/.ssh/ssh-agent`
fi
ssh-add $HOME/.ssh/github_rsa

eval "$(/opt/homebrew/bin/brew shellenv)"

# nvimのエイリアス設定
alias n="nvim"

# starshipの設定
eval "$(starship init zsh)"

# cd した後に ls するように
function chpwd() {
  ls -a
}

# docker-nvimの設定
function dnvim() {
  local input_path="${1:-.}"
  
  local target_path
  target_path=$(realpath "$input_path")

  local config_dir="$HOME/Documents/dotfiles/nvim/docker"

  if [ ! -d "$target_path" ] && [ ! -f "$target_path" ]; then
    echo "Error: Path '$target_path' does not exist."
    return 1
  fi

  TARGET_PATH="$target_path" docker compose \
    -f "$config_dir/docker-compose.yaml" \
    -p "nvim-env" \
    run \
    --rm nvim
}

