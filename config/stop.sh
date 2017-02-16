#!/usr/bin/env bash
kill -9 $(pidof uwsgi|sed 's/\([0-9]*\)/\1/g')