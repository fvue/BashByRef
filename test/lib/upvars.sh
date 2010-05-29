# Params $1..$2  (optional) name of variables to return values to
return_two_optional_values() {
    local a=foo b=bar
    [[ "$1" || "$2" ]] && local ${1+"$1"} ${2+"$2"} && \
        upvars ${1+-v $1 $a} ${2+-v $2 $b}
}

# Params $1..$2  (optional) name of variables to return arrays to
return_two_optional_arrays() {
    local a=(foo bar) b=(cee dee)
    [[ "$1" || "$2" ]] && local ${1+"$1"} ${2+"$2"} && \
        upvars ${1+-a${#a[@]} $1 "${a[@]}"} ${2+-a${#b[@]} $2 "${b[@]}"}
}
