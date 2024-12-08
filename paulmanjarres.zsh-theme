
# Based on RobbyRussel

prompt_dir() {
  echo '%{$fg[cyan]%} %~'
}

prompt_time(){
    echo '%{$fg[yellow]%}[%D{%K:%M:%S}]'
}

prompt_lastcommand_result(){
    echo '%(?:%{$fg_bold[green]%}%1{➜%}:%{$fg_bold[red]%}%1{X%})'
}

#PROMPT="%(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} ) %{$fg[cyan]%} %~ %{$reset_color%}"
PROMPT="%{%f%b%k%}$(prompt_time) $(prompt_lastcommand_result)$(prompt_dir) "
PROMPT+='$(git_prompt_info)%{$reset_color%} > '


#ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
#ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{✗%}"
#ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"


# Format for git_prompt_long_sha() and git_prompt_short_sha()
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="➤ %{%F{yellow}%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{%F{green}%}| \ue727 "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ⚡%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{%F{red}%} !%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_CLEAN="%{%F{green}%} ✓%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{%F{green}%} ✓"

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"