#PUT THIS FILE IN ~/.local/share/rofi/finder.sh
#USE: rofi  -show find -modi find:~/.local/share/rofi/finder.sh
if [ ! -z "$@" ]
then
  QUERY=$@
  if [[ "$@" == /* ]]
  then
    if [[ "$@" == *\?\? ]]
    then
      coproc ( exo-open "${QUERY%\/* \?\?}"  > /dev/null 2>&1 )
      exec 1>&-
      exit;
    else
      coproc ( exo-open "$@"  > /dev/null 2>&1 )
      exec 1>&-
      exit;
    fi
  elif [[ "$@" == \!\!* ]]
  then
    echo "!!-- Type your search query to find files"
    echo "!!-- To seach again type !<search_query>"
    echo "!!-- To seach parent directories type ?<search_query>"
    echo "!!-- You can print this help by typing !!"
  elif [[ "$@" == \?* ]]
  then
    while read -r line; do
      if [[ "$line" == "" ]]
      then
        echo "-- No results found --"
      else
        echo "$line" \?\?
      fi
    done <<< $(locate "${QUERY#\?}")
  else
    if ! locate "${QUERY#!}"; then
      echo "-- No results found --"
    fi
  fi
else
  echo "!!-- Type your search query to find files"
  echo "!!-- To seach again type !<search_query>"
  echo "!!-- To seach parent directories type ?<search_query>"
  echo "!!-- You can print this help by typing !!"
fi
