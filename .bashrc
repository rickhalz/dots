#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='exa --color=always'
alias ll='ls -al'
alias grep='grep --color=auto'
alias wifi='nmcli dev wifi'
alias gw="nmcli dev wifi list > tempWifi.txt"

function __prompt_command__(){

	local status="$?"

	local reset_col='\[\e[0m\]'
	local red='\[\e[1;31m\]'
	local green='\[\e[1;32m\]'
	local orange='\[\e[1;33m\]'
	local blue='\[\e[1;34m\]'
	local purple='\[\e[1;35m\]'
	local white='\[\e[1;37m\]'

  if [[ $status != 0 ]]; then
	  PS1="${red}「"
  else
	  PS1="${orange}「"
  fi

	if [[ $status != 0 ]]; then
    PS1+="${red}\u "
  else
	  PS1+="${green}\u"
  fi

	if [[ $status != 0 ]]; then
		PS1+="${red} ${red}Arch"
	else
		PS1+="${blue}  ${blue}Arch"
	fi

	if [[ $status != 0 ]]; then
	  PS1+="${red} 」"
  else
	  PS1+="${orange} 」"
  fi

	if [[ $status != 0 ]]; then
		PS1+="${red}"
	else
		PS1+="${white}"
	fi

	PS1+="\w $"
	PS1+="${reset_col} "
}

PROMPT_COMMAND=__prompt_command__

shopt -s cdspell
export LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_md=$'\e[1;31m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;32m'

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

export XDG_RUNTIME_DIR=/run/user/$UID
export XDG_DATA_DIRS="$HOME/.local/xdg:/usr/share"
