zmodload zsh/zprof
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/sentinel/.oh-my-zsh"

ZSH_THEME="robbyrussell"

HISTCONTROL=ignoredups:ignorespace
HIST_STAMPS="dd.mm.yyyy"

plugins=(
	zshfl
    ubuntu
	git
	history
	zsh-autosuggestions
	zsh-syntax-highlighting
	)


source $ZSH/oh-my-zsh.sh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=243,underline"
ZSH_AUTOSUGGEST_USE_ASYNC="true"

# User configuration
export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


# -- Alias -------------------------------------------------------------------------------------------------------
alias python="python3"
alias zshconfig="vim ~/.zshrc"
alias lc="colorls"
alias zshsrc="source ~/.zshrc"
alias lua-format="/home/sentinel/.luarocks/lib/luarocks/rocks-5.4/luaformatter/scm-1/bin/lua-format"
alias rng="ranger"

# To get info about the git commits in local repo.
alias gitinfo="git log --oneline | fzf --preview 'git show --name-only {1}'"
# To get info about processess.
alias psinfo="ps axo pid,rss,comm --no-headers | fzf --preview 'ps o args {1}; ps mu {1}'"
# To get info about apt dependencies.
# alias dependinfo="apt-cache search . | fzf --preview 'apt-cache depends {1}'"

# ----------------------------------------------------------------------------------------------------------------


# -- JENV --------------------------------------------------------------------------------------------------------
# Try to find jenv, if it's not on the path
export JENV_ROOT="${JENV_ROOT:=${HOME}/.jenv}"
if ! type jenv > /dev/null && [ -f "${JENV_ROOT}/bin/jenv" ]; then
    export PATH="${JENV_ROOT}/bin:${PATH}"
fi

# Lazy load jenv
if type jenv > /dev/null; then
    export PATH="${JENV_ROOT}/bin:${JENV_ROOT}/shims:${PATH}"
    function jenv() {
        unset -f jenv
        eval "$(command jenv init -)"
        jenv $@
    }
fi

# ----------------------------------------------------------------------------------------------------------------


# -- FZF ---------------------------------------------------------------------------------------------------------
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!{.git,node_modules}/*" 2> /dev/null'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# ----------------------------------------------------------------------------------------------------------------


# Colorls
source $(dirname $(gem which colorls))/tab_complete.sh

# dotfiles
export DOTFILES_REPO_PATH="~/gitRepos/MyDotFiles"
