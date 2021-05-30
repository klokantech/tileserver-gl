#!/bin/sh

set -e

handle() {
	SIGNAL=$(( $? - 128 ))
	echo "Caught signal ${SIGNAL}, stopping gracefully"
	kill -s ${SIGNAL} $(pidof node) 2>/dev/null
}

trap handle INT TERM

if ! which -- "${1}"; then
  # first arg is not an executable
  xvfb-run -a --server-args="-screen 0 1024x768x24" -- node /app/ "$@" &
	# Wait exits immediately on signals which have traps set. Store return value and wait
	# again for all jobs to actually complete before continuing.
	wait $! || RETVAL=$?
	wait
	exit ${RETVAL}
fi

exec "$@"
