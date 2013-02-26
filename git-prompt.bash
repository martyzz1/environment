function __slando_git_test_and_fetch {
    if [[ -d .git ]]
    then

        # To avoid printing text after the prompt has displayed, we trap the output of `git fetch` and print it next time.
        TEMPFILE="${TMPDIR:-/tmp}/$USER-git_output.txt"

        [[ -e "$TEMPFILE" ]] && cat "$TEMPFILE" >&2 2>&- && rm -f "$TEMPFILE" 2>&-

        if [[ -d .git/refs/remotes/origin/ ]] && [[ -z "$SLANDO_DISABLE_GIT_FETCH" ]] && touch -d '10 minutes ago' .previous_test_run 2>/dev/null && [[ .previous_test_run -nt .git/FETCH_HEAD ]]
        then
            git fetch -q origin >"$TEMPFILE" 2>&1 &
        fi

        if [[ -n "$SLANDO_ENABLE_GIT_PUSH" ]]
        then
            git rev-parse HEAD @{u} 2>/dev/null | {
                read FROM
                read TO
                if [[ "$FROM" != "$TO" && "$TO" != "@{u}" ]]
                then
                    echo -n "PUSH "
                fi
            }
        fi

    fi
}
