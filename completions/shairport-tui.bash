_shairport_tui()
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts="--help --version --interval --doctor --clear-history --config --write-config --no-color"

    case "$prev" in
        --interval|-i|--config)
            return 0
            ;;
    esac

    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
complete -F _shairport_tui shairport-tui
