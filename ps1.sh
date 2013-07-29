c_cyan=`tput setaf 6`
c_white=`tput setaf 7`
c_red=`tput setaf 1`
c_green=`tput setaf 2`
c_blue=`tput setaf 4`
c_yellow=`tput setaf 3`
c_sgr0=`tput sgr0`

function branch_color ()
{
    if git rev-parse --git-dir >/dev/null 2>&1
    then
        color=""
        if git diff --quiet 2>/dev/null >&2
        then
            color="${c_green}"
        else
            color=${c_red}
        fi
    else
        return 0
    fi
    printf $color
}

function git_branch ()
{
    if git rev-parse --git-dir >/dev/null 2>&1
    then
        gitver=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
    else
        return 0
    fi
    echo -e " "$gitver""
}

function python_version() {
    echo -n $c_blue $(python --version &> /dev/stdout)
}

function django_version() {
    if [ -z "$(which django-admin.py)" ]
    then
        return
    fi
    echo -n "$c_yellow Django" $(django-admin.py --version)
}

function linebreak() {
    echo -e $c_sgr0 '\n$ ';
}

#export PS1="\u $c_cyan\w"
#export PS1="[\[\`branch_color\`\`git_branch\`\]"

#if [ -z "$PS1_INCLUDE_PYTHON" ]
#then
    #PS1_EXCLUDE_PYTHON=1
#fi
#
## The idea of this is: before source this export PS1_EXCLUDE_PYTHON=1
#if [ "$PS1_EXCLUDE_PYTHON" -ne 1 ]
#then
    #export PS1="$PS1\`python_version\`"
#fi

#export PS1="[\`branch_color\`\`git_branch\` $c_green\t $c_blue\w$c_sgr0]\\$"
#export PS1="[\[$PS1\] \[$c_blue\]\w\[$c_sgr0\]]\\$ "
#export PS1="$PS1\`linebreak\`"

#PS1="[\[\033[0;33m\]"'$(__git_ps1)'" \[\033[0;32m\]\t \[\033[0;34m\]\W\[\033[0m\]]\\$ "
PS1="[\[\`branch_color\`\]"'$(__git_ps1)'" \t \[\033[0;34m\]\w\[\033[0m\]]\\$ "
export PS1
