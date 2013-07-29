alias run_proxy='ssh -D 1080 root@yellowelly.vm.bytemark.co.uk'
alias yello='ssh marty@yellowelly.vm.bytemark.co.uk'
#alias cdc='cd /Users/Marty/sharehood/holdingpage && heroku accounts:set sharehood-tech'
alias cdc='cd /Users/Marty/sharehood/sharehood && heroku accounts:set martyzz1 && source development.env'
alias cdd='cd /Users/Marty/sharehood/sharehoodadmin && heroku accounts:set martyzz1 && source development.env'
alias cdz='cd /Users/Marty/sharehood/sharehoodmonitor && heroku accounts:set martyzz1 && source development.env'
alias cdm='cd /Users/Marty/sharehood/migreat && heroku accounts:set martyzz1 && source development.env'
alias cdb='cd /Users/Marty/newsworthysw && heroku accounts:set newsworthys-tech && source venv/bin/activate'
alias cds='cd /Users/Marty/newsworthy && heroku accounts:set martyzz1'
alias cdv='cd /Users/Marty/vagrant'
alias cdw='cd /Users/Marty/sharehood/heroku_proc_scalar && heroku accounts:set martyzz1'
alias cda='cd /Users/Marty/sharehood/heroku_proc_scalar_app && source venv/bin/activate && heroku accounts:set martyzz1'
alias cdf='cd /Users/Marty/sharehood/sharehood_fabric/'
alias ga='git commit -a'
alias gm='git commit -am"Minor tweak"'
alias gp='gn git push heroku master'
alias gph='gn git push heroku master'
alias gpg='gn git push origin'
alias gs='git commit -am"Fixed Syntax Error"'
alias hps='heroku ps'
alias t='heroku logs --tail'
alias tw='heroku logs --tail --ps worker'
alias h='history'
alias ll='ls -al'
alias pm='foreman start -f Procfile.dev'
alias pma='python manage.py runserver 9001'
alias ss='heroku accounts:set sharehood-tech'
alias sm='heroku accounts:set martyzz1'
alias vup='cd /Users/Marty/vagrant && vagrant up'
alias vdown='cd /Users/Marty/vagrant && vagrant halt'
alias vmup='cd /Users/Marty/newsworthysvm && vagrant up'
alias vmdown='cd /Users/Marty/newsworthysvm && vagrant halt'
[[ -s $HOME/.pythonbrew/etc/bashrc ]] && source $HOME/.pythonbrew/etc/bashrc
source ~/environment/git-completion.bash
source ~/environment/git-prompt.bash
#PS1="[\[\033[0;33m\]"'$(__git_ps1 "%s " ; perl -e "print $^V ")'"\[\033[1;31m\]"'$(__slando_git_test_and_fetch)'"\[\033[0;32m\]\t \[\033[0;34m\]\W\[\033[0m\]]\\$ "
#export PS1

source ~/bin/ps1.sh

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=/usr/local/bin:/usr/local/sbin:$PATH:$HOME/git-hooks:/usr/local/share/npm/bin # Add RVM to PATH for scripting

#
# Bash completion for fabric
#
function _fab_complete() {
    local cur
    if [[ -f "fabfile.py" || -d "fabfile" ]]; then
cur="${COMP_WORDS[COMP_CWORD]}"
        COMPREPLY=( $(compgen -W "$(fab -F short -l)" -- ${cur}) )
        return 0
    else
        # no fabfile.py found. Don't do anything.
        return 1
    fi
}
