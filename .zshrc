# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(
  fzf
  git
  poetry
  zsh-autosuggestions
  fast-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

fpath+=$HOME/.zsh/typewritten
autoload -U promptinit; promptinit
prompt typewritten
export TYPEWRITTEN_PROMPT_LAYOUT="pure"
export TYPEWRITTEN_SYMBOL="->"
export TYPEWRITTEN_RELATIVE_PATH="adaptive"
export TYPEWRITTEN_CURSOR="block"
export TYPEWRITTEN_RIGHT_PROMPT_PREFIX="# "
export TYPEWRITTEN_COLOR_MAPPINGS="primary:magenta;secondary:magenta;accent:white;foreground:white"
# kube context prefix
display_kube_context() {
  tw_kube_context="$(kubectl config current-context 2> /dev/null)"

  if [[ $tw_kube_context != "" ]]; then
      echo "($(basename $tw_kube_context))($CONDA_DEFAULT_ENV)"
  fi
}



export TYPEWRITTEN_LEFT_PROMPT_PREFIX_FUNCTION=display_kube_context



# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/heiru/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/heiru/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/heiru/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/heiru/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export GPG_TTY=$(tty)

# pnpm
export PNPM_HOME="/Users/heiru/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# go lib
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# kubectl with gcloud auth plugins
export USE_GKE_GCLOUD_AUTH_PLUGIN=true
export CLOUDSDK_PYTHON_SITEPACKAGES=1

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/heiru/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/heiru/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/heiru/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/heiru/google-cloud-sdk/completion.zsh.inc'; fi

#poetry
export PATH="/Users/heiru/.local/bin:$PATH"

#fzf
export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :100 {}'"
export FZF_DEFAULT_COMMAND="fd --type file --follow --hidden --exclude .git --color=always"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Alias

## miscs
alias vim=nvim

## swtich kubernetes context
alias kdesk='kubectl config use-context docker-desktop'
alias kd='kubectl config use-context gke_prj-d0-vdp-a722_europe-west4-a_main-euw4-d0'
alias ks='kubectl config use-context gke_prj-s-vdp-7322_europe-west4-a_main-euw4-s'
alias kp='kubectl config use-context gke_prj-p-vdp-cfa2_europe-west4-a_main-euw4-p'
## gcloud bastion port-forward
alias gcp='gcloud compute ssh bastion-europe-west4-a --quiet --ssh-flag=-fN --tunnel-through-iap --project prj-c-bastion-212b --zone europe-west4-a -- -4 -L8888:127.0.0.1:8888'
alias gcpa='gcloud compute ssh bastion-asia-southeast1-a --quiet --ssh-flag=-fN --tunnel-through-iap --project prj-c-bastion-212b --zone asia-southeast1-a -- -4 -L8888:127.0.0.1:8888'
alias gcpd='gcloud compute ssh bastion-europe-west4-a --quiet --ssh-flag=-fN --tunnel-through-iap --project prj-c-bastion-212b --zone europe-west4-a -- -D 127.0.0.1:5000'
alias gcpda='gcloud compute ssh bastion-asia-southeast1-a --quiet --ssh-flag=-fN --tunnel-through-iap --project prj-c-bastion-212b --zone asia-southeast1-a -- -D 127.0.0.1:5000'
alias gcprs='gcloud compute ssh bastion-europe-west4-a --quiet --ssh-flag=-fN --tunnel-through-iap --project prj-c-bastion-212b --zone europe-west4-a -- -N -L 6379:10.254.0.3:6379'
alias gcprsa='gcloud compute ssh bastion-asia-southeast1-a --quiet --ssh-flag=-fN --tunnel-through-iap --project prj-c-bastion-212b --zone asia-southeast1-a -- -N -L 6379:10.254.0.195:6379'
alias gcprp='gcloud compute ssh bastion-europe-west4-a --quiet --ssh-flag=-fN --tunnel-through-iap --project prj-c-bastion-212b --zone europe-west4-a -- -N -L 6379:10.254.0.11:6379'
alias gcprd='gcloud compute ssh bastion-europe-west4-a --quiet --ssh-flag=-fN --tunnel-through-iap --project prj-c-bastion-212b --zone europe-west4-a -- -N -L 6379:10.254.0.91:6379'
alias gccd='gcloud container clusters get-credentials --project prj-d0-vdp-c684 --zone europe-west4-a --internal-ip main-euw4-d0'
alias gccda='gcloud container clusters get-credentials --project prj-d0-vdp-c684 --zone asia-southeast1-c --internal-ip main-azse1-d0'
alias gccd5='gcloud container clusters get-credentials --project prj-d5-vdp-eaa9 --zone europe-west4-a --internal-ip main-euw4-d5'
alias gccs='gcloud container clusters get-credentials --project prj-s-vdp-7322 --zone europe-west4-a --internal-ip main-euw4-s'
alias gccsa='gcloud container clusters get-credentials --project prj-s-vdp-7322 --zone asia-southeast1-c --internal-ip main-azse1-s'
alias gccp='gcloud container clusters get-credentials --project prj-p-vdp-cfa2 --zone europe-west4-a --internal-ip main-euw4-p'
alias gccpa='gcloud container clusters get-credentials --project prj-p-vdp-cfa2 --zone asia-southeast1-c --internal-ip main-azse1-p'

## delete all model cache keys in redis
alias rdmc='redis-cli --raw keys "instill-ai/model*" | xargs redis-cli del'

## helm install instill-core chart
alias hi='helm install core charts/core --namespace instill-ai --create-namespace --set apiGateway.image.tag=latest --set mgmtBackend.image.tag=latest --set pipelineBackend.image.tag=latest --set modelBackend.image.tag=latest --set artifactBackend.image.tag=latest --set console.image.tag=latest --set rayService.image.tag=latest --set tags.observability=false --set tags.prometheusStack=false'
alias hir='helm install core charts/core --namespace instill-ai --create-namespace --set apiGateway.image.tag=latest --set mgmtBackend.image.tag=latest --set pipelineBackend.image.tag=latest --set modelBackend.image.tag=latest --set artifactBackend.image.tag=latest --set console.image.tag=latest --set rayService.namespaceOverride=ray --set tags.observability=false --set tags.prometheusStack=false --set tags.ray=false'


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
