# vim:et sts=2 sw=2 ft=zsh
#
# Gitster theme
# https://github.com/shashankmehta/dotfiles/blob/master/thesetup/zsh/.oh-my-zsh/custom/themes/gitster.zsh-theme
#
# Requires the `prompt-pwd` and `git-info` zmodules to be included in the .zimrc file.

setopt nopromptbang prompt{cr,percent,sp,subst}

zstyle ':zim:prompt-pwd' git-root yes
zstyle ':zim:prompt-pwd:tail' length 1

typeset -gA git_info
if (( ${+functions[git-info]} )); then
  zstyle ':zim:git-info:branch' format '(%b)'
  zstyle ':zim:git-info:commit' format '%c'
  zstyle ':zim:git-info:clean' format '%F{green}%{%G✓%}'
  zstyle ':zim:git-info:dirty' format '%F{yellow}%{%G✗%}'
  zstyle ':zim:git-info:keys' format \
      'prompt' ' %F{cyan}%b%c %C%D'

  autoload -Uz add-zsh-hook && add-zsh-hook precmd git-info
fi

PS1='${VIRTUAL_ENV_PROMPT:+"($VIRTUAL_ENV_PROMPT) "}%B%(?:%F{green}:%F{red})%{%G➜%} %F{#7c6f64}$(prompt-pwd)${(e)git_info[prompt]}%f%b '
unset RPS1
