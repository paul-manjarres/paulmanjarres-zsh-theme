
# Based on RobbyRussel

# https://lambdaland.org/posts/2024-08-19_fancy_eshell_prompt/
# https://gist.github.com/reecefowell/fb52c6daf4d89baea2dc9533b0e3d894
# git config --add oh-my-zsh.hide-status 1
# -> git config --add oh-my-zsh.hide-dirty 1

function git_prompt_info() {
  local ref
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    #echo "$(parse_git_dirty)${ref#refs/heads/}"
    echo "${ref#refs/heads/}"
  fi
}

function git_dirty {
  if [[ $(git status --porcelain 2> /dev/null) ]]; then
    [[ $(date +%u) -lt 5 && $(date +%H) -lt 20 ]] && echo "" || echo "*"
  fi
}

# function parse_git_dirty {
#   [[ $(git status --porcelain 2> /dev/null) ]] && echo "*"
# }


prompt_dir() {
  echo '%{$fg[cyan]%} %~%{$reset_color%}'
}

prompt_time(){
    #echo '%{$fg[yellow]%}[%D{%K:%M:%S}]%{$reset_color%}'
    echo '%{$fg[yellow]%}[%*]%{$reset_color%}'
}

prompt_lastcommand_result(){
    echo '%(?:%{$fg_bold[green]%}%1{➜%}:%{$fg_bold[red]%}%1{X%})'
}

# Prompts the current branch
prompt_current_branch(){
    pr=$(git_prompt_info)
    if [[ -z $pr ]]; then
      return
    fi
    dirty=$(git_dirty)
    if [[ -n $dirty ]]; then
      echo "%{$bg[yellow]%}%{$fg[black]%} $ZSH_THEME_GIT_PROMPT_PREFIX$pr * $ZSH_THEME_GIT_PROMPT_SUFFIX"
    else
      echo "%{$bg[green]%}%{$fg[black]%} $ZSH_THEME_GIT_PROMPT_PREFIX$pr $ZSH_THEME_GIT_PROMPT_SUFFIX"
    fi
}


#PROMPT="%(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} ) %{$fg[cyan]%} %~ %{$reset_color%}"
PROMPT="%{%f%b%k%}$(prompt_time) $(prompt_lastcommand_result)$(prompt_dir) "
PROMPT+='$(prompt_current_branch) %{$reset_color%} 
└──> $%{$reset_color%} '

RPROMPT='$(git_prompt_short_sha)'

#ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
#ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{✗%}"

ZSH_THEME_GIT_PROMPT_SHA_BEFORE="➤%{%F{yellow}%}["
ZSH_THEME_GIT_PROMPT_SHA_AFTER="]%{$reset_color%}"

#ZSH_THEME_GIT_PROMPT_PREFIX="%{%F{green}%}\ue727 "
ZSH_THEME_GIT_PROMPT_PREFIX="\ue727 "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} *%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{%F{red}%} !%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{%F{green}%} ✓%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"