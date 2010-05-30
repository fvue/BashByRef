# Params $1..$2  (optional) name of variables to return values to
return_two_optional_values() {
    local a=foo b=bar
    [[ "$1" || "$2" ]] && local ${1+"$1"} ${2+"$2"} && \
        upvars ${1+-v $1 $a} ${2+-v $2 $b}
}

# Params $1..$2  (optional) name of variables to return arrays to
return_two_optional_arrays() {
    local a b
    a=(foo bar); b=(cee dee)
    [[ "$1" || "$2" ]] && local ${1+"$1"} ${2+"$2"} && \
        upvars ${1+-a${#a[@]} $1 "${a[@]}"} ${2+-a${#b[@]} $2 "${b[@]}"}
}

# Param $1  Name of variable to return array to
return_array() {
    local r
    r=(e1 e2 "e3  e4" $'e5\ne6')
    local "$1" && upvars -a${#r[@]} $1 "${r[@]}"
}
