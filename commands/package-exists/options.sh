# Generated by stubbs:add-option. Do not edit, if using stubbs.
# Created: Sat May 18 16:45:31 PDT 2013
#
#/ usage: bintray:package-exists  --user <>  --apikey <>  --org <>  --package <>  --repo <> 

# _rerun_options_parse_ - Parse the command arguments and set option variables.
#
#     rerun_options_parse "$@"
#
# Arguments:
#
# * the command options and their arguments
#
# Notes:
# 
# * Sets shell variables for any parsed options.
# * The "-?" help argument prints command usage and will exit 2.
# * Return 0 for successful option parse.
#
rerun_options_parse() {

    while [ "$#" -gt 0 ]; do
        OPT="$1"
        case "$OPT" in
            --user) rerun_option_check $# $1; USER=$2 ; shift ;;
            --apikey) rerun_option_check $# $1; APIKEY=$2 ; shift ;;
            --org) rerun_option_check $# $1; ORG=$2 ; shift ;;
            --package) rerun_option_check $# $1; PACKAGE=$2 ; shift ;;
            --repo) rerun_option_check $# $1; REPO=$2 ; shift ;;
            # help option
            -?)
                rerun_option_usage
                exit 2
                ;;
            # end of options, just arguments left
            *)
              break
        esac
        shift
    done

    # Set defaultable options.

    # Check required options are set
    [ -z "$USER" ] && { echo >&2 "missing required option: --user" ; return 2 ; }
    [ -z "$APIKEY" ] && { echo >&2 "missing required option: --apikey" ; return 2 ; }
    [ -z "$ORG" ] && { echo >&2 "missing required option: --org" ; return 2 ; }
    [ -z "$PACKAGE" ] && { echo >&2 "missing required option: --package" ; return 2 ; }
    [ -z "$REPO" ] && { echo >&2 "missing required option: --repo" ; return 2 ; }
    # If option variables are declared exportable, export them.

    #
    return 0
}


# Initialize the options variables to null.
USER=
APIKEY=
ORG=
PACKAGE=
REPO=


