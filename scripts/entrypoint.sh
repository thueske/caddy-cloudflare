#!/bin/bash
sh -c "/docker/reload.sh &"
exec "$@"
