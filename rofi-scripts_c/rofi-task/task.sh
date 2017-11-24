#PUT THIS FILE IN ~/.local/share/rofi/finder.sh
#USE: rofi  -show find -modi find:~/.local/share/rofi/finder.sh
if [ ! -z "$@" ]
then
  QUERY=$@
  regex="[:digit:]+.*"
  echo "$QUERY"
  if [[ $QUERY =~ [[:digit:]]+.* ]]
  then
    #coproc ( exo-open "${QUERY%\/* \?\?}"  > /dev/null 2>&1 )
    KILL=$(echo "$QUERY" | sed -e 's/\([0-9]\+\).*/\1/g')
    kill $KILL
    exec 1>&-
    exit;
  else
    if ! locate "${QUERY#!}"; then
      echo "-- No results found --"
    fi
  fi
else
  ps x -u hapax
fi
