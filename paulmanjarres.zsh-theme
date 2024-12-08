
# Based on RobbyRussel

prompt_dir() {
  echo '%{$fg[cyan]%} %~'
}

prompt_time(){
    echo '%{$fg[yellow]%}[%D{%K:%M:%S}]'
}

#PROMPT="%(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} ) %{$fg[cyan]%} %~ %{$reset_color%}"
PROMPT="$(prompt_time)%(?:%{$fg_bold[green]%}%1{➜%}:%{$fg_bold[red]%}%1{➜%})$(prompt_dir)%{$reset_color%} "
PROMPT+='$(git_prompt_info)'


ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"