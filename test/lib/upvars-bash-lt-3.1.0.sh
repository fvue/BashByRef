# Param $1  (optional) name of variable to return value to
return_empty_optional_value() {
    local a vars=() args=()
    if [[ "$1" ]]; then
        vars[${#vars[*]}]="$1"
        args=("${args[@]}" -v "$1" "$a")
    fi
    (( ${#vars[@]} )) && local "${vars[@]}" && upvars "${args[@]}"
}

# Params $1..$2  (optional) name of variables to return values to
return_optional_values() {
    local a=foo b=
    [[ "$1" || "$2" ]] && local ${1+"$1"} ${2+"$2"} && \
        upvars ${1+-v $1 $a} ${2+-v $2 "$b"}
}

# Params $*  (optional) names of variables to return values to.
#            Supported variable names are:
#            - A1:  Return array 1
#            - A2:  Return array 2
#            - V1:  Return value 1
#            - V2:  Return value 2
return_optional_vars() {
    local a1 a2 upargs upvars v1=foo v2 var
    a1=(bar "cee  dee") a2=() upargs=() upvars=()
    for var; do
        case $var in
            A1) upargs=("${upargs[@]}" -a${#a1[@]} $var "${a1[@]}") ;;
            A2) upargs=("${upargs[@]}" -a${#a2[@]} $var "${a2[@]}") ;;
            V1) upargs=("${upargs[@]}" -v $var "$v1") ;;
            V2) upargs=("${upargs[@]}" -v $var "$v2") ;;
            *) echo "bash: ${FUNCNAME[0]}: \`$var': unknown variable"
               return 1 ;;
        esac
        upvars=("${upvars[@]}" "$var")
    done
    (( ${#upvars[@]} )) && local "${upvars[@]}" && upvars "${upargs[@]}"
}

# Param $1  Name of variable to return array to
return_array() {
    local r
    r=(e1 e2 "e3  e4" $'e5\ne6')
    local "$1" && upvars -a${#r[@]} $1 "${r[@]}"
}
