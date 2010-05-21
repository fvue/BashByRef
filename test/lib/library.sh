# Bash library for `upvar' DejaGnu testsuite


# Diff environment files to detect if environment is unmodified
# @param $1  File 1
# @param $2  File 2
# @param $3  Additional sed script
diff_env() {
    diff "$1" "$2" | sed -e "
# Remove diff line indicators
        /^[0-9,]\{1,\}[acd]/d
# Remove diff block separators
        /---/d
# Remove underscore variable
        /[<>] _=/d
# Remove PPID bash variable
        /[<>] PPID=/d
        $3"
} # diff_env()


# Check if current bash version meets specified minimum
# @param $1  (integer) Major version number
# @param $2  (integer) Minor version number
# @param $3  (integer) Patch level
# @return  0 if success, > 0 if not
is_bash_version_minimal() {
    [[      (
                ${BASH_VERSINFO[0]} -gt $1
            ) || (
                ${BASH_VERSINFO[0]} -eq $1 &&
                ${BASH_VERSINFO[1]} -gt $2
            ) || (
                ${BASH_VERSINFO[0]} -eq $1 &&
                ${BASH_VERSINFO[1]} -eq $2 &&
                ${BASH_VERSINFO[2]} -ge $3
            )
    ]]
} # is_bash_version_minimal()


