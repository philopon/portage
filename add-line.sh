#!/bin/bash

PWD=$(cd `dirname $0`; pwd)

CNF=/etc/portage/make.conf

if `grep PORTDIR_OVERLAY $CNF | grep -v $PWD > /dev/null`; then
  echo "PORTDIR_OVERLAY=\"$PWD \$PORTDIR_OVERLAY\"" >> $CNF
elif ! `grep PORTDIR_OVERLAY $CNF > /dev/null`; then
  echo "PORTDIR_OVERLAY=\"$PWD\"" >> $CNF
fi


