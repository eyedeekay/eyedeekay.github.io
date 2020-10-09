#! /usr/bin/env sh


if echo $1 | grep -q mp4; then
  echo "  <video>"
  echo "    <source src=\"$1\" type=\"video/mp4\">"
  echo "  </video>"
fi

if echo $1 | grep -q webm; then
  echo "  <video>"
  echo "    <source src=\"$1\" type=\"video/webm\">"
  echo "  </video>"
fi
