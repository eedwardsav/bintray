# Generated by stubbs:add-option. Do not edit, if using stubbs.
# Created: Tue Oct 10 22:48:39 CDT 2017
#
#/ usage: bintray:package-upload-deb  --file <>  --org <>  --repo <>  --version <>  --user <>  --package <> [ --descriptor <descriptor.json>]  --deb_distribution <precise,trusty,sqeeze,wheezy>  --deb_component <main>  --deb_architecture <amd64>  --apikey <> 

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
  
    unrecognized_args=()

    while (( "$#" > 0 ))
    do
        OPT="$1"
        case "$OPT" in
            --file) rerun_option_check $# $1; FILE=$2 ; shift 2 ;;
            --org) rerun_option_check $# $1; ORG=$2 ; shift 2 ;;
            --repo) rerun_option_check $# $1; REPO=$2 ; shift 2 ;;
            --version) rerun_option_check $# $1; VERSION=$2 ; shift 2 ;;
            --user) rerun_option_check $# $1; USER=$2 ; shift 2 ;;
            --package) rerun_option_check $# $1; PACKAGE=$2 ; shift 2 ;;
            --descriptor) rerun_option_check $# $1; DESCRIPTOR=$2 ; shift 2 ;;
            --deb_distribution) rerun_option_check $# $1; DEB_DISTRIBUTION=$2 ; shift 2 ;;
            --deb_component) rerun_option_check $# $1; DEB_COMPONENT=$2 ; shift 2 ;;
            --deb_architecture) rerun_option_check $# $1; DEB_ARCHITECTURE=$2 ; shift 2 ;;
            --apikey) rerun_option_check $# $1; APIKEY=$2 ; shift 2 ;;
            # help option
            -\?|--help)
                rerun_option_usage
                exit 2
                ;;
            # unrecognized arguments
            *)
              unrecognized_args+=("$OPT")
              shift
              ;;
        esac
    done

    # Set defaultable options.
    [[ -z "$DESCRIPTOR" ]] && DESCRIPTOR="$(rerun_property_get $RERUN_MODULE_DIR/options/descriptor DEFAULT)"
    [[ -z "$DEB_DISTRIBUTION" ]] && DEB_DISTRIBUTION="$(rerun_property_get $RERUN_MODULE_DIR/options/deb_distribution DEFAULT)"
    [[ -z "$DEB_COMPONENT" ]] && DEB_COMPONENT="$(rerun_property_get $RERUN_MODULE_DIR/options/deb_component DEFAULT)"
    [[ -z "$DEB_ARCHITECTURE" ]] && DEB_ARCHITECTURE="$(rerun_property_get $RERUN_MODULE_DIR/options/deb_architecture DEFAULT)"
    # Check required options are set
    [[ -z "$FILE" ]] && { echo >&2 "missing required option: --file" ; return 2 ; }
    [[ -z "$ORG" ]] && { echo >&2 "missing required option: --org" ; return 2 ; }
    [[ -z "$REPO" ]] && { echo >&2 "missing required option: --repo" ; return 2 ; }
    [[ -z "$VERSION" ]] && { echo >&2 "missing required option: --version" ; return 2 ; }
    [[ -z "$USER" ]] && { echo >&2 "missing required option: --user" ; return 2 ; }
    [[ -z "$PACKAGE" ]] && { echo >&2 "missing required option: --package" ; return 2 ; }
    [[ -z "$DEB_DISTRIBUTION" ]] && { echo >&2 "missing required option: --deb_distribution" ; return 2 ; }
    [[ -z "$DEB_COMPONENT" ]] && { echo >&2 "missing required option: --deb_component" ; return 2 ; }
    [[ -z "$DEB_ARCHITECTURE" ]] && { echo >&2 "missing required option: --deb_architecture" ; return 2 ; }
    [[ -z "$APIKEY" ]] && { echo >&2 "missing required option: --apikey" ; return 2 ; }
    # If option variables are declared exportable, export them.

    # Make unrecognized command line options available in $_CMD_LINE
    if [ ${#unrecognized_args[@]} -gt 0 ]; then
      export _CMD_LINE="${unrecognized_args[@]}"
    fi
    #
    return 0
}


# If not already set, initialize the options variables to null.
: ${FILE:=}
: ${ORG:=}
: ${REPO:=}
: ${VERSION:=}
: ${USER:=}
: ${PACKAGE:=}
: ${DESCRIPTOR:=}
: ${DEB_DISTRIBUTION:=}
: ${DEB_COMPONENT:=}
: ${DEB_ARCHITECTURE:=}
: ${APIKEY:=}
# Default command line to null if not set
: ${_CMD_LINE:=}


