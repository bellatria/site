#!/bin/bash

# fillvar.sh - simple script to 'fill in' area between two HTML comments.
#
# all comments must start with <!-- BEGIN VARNAME --> and end with
# <!-- END VARNAME -->. Uses sed to do the filling. Replaces one and only one
# named variable, but replaces all instances of it throughout the code-base.
#
# operates on directory recursively. does NOT perform recursive var
# substitutions.
#
# usage: fillvar.sh VARNAME [-v value | -f file] PATH

# parse args
PARAMS=""
already_set=
val=
while (( "$#" )); do
  case "$1" in
    -v|--value)
      [ -z "$already_set" ] || { echo "can't have multiple -v/-f flags; pick exactly one" >&2 ; exit 1 ; }
      already_set=1
      val="$2"

      shift 2
      ;;
    -f|--file)
      [ -z "$already_set" ] || { echo "can't have multiple -v/-f flags; pick exactly one" >&2 ; exit 1 ; }
      [ -f "$2" ] || { echo "can't open $2 as a regular file" >&2 ; exit 2 ; }
      val="$(<"$2")"
      already_set=1

      shift 2
      ;;
    -h|--help)
      echo "usage: $0 VARNAME [<flags>] PATH"
      echo "Substitutes a single variable in HTML"
      echo ""
      echo "Flags:"
      echo '  -h, --help                      Show this help and exit'
      echo '  -v, --value "VALUE"             Use VALUE for the value of the variable'
      echo '  -f, --file "FILENAME"           Use contents of file FILENAME for the value of the variable'
      echo '      --                          Flag end marker; no flags after this will be parsed'
      exit 0
      ;;
    --) # end argument parsing
      shift
      break
      ;;
    -*|--*=) # unsupported flags
      echo "Error: Unsupported flag $1" >&2
	  echo "Invoke with -h or --help for help" >&2
      exit 1
      ;;
    *) # preserve positional arguments
      PARAMS="$PARAMS $1"
      shift
      ;;
  esac
done
# set positional arguments in their proper place
eval set -- "$PARAMS"

[ $# -ge 2 ] || { echo "Error: must give variable name and path to workdir" >&2 ; exit 3 ; }
name="$1"
path="$2"

if [ -d "$path" ]
then
  # recursive mode
  for file in $(find docs -iname '*.html'  -type f -print)
  do
    "$(dirname "$0")"/fill.py "$name" "$val" "$file"
  done
else
    "$(dirname "$0")"/fill.py "$name" "$val" "$path"
fi