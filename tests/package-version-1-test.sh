#!/usr/bin/env roundup
#
#/ usage:  rerun stubbs:test -m bintray -p package-version [--answers <>]
#

set -u

# Helpers
# -------
[[ -f ./functions.sh ]] && . ./functions.sh

rerun() {
  command $RERUN -M $RERUN_MODULES "$@"
}

# Constants

DEFAULT_ORG="example-org"
DEFAULT_REPO="example-repo"
DEFAULT_PACKAGE="example-package"

DEFAULT_VERSIONS=$(cat <<END_HEREDOC
1.0.0
1.0.3
1.4.0
END_HEREDOC
)

DEFAULT_PACKAGE_RESPONSE_MOCK=$(cat <<'END_HEREDOC'
<html>
<head>
<script>
//1507586309599
function navi(e){
	location.href = e.target.href.replace('/:','/'); e.preventDefault();
}
</script>
</head>
<body>
<pre><a onclick="navi(event)" href=":1.0.0/" rel="nofollow">1.0.0/</a></pre>
<pre><a onclick="navi(event)" href=":1.0.3/" rel="nofollow">1.0.3/</a></pre>
<pre><a onclick="navi(event)" href=":1.4.0/" rel="nofollow">1.4.0/</a></pre>
</body>
</html>
END_HEREDOC
)

DEFAULT_PACKAGE_RESPONSE_ERROR_MOCK="The requested path was not found."

DEFAULT_CURL_MOCK_TEMPFILE="/tmp/curl_mock_counter"

# The Plan
# --------
describe "package-version"

after() {
  if [ -e $DEFAULT_CURL_MOCK_TEMPFILE ]; then
    rm $DEFAULT_CURL_MOCK_TEMPFILE
  fi
}

# ------------------------------
it_errors_when_no_versions_are_found() {
  # mock the curl calls
  export DEFAULT_PACKAGE_RESPONSE_ERROR_MOCK
  export DEFAULT_CURL_MOCK_TEMPFILE
  echo 0 > $DEFAULT_CURL_MOCK_TEMPFILE
  curl () {
    curl_mock_counter=$(cat $DEFAULT_CURL_MOCK_TEMPFILE)
    case $curl_mock_counter in
      0)
        echo "$DEFAULT_PACKAGE_RESPONSE_ERROR_MOCK"
        echo 1 > $DEFAULT_CURL_MOCK_TEMPFILE
        return 0
        ;;
      *)
        echo >&2 "unexpected call to curl: $@"
        return 1
    esac
    
    return 1
  }
  export -f curl
  
  # invoke rerun
  local exitcode=
  $(rerun bintray: package-version \
      --org "$DEFAULT_ORG" \
      --repo "$DEFAULT_REPO" \
      --package "$DEFAULT_PACKAGE") && {
    echo >&2 "rerun test command succeeded"; return 1
  } || {
    exitcode=$?; test $exitcode -eq 3
  } || {
    echo >&2 "rerun test command failed with exit code: $exitcode"; return 1
  }
}
# ------------------------------
it_returns_req_package_versions() {
  # mock the curl calls
  export DEFAULT_PACKAGE_RESPONSE_MOCK
  export DEFAULT_CURL_MOCK_TEMPFILE
  echo 0 > $DEFAULT_CURL_MOCK_TEMPFILE
  curl () {
    curl_mock_counter=$(cat $DEFAULT_CURL_MOCK_TEMPFILE)
    case $curl_mock_counter in
      0)
        echo "$DEFAULT_PACKAGE_RESPONSE_MOCK"
        echo 1 > $DEFAULT_CURL_MOCK_TEMPFILE
        return 0
        ;;
      *)
        echo >&2 "unexpected call to curl: $@"
        return 1
    esac
    
    return 1
  }
  export -f curl
  
  # invoke rerun
  requested_package_versions=$(rerun bintray: package-version \
    --org "$DEFAULT_ORG" \
    --repo "$DEFAULT_REPO" \
    --package "$DEFAULT_PACKAGE") || echo >&2 "rerun test call failed with exit code: $?"
  
  # validate results
  test "$requested_package_versions" == "$DEFAULT_VERSIONS"
}
# ------------------------------
